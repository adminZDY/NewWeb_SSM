package com.sec.news.control;

import com.alibaba.fastjson.JSONObject;
import com.sec.news.admin.biz.NewBiz;
import com.sec.news.admin.biz.TypeBiz;
import com.sec.news.dao.NewDao;
import com.sec.news.model.News;
import com.sec.news.model.PageModel;
import com.sec.news.model.Type;
import com.sec.news.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@Controller
@RequestMapping("")
public class NewController {
	
	@Resource
	NewBiz newbiz;
	@Resource
	TypeBiz typeBiz;

	/**
	 * 发布新闻
	 */
	 @RequestMapping("article_add")
	 public ModelAndView article_add(){
	 	ModelAndView mav = new ModelAndView();
	 	mav.addObject("lst",typeArrayList());

	 	mav.setViewName("manage/article_add");
	 	return mav;
	 }

	/**
	 * 编辑新闻
	 * @param newsId
	 * @return
	 */
	@RequestMapping("show_update")
	public ModelAndView show_update(int newsId){
		ModelAndView mav = new ModelAndView();

		try {
			//调用业务访问类的方法，查询新闻信息
			News news = newbiz.selectNewById(newsId);
			//将段落标签<p>转换为\r\n方便在<textarea>中显示是保持格式
			news.setContent(news.getContent().replaceAll("<p>", "\r\n"));
			mav.addObject("lst",typeArrayList());
			//将查询出的新闻信息设置到request属性中
			mav.addObject("data", news);
			//转发到修改新闻页面
			mav.setViewName("/manage/article_edit");
		} catch (Exception e) {

			mav.addObject("msg", e.getMessage());
			mav.setViewName("/manage/error");
		}
		return mav;
	}

	/**
	 * 添加新闻
	 */
	@RequestMapping("addNews")
	public ModelAndView add(News news , HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		User user = (User)request.getSession().getAttribute("user");

		news.setUser(user);
		news.setContent(news.getContent().replace("\r\n", "<p/>"));
		//调用数据访问类的方法执行插入操作
		if(newbiz.insertNews(news))
		{
			mav.setViewName("/manage/article_list");
		}
		else {
			mav.addObject("msg", "新增失败，可能是数据库错误。");
			//转发到addType.jsp页面
			//request.getRequestDispatcher("/manage/addType.jsp").forward(request, response);
			mav.setViewName("/manage/addType");
		}
		return mav;
	}

	/**
	 *
	 * 删除新闻
	 * @param newsId
	 * @return
	 */
	@RequestMapping("delete")
	public ModelAndView delete(int newsId){

	 	ModelAndView mav = new ModelAndView();
		if(newbiz.deleteNews(newsId))
		{
			//删除成功，查询最新数据
			mav.setViewName("/manage/article_list");
		}else{
			mav.addObject("msg", "删除失败，可能是数据库错误！");
			mav.setViewName("/manage/error");
		}

		return mav;
	}

	/**
	 * 修改新闻
	 * @param news
	 * @return
	 */
	@RequestMapping("update")
	public ModelAndView update(News news){

		ModelAndView mav = new ModelAndView();

		if(newbiz.updateNews(news)){
			mav.setViewName("/manage/article_list");
		}else{
			mav.setViewName("/manage/error");
		}

		return mav;
	}

	/**
	 * 预览
	 * @param news
	 * @return
	 */
	@RequestMapping("preview")
	public ModelAndView preview(News news){

		ModelAndView mav = new ModelAndView();

		News news_1  = newbiz.selectNewById(news.getNewsId());

		mav.addObject("news",news_1);
		
		mav.setViewName("/manage/preview");

		return mav;
	}

	/**
	 * 查询所有新闻类型
	 * @return
	 */
   public ArrayList<Type> typeArrayList(){

	   return typeBiz.selectType();
   }

