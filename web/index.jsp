<%-- 
    Document   : index
    Created on : 30 Jan, 2021, 11:54:17 PM
    Author     : HaMdaan
--%>

<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-backgroud{
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 67% 93%, 33% 100%, 0 91%, 0 0);

            }
        </style>
        
    </head>
    <body>
    <!--navbar-->
    <%@include file="normal_navbar.jsp" %>
      
    <!--banner-->
    <div class="container-fluid p-0 m-0 ">
        <div class="jumbotron primary-backgroud text-white banner-backgroud" >
            <div class="container">
                <h3 class="display-3">Welcome to "Tech Blog" friends</h3>
               <p>Thousands of different programming languages have been created, and more are being created every year. Many programming languages are written in an imperative form (i.e., as a sequence of operations to perform) while other languages use the declarative form (i.e. the desired result is specified, not how to achieve it).
                  The description of a programming language is usually split into the two components of syntax (form) and semantics (meaning). Some languages are defined by a specification document (for example, the C programming language is specified by an ISO Standard) while other languages (such as Perl) have a dominant implementation that is treated as a reference. Some languages have both, with the basic language defined by a standard and extensions taken from the dominant implementation being common.</p>
               <button class="btn-outline-light btn-lg"><span class="fa fa-child"></span>Start ! its Free</button>
               <a href="login_page.jsp" class="btn-outline-light btn-lg"><span class="fa fa-external-link"></span> Login</a>
            </div>
        </div>
     </div>
    <!--//cards-->
      <div class="container">
          <div class="row">
              <%
              PostDao d=new PostDao(ConnectionProvider.getConnection());
              List<Post> posts=null;
              posts=d.getAllPosts();
              for(Post p:posts)
                {
              %>
              
              <div class="col-md-4">
                  <div class="card">
  
                     <div class="card-body">
                       <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
                        <div class="card-body">
                         <h3><%= p.getpTitle() %></h3>
<!--                             <p><%= p.getpContent() %></p>
                            <p><%= p.getpCode() %></p>-->
                            </div>
                        </div>
                    </div>
                            <div class="card-footer bg-primary text-center">
    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
    <a href="show_blog_page.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>
    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
</div>
          </div> 
          <%
    
                }
                 %>
        </div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
   
 </body>
</html>
