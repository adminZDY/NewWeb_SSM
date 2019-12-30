package com.sec.news.admin.biz;

import com.sec.news.model.News;
import com.sec.news.model.PageModel;

import java.util.ArrayList;
import java.util.List;

/**
 * @author zdy
 * @site XXX
 * @company XXX公司
 * @create 2019-11-20-17:14
 */
public interface NewBiz {

//    /**
//     * 添加新闻
//     * @param news
//     * @return
//     */
//    public boolean addNew(News news);
//
//    /**
//     * 删除新闻
//     * @param id 根据id删除
//     * @return
//     */
//    public boolean deleteNew(int id);
//

//
//    /**
//     * 修改新闻
//     * @param news
//     * @return
//     */
//    public boolean updateNew(News news);
//
//    /**
//     * 查询所有新闻
//     * @return
//     */
//    public ArrayList<News> selectNew();
//
//    /**
//     * 分页查询
//     */
//    public void selectNewByPage(PageModel<News> pm);

    /**
     * 统计新闻
     */
    public int selectNewCount(int Id);
//
//    /**
//     * 统计新闻
//     */
//    public int selectNewByIdCount(int typeId);
//
//    /**
//     * 根据id查询新闻
//     * @param id
//     * @return
//     */
//    public News selectNewById(int id);

    /**
     * 根据类型id 查询新闻并分页
     * @param pm
     * @param id
     */
    public ArrayList<News> selectNewByType(PageModel<News> pm, int id);
	
	/**
	 * 发布新闻
	 * @param news
	 * @return
	 */
	public boolean insertNews(News news);
	
	/**
	 * 修改新闻
	 * @param news
	 * @return
	 */
	public boolean updateNews(News news);
	
	/**
	 * 删除新闻
	 * @param newsId 新闻Id
	 * @return
	 */
	public boolean deleteNews(int newsId);

	/**
	 * 删除多个新闻
	 * @param newsId 数组
	 * @return
	 */
	public boolean deleteNewByArray(List<Integer> newsId);

	 /**
     * 查询所有新闻
     * @return 所有新闻集合
     */
    public ArrayList<News> selectNews();

	public ArrayList<News> selectNewByPage(PageModel<News> pm);

	 /**
     * 根据id查询新闻
     * @param newsId
     * @return
     */
    public News selectNewById(int newsId);
}
