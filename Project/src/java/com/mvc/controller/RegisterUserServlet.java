/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mvc.bean.userBean;
import com.mvc.dao.RegisterUserDao;

/**
 *
 * @author aqild
 */
public class RegisterUserServlet extends HttpServlet {

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
        try(PrintWriter out = response.getWriter()){
        String email = request.getParameter("uemail");
        String name = request.getParameter("ufname");
        String password = request.getParameter("upassword");
        
        userBean registerBean = new userBean();
            
        registerBean.setName(name);
        registerBean.setEmail(email);
        registerBean.setPassword(password);
            
        RegisterUserDao registerdao = new RegisterUserDao();
            
        String userRegistered = registerdao.registerUser(registerBean);
            
        if(userRegistered.equals("SUCCESS"))   //On success, you can display a message to user on Home page
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Registeration Successful');");
                out.println("location='loginUser.jsp';");
                out.println("</script>");
            }
        else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Whoops something is wrong somewhere!');");
                out.println("location='registerUser.jsp';");
                out.println("</script>");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