   //分页查询
	@RequestMapping(value = "/NewsSelect",produces="application/json;charset=utf-8")
	@ResponseBody
   public String select(
			@RequestParam(value = "page",defaultValue = "0") int page,
			@RequestParam(value = "limit",defaultValue = "10") int limit,
			@RequestParam(value = "typeId",defaultValue = "0") int typeId){

	 	ArrayList data = new ArrayList();
		PageModel<News> pm = new PageModel<News>();
		pm.setPageNo((page-1)*limit);
		pm.setPageSize(limit);
		pm.setTotalRecords(newbiz.selectNewCount(typeId));//新闻总数
		pm.setData(newbiz.selectNewByPage(pm));//新闻分页查询
		for (int i = pm.getData().size()-1;i>=0;i--){
			News news = pm.getData().get(i);
			Map dataItem = new TreeMap();
			//新闻编号
			dataItem.put("newsId",news.getNewsId());
			//发布类型及作者
			dataItem.put("typeId",news.getType().getTypeId());
			dataItem.put("typeName",news.getType().getTypeName());
			//dataItem.put("userId",news.getUser().getUserId());
			dataItem.put("userName",news.getUser().getUserName());
			//新闻信息
			dataItem.put("title",news.getTitle());
			dataItem.put("keywords",news.getKeywords());
			dataItem.put("content",news.getContent());
			dataItem.put("releaseTime",news.getReleaseTime());
			dataItem.put("recommended",news.getRecommended());
			dataItem.put("click",news.getClick());
			data.add(dataItem);
		}
		JSONObject jsonObj = new JSONObject();
		//设置返回数据文本
		if(pm.getData() == null){
			jsonObj.put("data", "null");

			jsonObj.put("count", pm.getTotalRecords());

			jsonObj.put("msg", "请添加数据");

			jsonObj.put("code", 1);
		}else{
			jsonObj.put("data", data);

			jsonObj.put("count", pm.getTotalRecords());

			jsonObj.put("msg", "");

			jsonObj.put("code", 0);
		}
		return jsonObj.toString();//显示json
   }


//	@RequestMapping("queryNews")
//	@ResponseBody
//	public ModelAndView query(PageModel<News> page ,String typeId){
//
//		ModelAndView mav = new ModelAndView();
//		int pageNo = 0;//页数
//		int pageSize = 5;//每个页面显示的页数
//		int total = 0;
//		try{
//			pageNo =page.getPageNo();
//			if(pageNo < 0) {
//				pageNo = 0;
//			}
//		}catch(Exception e){
//			pageNo = 0;
//		}
//		try{
//			pageSize =page.getPageSize();
//		}catch(Exception e){
//			pageSize = 5;
//		}
//
//		page.setPageNo(pageNo);
//		page.setPageSize(pageSize);
//		if(typeId == "0" || typeId == null){
//			page.setData(newbiz.selectNewByPage(page));
//			total = newbiz.selectNewCount(0);
//
//		}else{
//			int Id = Integer.parseInt(typeId);
//			page.setData(newbiz.selectNewByType(page,Id));
//			total = newbiz.selectNewCount(Id);
//			mav.addObject("typeId",Id);
//		}
//
//		page.setTotalRecords(total);
//		page.caculateLast(total);
//		// 放入转发参数
//		mav.addObject("lst",typeArrayList());
//		mav.addObject("data", page);
//		//转到type中显示所有数据
//		// 放入jsp路径
//		mav.setViewName("/manage/article_list");
//
//		return mav;
//	}

//	@RequestMapping("deletes")
//	public ModelAndView delete(int[] idarr){
//
//		ModelAndView mav = new ModelAndView();
//		List<Integer> newsId =new ArrayList<Integer>();
//
//		for(int i = 0 ; i < idarr.length ; i++){
//			newsId.add(idarr[i]);
//		}
//
//		if(newbiz.deleteNewByArray(newsId)){
//			mav.setViewName("redirect:queryNews");
//		}else{
//			mav.addObject("msg", "删除失败！");
//			mav.setViewName("/manage/error");
//		}
//
//		return mav;
//	}

}
