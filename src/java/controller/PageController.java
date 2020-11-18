/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Page;
import dao.PageDao;
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PageDao pageDao = new PageDao();
        int slideId = Integer.parseInt(getRequestParameter(request, "id"));
        String pageType = getRequestParameter(request, "type");
        List<Page> pageInSlideList = pageDao.getAllPages(slideId, pageType);
        request.setAttribute("pagesInSlide", pageInSlideList);
        request.setAttribute("pageType", pageType);
        request.setAttribute("id", slideId);
        request.setAttribute("numSlides", (int) Math.ceil(pageDao.getAllPages(pageType).size() / 5.0));
        RequestDispatcher rd = request.getRequestDispatcher("home.jsp?id=" + slideId + "&type=" + pageType); //show error same home.jsp page
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

    protected String getRequestParameter(HttpServletRequest request, String name) {
        String param = request.getParameter(name);
        return param != null ? param : getInitParameter(name);
    }
}
