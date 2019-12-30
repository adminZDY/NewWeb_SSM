package com.sec.news.filter.manage;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sec.news.model.User;

public class LoginFilter implements Filter {

    public void destroy() {
        // TODO Auto-generated method stub

    }

    public void doFilter(ServletRequest request1, ServletResponse response1,
                         FilterChain chain) throws IOException, ServletException {
        // TODO Auto-generated method stub

        HttpServletRequest request = (HttpServletRequest) request1;
        HttpServletResponse response = (HttpServletResponse) response1;
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");


        if(userName == null || password == null)
        {
            response.sendRedirect("/NewWeb_1/manage/login.jsp");
        }else {
            User user = new User(userName.trim(),password.trim());
            request.setAttribute("user",user);
            chain.doFilter(request, response);}
    }

    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub

    }

}
