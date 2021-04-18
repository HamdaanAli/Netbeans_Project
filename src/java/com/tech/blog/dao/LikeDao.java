package com.tech.blog.dao;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public LikeDao() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public boolean insertLike(int pid,int uid)
    {
        boolean flag=false;
        try {
            String q="insert into liked(pid,uid) values(?,?)";
            PreparedStatement p=this.con.prepareStatement(q);
            //values set....
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            flag=true;
                    
        } catch (Exception e) {
            e.printStackTrace();
        }
      return flag;
    }
    
    public int countLikeOnPost(int pid)
    {
       int count=0;
       
       String q="select count(*) from liked where pid=?";
        try {
            PreparedStatement p=this.con.prepareStatement(q);
            p.setInt(1, pid);
            ResultSet rs=p.executeQuery();
            if(rs.next())
            {
              count=rs.getInt("count(*)");
            }
        } catch (Exception ex) {
             ex.printStackTrace();
        }

       
       return count;
    }

public boolean isLikedByUser(int pid,int uid)
{

  boolean flag=false;
    try {
       PreparedStatement p=this.con.prepareStatement("select * from liked where pid=? and uid=?");
       p.setInt(1, pid);
       p.setInt(2, uid);
       ResultSet set=p.executeQuery();
       if(set.next())
       {
         flag=true;
       }
    } catch (Exception e) {
        e.printStackTrace();
    }
  return flag;

}

public boolean deleteLike(int pid,int uid)
{

    boolean flag=false;
    try {
        PreparedStatement p=this.con.prepareStatement("delete * from liked where pid=? and uid=?");
        p.setInt(1, pid);
        p.setInt(2, uid);
        p.executeUpdate();
        flag=true;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return flag;

}
}
