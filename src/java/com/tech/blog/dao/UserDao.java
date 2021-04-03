/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con=con;
    }
    
    //method to inseret user to database
    
    public boolean saveUser(User user)
    {
             boolean f=false;
        try
        {
//           user-->database
            
             String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
             PreparedStatement pstmt=this.con.prepareStatement(query);
             pstmt.setString(1, user.getName());
             pstmt.setString(2, user.getEmail());
             pstmt.setString(3, user.getPassword());
             pstmt.setString(4, user.getGender());
             pstmt.setString(5, user.getAbout());
             
             pstmt.executeUpdate();
             f=true;
        }catch(Exception e)
        {
          e.printStackTrace();
        
        }
    return f; 
    }
    //get user by useremail and password
    
    public User getUserByEmailAndPassword(String email,String password)
    {
       User user=null;
       
       try{
          String query="select *from user where email=? and password=?";
          PreparedStatement pstmt=con.prepareStatement(query);
          pstmt.setString(1, email);
          pstmt.setString(2, password);
         ResultSet rset= pstmt.executeQuery();
         if(rset.next())
         {
             user=new User();
             String name=rset.getString("name");
             user.setName(name);
             user.setId(rset.getInt("id"));
             user.setEmail(rset.getString("email"));
             user.setPassword(rset.getString("password"));
             user.setGender(rset.getString("gender"));
             user.setAbout(rset.getString("about"));
             user.setDateTime(rset.getTimestamp("rdate"));
             user.setProfile(rset.getString("profile"));
             
              }
       }catch(Exception e)
       {
          e.printStackTrace();
       
       }    
      return user;
    }
    
    public boolean updateUser(User user)
    {
        boolean f=false;
    
        try{
          
           String query="update user set name=? , email=? , password=? , gender=? , about=? , profile=? where id=?";
           PreparedStatement p=con.prepareStatement(query);
           p.setString(1, user.getName());
           p.setString(2, user.getEmail());
           p.setString(3, user.getPassword());
           p.setString(4, user.getGender());
           p.setString(5, user.getAbout());
           p.setString(6, user.getProfile());
           p.setInt    (7,user.getId());
           
           
           
           
           p.executeUpdate();
           f=true;
           
            
            
            
            
            
        }catch(Exception e)
        {
        
        e.printStackTrace();
        }
        
        return f;
    
    }
}
