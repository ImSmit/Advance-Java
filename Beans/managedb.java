/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author abc
 */
public class managedb {
    
    public int insert(beans.userdata b1)
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_crud_exams?zeroDateTimeBehavior=convertToNull","root","");
            PreparedStatement ps = cn.prepareStatement("insert into userdata(name,age) values(?,?)");
            ps.setString(1,b1.getName() );
            ps.setInt(2, b1.getAge());
            return ps.executeUpdate();            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(managedb.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public ArrayList<userdata> fetchdata()
    {
        ArrayList<userdata> alldata = new ArrayList<>();
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_crud_exams?zeroDateTimeBehavior=convertToNull","root","");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from userdata");
            int i=0;
            while(rs.next())
            {
                userdata ud = new userdata();
                ud.setId(rs.getInt("id"));
                ud.setName(rs.getString("name"));
                ud.setAge(rs.getInt("age"));
                alldata.add(i,ud);
                i++;
            }
            return alldata;
                     
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(managedb.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public int delete(int id)
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_crud_exams?zeroDateTimeBehavior=convertToNull","root","");
            PreparedStatement ps = cn.prepareStatement("delete from userdata where id=?");
            ps.setInt(1, id);
            return ps.executeUpdate();            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(managedb.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    
    }
    
    public userdata fetchdatabyid(int id)
    {
        userdata ud = new userdata();
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_crud_exams?zeroDateTimeBehavior=convertToNull","root","");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from userdata where id="+id);
            while(rs.next())
            {
                ud.setId(rs.getInt("id"));
                ud.setName(rs.getString("name"));
                ud.setAge(rs.getInt("age"));
            }
            return ud;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(managedb.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
   public int update(beans.userdata b1)
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_crud_exams?zeroDateTimeBehavior=convertToNull","root","");
            PreparedStatement ps = cn.prepareStatement("update userdata set name=?,age=? where id=?");
            ps.setString(1,b1.getName() );
            ps.setInt(2, b1.getAge());
            ps.setInt(3, b1.getId());
            return ps.executeUpdate();            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(managedb.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
}
