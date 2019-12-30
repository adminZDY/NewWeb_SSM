package com.sec.news.control;


import com.sec.news.admin.biz.UserBiz;
import com.sec.news.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("")
public class UserController {

    @Autowired
    UserBiz userBiz;

    @RequestMapping("login")
    public ModelAndView lisUser(HttpServletRequest request ,User user){

        ModelAndView mav = new ModelAndView();

        user = userBiz.adminLogin(user);

        if(user != null)
        {

            //用户信息存入Session
            request.getSession().setAttribute("user", user);
            //创建时间
            Date date = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
            //时间存入session
            request.getSession().setAttribute("date", ft.format(date));

            mav.setViewName("/manage/index");
        }
        //登录失败，转发到登录页面，提示用户输入错误
        else
        {
            mav.setViewName("/manage/login");
        }
        return mav;
    }
}
