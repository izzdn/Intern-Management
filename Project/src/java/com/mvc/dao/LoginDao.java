/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.mvc.bean.LoginBean;
import com.mvc.util.DBConnection;
/**
 *
 * @author aqild
 */
public class LoginDao {
    public String authenticateUser(LoginBean loginBean)
    {
        String email = loginBean.getEmail();
        String password = loginBean.getPassword();
        
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        String aemail = "";
        String apassword = "";
        
        try
        {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select ADMIN_EMAIL,ADMIN_PASSWORD from APP.ADMIN");
            
            while (resultSet.next())
            {
                aemail = resultSet.getString("ADMIN_EMAIL");
                apassword = resultSet.getString("ADMIN_PASSWORD");
                
                if(email.equalsIgnoreCase(aemail)&& password.equals(apassword))
                {
                    return "SUCCESS";
                }
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return "Invalid user credentials";
    }
    
    public String Userident(LoginBean loginBean)
    {
        String email = loginBean.getEmail();
        String password = loginBean.getPassword();
        
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        String admin_id = "";
       
        
        try
        {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select ADMIN_ID from APP.ADMIN WHERE ADMIN_EMAIL='"+email+"' AND ADMIN_PASSWORD='"+password+"'");
            
            while(resultSet.next())
            {
                
                admin_id = resultSet.getString("ADMIN_ID");
                
            }
            return admin_id;
        }
        catch(SQLException e)
            {
                    e.printStackTrace();
            }
        return "Invalid";
    }
}
