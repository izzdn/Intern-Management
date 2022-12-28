/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.bean.adminBean;

/**
 *
 * @author aqild
 */
public class RegisterAdminDao {
    public String registerAdmin(adminBean registerBean) throws ClassNotFoundException
     {
         String id = registerBean.getID();
         String name = registerBean.getName();
         String email = registerBean.getEmail();
         String password = registerBean.getPassword();
         
         Connection con = null;
         PreparedStatement preparedStatement = null;         
         try
         {
             con = DBConnection.createConnection();
             String query = "insert into admin(ADMIN_ID,ADMIN_NAME,ADMIN_EMAIL,ADMIN_PASSWORD) values (?,?,?,?)"; //Insert user details into the table 'USERS'
             preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data            
             preparedStatement.setString(1, id);
             preparedStatement.setString(2, name);
             preparedStatement.setString(3, email);
             preparedStatement.setString(4, password);
             int i= preparedStatement.executeUpdate();
             
             if (i!=0)  //Just to ensure data has been inserted into the database
             return "SUCCESS"; 
         }
         catch(SQLException e)
         {
            e.printStackTrace();
         }       
         return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
     }
}
