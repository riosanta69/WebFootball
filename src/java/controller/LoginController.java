package controller;

import model.Login;
import dao.LoginDao;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("btn_login") != null) //check button click event not null from login.jsp page button
        {
            String username = request.getParameter("username"); //get textbox name "username"
            String password = request.getParameter("password"); //get textbox name "txt_password"

            Login loginBean = new Login(); //this class contain seeting up all received values from index.jsp page to setter and getter method for application require effectively 

            loginBean.setUsername(username); //set username through loginBean object
            loginBean.setPassword(password); //set password through loginBean object

            LoginDao loginDao = new LoginDao(); //this class contain main logic to perform function calling and database operation

            String authorize = loginDao.authorizeLogin(loginBean); //send loginBean object values into authorizeLogin() function in LoginDao class

            if (authorize.equals("SUCCESS LOGIN")) //check calling authorizeLogin() function receive string "SUCCESS LOGIN" message after continue process
            {
                HttpSession session = request.getSession(); //session is created
                session.setAttribute("login", loginBean.getName()); //session name is "login" and  store username in "getUsername()" get through loginBean object
//                request.setAttribute("id", 1);
                RequestDispatcher rd = request.getRequestDispatcher("PageController?id=1&type=ALL"); //redirect to welcome.jsp page
                rd.forward(request, response);
            } else {
                request.setAttribute("WrongLoginMsg", authorize); //wrong login error message is "WrongLoginMsg"
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp"); //show error same index.jsp page
                rd.include(request, response);
            }
        }
    }

}
