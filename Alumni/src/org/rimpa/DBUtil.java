package org.rimpa;

import java.sql.Connection;
import java.sql.DriverManager;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Rimpa Datta
 */
public class DBUtil {
    public static Connection createConnection(){
        Connection connection =null;
        try{
        Class.forName("com.mysql.jdbc.Driver");
        connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/alumni","root","admin");
        }catch(Exception ex) {
        
       ex.printStackTrace();
        }
        return connection;
    }
}
