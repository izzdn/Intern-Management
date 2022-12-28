/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.LoginUserBean;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author aqild
 */
public class LoginUserDao {
    public String authenticateUser(LoginUserBean loginBean)
    {
        String email = loginBean.getEmail();
        String password = loginBean.getPassword();
        
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        String uemail = "";
        String upassword = "";
        
        try
        {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select EMAIL,PASSWORD from APP.USERS");
            
            while (resultSet.next())
            {
                uemail = resultSet.getString("EMAIL");
                upassword = resultSet.getString("PASSWORD");
                
                if(email.equalsIgnoreCase(uemail)&& password.equals(upassword))
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
    
    public String Userident(LoginUserBean loginBean)
    {
        String email = loginBean.getEmail();
        String password = loginBean.getPassword();
        
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        String userid = "";
       
        
        try
        {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select USERID from APP.USERS WHERE EMAIL ='"+email+"' AND PASSWORD='"+password+"'");
            
            while(resultSet.next())
            {
                
                userid = resultSet.getString("USERID");
                
            }
            return userid;
        }
        catch(SQLException e)
            {
                    e.printStackTrace();
            }
        return "Invalid";
    }
}
