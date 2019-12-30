package com.sec.news.admin.biz.Impl;

import com.sec.news.admin.biz.UserBiz;
import com.sec.news.dao.UserDao;
import com.sec.news.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zdy
 * @site XXX
 * @company XXX公司
 * @create 2019-11-20-17:15
 */
@Service
public class UserBizImpl implements UserBiz {
    @Autowired
    UserDao userDao;

    public User adminLogin(User user) {

        return userDao.validateUser(user);
    }

    public boolean updateUserInfo(User user) {
        return userDao.updateUser(user) != 0 ? true  : false;
    }
}
