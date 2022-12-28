/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection 
{
    public static Connection createConnection()
    {
        String url = "jdbc:derby://localhost:1527/ProjekDB";
        String username = "app";
        String password = "app";
        Connection con = null;
        
        try{
            try{
                Class.forName("org.apache.derby.jdbc.ClientDriver");
            }
            catch (ClassNotFoundException e)
            {
                e.printStackTrace();
            }
            con = DriverManager.getConnection(url,username,password);
            System.out.println("Printing conncetion object" +con);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
    
}
