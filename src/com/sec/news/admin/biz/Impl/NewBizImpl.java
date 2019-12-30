package com.sec.news.admin.biz.Impl;

import com.sec.news.admin.biz.NewBiz;
import com.sec.news.dao.NewDao;
import com.sec.news.model.News;
import com.sec.news.model.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author zdy
 * @site XXX
 * @company XXX公司
 * @create 2019-11-20-17:14
 */
@Service
public class NewBizImpl implements NewBiz{

	@Autowired
	NewDao newDao;

	@Override
	public int selectNewCount(int Id)
	{
		return newDao.selectNewsCount(Id);
	}

	@Override
	public ArrayList<News> selectNewByType(PageModel<News> pm, int id) {
		return newDao.selectNewsIdByPage(pm, id);
	}

	public boolean insertNews(News news) {
		// TODO Auto-generated method stub
		return newDao.insertNews(news) > 0;
	}

	public boolean updateNews(News news) {
		// TODO Auto-generated method stub
		return newDao.updateNews(news) > 0;
	}

	public boolean deleteNews(int newsId) {
		// TODO Auto-generated method stub
		return newDao.deleteNews(newsId) > 0;
	}

	@Override
	public boolean deleteNewByArray(List<Integer> newsId) {
		return newDao.deleteNewByArray(newsId) > 0;
	}

	public ArrayList<News> selectNews() {
		// TODO Auto-generated method stub
		return newDao.selectNews();
	}

	@Override
	public ArrayList<News> selectNewByPage(PageModel<News> pm) {

		 return newDao.selectNewByPage(pm);
	}

    @Override
    public News selectNewById(int newsId) {
        return newDao.selectByNewsId(newsId);
    }
//	
//    private NewDao newDao = new NewDaoImpl();
//
//    /**
//     * 添加新闻
//     * @param news 新闻对象
//     * @return  添加是否成功
//     */
//    @Override
//    public boolean addNew(News news) {
//        return newDao.insertNews(news) > 0?true:false;
//    }
//
//    /**
//     * 删除新闻
//     * @param id 新闻编号
//     * @return 删除是否成功
//     */
//    @Override
//    public boolean deleteNew(int id) {
//        return newDao.deleteNews(id) > 0?true:false;
//    }
//
//    /**
//     * 删除多个新闻
//     *
//     * @param newsId 数组
//     * @return
//     */
//    @Override
//    public boolean deleteNewByArray(int[] newsId) throws SQLException {
//        return newDao.deleteByArray(newsId);
//    }
//
//    /**
//     * 修改新闻
//     * @param news 新闻对象
//     * @return 是否修改成功
//     */
//    @Override
//    public boolean updateNew(News news) {
//        return newDao.updateNews(news) > 0?true:false;
//    }
//
//    /**
//     * 根据id查询新闻
//     *
//     * @param id
//     * @return
//     */
//    @Override
//    public News selectNewById(int id) {
//        return newDao.selectByNewsId(id);
//    }
//
//    /**
//     * 查询所有新闻
//     * @return
//     */
//    @Override
//    public ArrayList<News> selectNew() {
//        return newDao.selectNews();
//    }
//
//    /**
//     * （分页）查询新闻
//     * @param pm
//     */
//    @Override
//    public void selectNewByPage(PageModel<News> pm) {
//        newDao.selectNews(pm);
//    }
//
//    /**
//     * 统计所有新闻数
//     * @return
//     */
//    @Override
//    public int selectNewCount() {
//        return newDao.selectNewsCount();
//    }
//
//    public int selectNewByIdCount(int typeId){
//        return newDao.selectNewsByIdCount(typeId);
//    }
//
//    /**
//     * （分页）根据类型id查询所有新闻
//     * @param pm
//     * @param id
//     */
//    @Override
//    public void selectNewByType(PageModel<News> pm, int id) {
//        newDao.selectNewsByTypeId(pm,id);
//    }
}
