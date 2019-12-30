package com.sec.news.control;

import com.alibaba.fastjson.JSONObject;
import com.sec.news.admin.biz.TypeBiz;
import com.sec.news.model.News;
import com.sec.news.model.Page;
import com.sec.news.model.PageModel;
import com.sec.news.model.Type;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@Controller
@RequestMapping("")
public class TypeController {
    @Autowired
    TypeBiz typeBiz;

    /**
     * 添加新闻类型
     * @param type
     * @return
     */
    @RequestMapping("add")
    public ModelAndView add(Type type){
        ModelAndView mav = new ModelAndView();
        if(typeBiz.vailType(type))
        {
            System.out.println(111);
            //设置提示信息
            mav.addObject("msg", "新增失败，新闻类型已经存在。");
            //转发到addType.jsp页面
           // request.getRequestDispatcher("/manage/addType.jsp").forward(request, response);
            mav.setViewName("/manage/Type_add");
        }
        //调用数据访问类的方法执行插入操作
        if(typeBiz.addType(type))
        {
            System.out.println(222);
            mav.addObject("/manage/Type_list");
        }
        else {
            mav.addObject("msg", "新增失败，可能是数据库错误。");
            //转发到addType.jsp页面
            //request.getRequestDispatcher("/manage/addType.jsp").forward(request, response);
            mav.setViewName("/manage/Type_add");
        }
        return mav;
    }

    /**
     * 删除新闻类型
     * @param typeId
     * @return
     */
    @RequestMapping("Typedelete")
    public ModelAndView Typedelete(@RequestParam(value = "typeId",defaultValue = "0") int typeId){

        ModelAndView mav = new ModelAndView();
        if(typeId != 0){
        if(typeBiz.deleteType(typeId)){
            mav.setViewName("/manage/Type_list");
        }else{
            mav.addObject("msg", "新增失败，可能是数据库错误。");
            mav.setViewName("manage/error");
        }}

        return mav;
    }

    /**
     * 修改新闻类型
     * @param type
     * @return
     */
    @RequestMapping("Typeupdate")
    public ModelAndView Typeupdate(Type type){

        ModelAndView mav = new ModelAndView();

        if(typeBiz.updateType(type)){
            mav.setViewName("/manage/Type_list");
        }else{
            mav.addObject("msg","修改失败！");
            mav.setViewName("/manage/error");
        }

        return mav;
    }

    @RequestMapping("show_Type")
    public ModelAndView show_Type(int typeId){
        ModelAndView mav = new ModelAndView();

        Type type = typeBiz.selectTypeById(typeId);

        if(type != null){
            mav.addObject("type",type);
            mav.setViewName("/manage/Type_update");
        }else{
            mav.addObject("msg","修改失败！");
            mav.setViewName("/manage/error");
        }

        return mav;
    }
    //分页查询
    @RequestMapping(value = "/TypeSelect",produces="application/json;charset=utf-8")
    @ResponseBody
    public String select(
            @RequestParam(value = "page",defaultValue = "0。") int page,
            @RequestParam(value = "limit",defaultValue = "10") int limit,
            @RequestParam(value = "typeId",defaultValue = "0") int typeId){

        ArrayList data = new ArrayList();
        PageModel<Type> pm = new PageModel<Type>();
       // pm.setPageNo(page);
        pm.setPageNo((page-1)*limit);
        pm.setPageSize(limit);
        pm.setTotalRecords(typeBiz.selctTypeCount());//新闻总数
        pm.setData(typeBiz.selectNewsTypePage(pm));//新闻分页查询
        for (int i = pm.getData().size()-1;i>=0;i--){
            Type type = pm.getData().get(i);
            Map dataItem = new TreeMap();

            //发布类型及作者
            dataItem.put("typeId",type.getTypeId());
            dataItem.put("typeName",type.getTypeName());
            //dataItem.put("userId",news.getUser().getUserId());
            dataItem.put("Remark",type.getRemark());

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


//    @RequestMapping("query")
//    public ModelAndView query(PageModel<Type> page){
//
//        ModelAndView mav = new ModelAndView();
//        int pageNo = 1;//页数
//        int pageSize = 5;//每个页面显示的页数
//        try{
//            pageNo =page.getPageNo();
//        }catch(Exception e){
//            pageNo = 1;
//        }
//        try{
//            pageSize =page.getPageSize();
//        }catch(Exception e){
//            pageSize = 5;
//        }
//
//        page.setPageNo(pageNo);
//        page.setPageSize(pageSize);
//        page.setTotalRecords(typeBiz.selctTypeCount());
//
//        ArrayList<Type> types = typeBiz.selectNewsTypePage(page);
//        System.out.println(types.size());
//        // 放入转发参数
//        mav.addObject("data", page);
//        //转到type中显示所有数据
//        // 放入jsp路径
//        mav.setViewName("index");
//
//        return mav;
//    }
}
