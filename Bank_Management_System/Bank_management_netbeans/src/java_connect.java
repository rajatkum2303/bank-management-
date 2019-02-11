/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author nipun
 */
import java.sql.*;
import javax.swing.JOptionPane;
public class java_connect {
        Connection conn=null;
        
        public static Connection connecrdb(){
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank?zeroDateTimeBehavior=convertToNull","root","");
                return conn;
            }catch(Exception e){
               JOptionPane.showMessageDialog(null, e);
            }
            return null;
        } 
    
}
