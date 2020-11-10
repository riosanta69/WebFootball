/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.PageBean;
import com.mvc.dao.PageDao;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Riosanta69
 */
public class PageController extends HttpServlet {

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PageDao pageDao = new PageDao();
        int slideId = Integer.parseInt(getRequestParameter(request, "id"));
        List<PageBean> pageInSlideList = pageDao.getAllPages(slideId);
        request.setAttribute("pagesInSlide", pageInSlideList);
        request.setAttribute("slideId", slideId);
        request.setAttribute("numSlides", (int) Math.ceil(pageDao.getAllPages().size() / 5.0));
        RequestDispatcher rd = request.getRequestDispatcher("home.jsp"); //show error same home.jsp page
        rd.forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    protected  String getRequestParameter(HttpServletRequest request, String name) {
        String param = request.getParameter(name);
        return !param.isEmpty() ? param : getInitParameter(name);
    }
}
