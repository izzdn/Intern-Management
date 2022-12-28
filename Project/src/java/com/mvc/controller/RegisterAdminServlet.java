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

import com.mvc.dao.RegisterAdminDao;
import com.mvc.bean.adminBean;

/**
 *
 * @author aqild
 */
public class RegisterAdminServlet extends HttpServlet {

    public RegisterAdminServlet(){}
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()){
        String id = request.getParameter("aid");
        String email = request.getParameter("aemail");
        String name = request.getParameter("afname");
        String password = request.getParameter("apassword");
        
        adminBean registerBean = new adminBean();
            
        registerBean.setID(id);
        registerBean.setName(name);
        registerBean.setEmail(email);
        registerBean.setPassword(password);
            
        RegisterAdminDao registerdao = new RegisterAdminDao();
            
        String adminRegistered = registerdao.registerAdmin(registerBean);
            
        if(adminRegistered.equals("SUCCESS"))   //On success, you can display a message to user on Home page
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Registeration Successful');");
                out.println("location='loginAdmin.jsp';");
                out.println("</script>");
            }
        else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Whoops something is wrong somewhere!');");
                out.println("location='registerAdmin.jsp';");
                out.println("</script>");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
