/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.LoginUserBean;
import com.mvc.dao.LoginUserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author aqild
 */
public class LoginUserServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        String email = request.getParameter("uemail");
        String password = request.getParameter("upassword");
    
        LoginUserBean loginBean = new LoginUserBean();

        loginBean.setEmail(email);
        loginBean.setPassword(password);

        LoginUserDao loginDao = new LoginUserDao();

        String userValidate = loginDao.authenticateUser(loginBean);
        String userid = loginDao.Userident(loginBean);

        if(userValidate.equals("SUCCESS"))
        {
            request.setAttribute("email",email);
            request.setAttribute("userId",userid);
            HttpSession session = request.getSession(true);
            session.setAttribute("email",email);
            session.setAttribute("userId",userid);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Login Successful');");
            out.println("location='userPage.jsp';");
            out.println("</script>");
        }
        else
        {
            request.setAttribute("errMessage",userValidate);
            //JOptionPane.showMessageDialog(null,"error password/username");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Incorrect Staff ID or password');");
            out.println("location='loginUser.jsp';");
            out.println("</script>");
        }
    }
}
