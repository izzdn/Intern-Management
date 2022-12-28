/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.LoginBean;
import com.mvc.dao.LoginDao;
import java.io.PrintWriter;

/**
 *
 * @author aqild
 */
public class LoginAdminServlet extends HttpServlet {
    
    public LoginAdminServlet(){}
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        String email = request.getParameter("aemail");
        String password = request.getParameter("apassword");
    
        LoginBean loginBean = new LoginBean();

        loginBean.setEmail(email);
        loginBean.setPassword(password);

        LoginDao loginDao = new LoginDao();

        String userValidate = loginDao.authenticateUser(loginBean);
        String adminid = loginDao.Userident(loginBean);

        if(userValidate.equals("SUCCESS"))
        {
            request.setAttribute("email",email);
            request.setAttribute("adminId",adminid);
            HttpSession session = request.getSession(true);
            session.setAttribute("email",email);
            session.setAttribute("adminId",adminid);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Login Successful');");
            out.println("location='adminPage.jsp';");
            out.println("</script>");
        }
        else
        {
            request.setAttribute("errMessage",userValidate);
            //JOptionPane.showMessageDialog(null,"error password/username");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Incorrect Staff ID or password');");
            out.println("location='loginAdmin.jsp';");
            out.println("</script>");
        }
    }
}
