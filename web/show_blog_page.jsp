
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<% 

User user=(User)session.getAttribute("currentUser");

if(user==null)
{
  response.sendRedirect("login_page.jsp");

}

%>

<%
   int postId=Integer.parseInt(request.getParameter("post_id"));
   PostDao d=new PostDao(ConnectionProvider.getConnection());
   Post p= d.getPostByPostId(postId);
    %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %></title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-backgroud{
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 67% 93%, 33% 100%, 0 91%, 0 0);

            }
            .post-title{
               font-weight: 100;
               font-size: 30px;
            }
            .post-content{
                font-weight: 100;
               font-size: 20px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
                
            }
            .post-userinfo{
              font-weight:200;
              font-size: 20px;
            }
            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }
            body{
                background: url(img/background_banner.jpg);
                background-size: cover;
                background-attachment: fixed;
                
            }
        </style>
    </head>
    <body>
         <!--navbar start-->
   
       <nav class="navbar navbar-expand-lg navbar-dark primary-backgroud">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="profile.jsp"><span class="fa fa-tablet"></span> Ali & Android<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fa fa-plus"></span>
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Languages</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Tech Webnairs</a>
        </div>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#"><span class="fa fa-vcard-o"></span> Contact Us</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#!" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span> Do Post</a>
      </li>
            
       </ul>
       <ul class="navbar-nav mr-right">
           <li class="nav-item">
               <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-Modal"><span class="fa fa-user-circle"></span>  <%=user.getName() %></a>
          </li>
      </ul>
      <ul class="navbar-nav mr-right">
           <li class="nav-item">
          <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
          </li>
      </ul>
  </div>
</nav>
   <!--navbar end-->
   <!--Main Content of body-->
   <div class="container">
       <div class="row my-4">
           <div class="col-md-8 offset-md-2">
               <div class="card">
                   <div class="card-header primary-backgroud text-white">
                       <h4 class="post-title"><%= p.getpTitle() %></h4>
                   </div>
                   <div class="card-body">
                       <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
                       <div class="row my-3 row-user">
                           <div class="col-md-8">
                               <% UserDao ud=new UserDao(ConnectionProvider.getConnection()); %>
                               <p class="post-userinfo"><a href="#!"><%= ud.getUserByUserId(p.getUserId()).getName()%></a></p>
                           </div>
                           <div class="col-md-4">
                               <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
                           </div>
                       </div>
                       <p class="post-content"><%=p.getpContent()%></p>
                       <br>
                       <br>
                       <div class="post-code">
                           <pre><%= p.getpCode() %></pre>
                       </div>
                       
                   </div>
                   <div class="card-footer bg-primary text-center">
                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
                    </div>
               </div>
           </div>
       </div>
   </div>
   
   
   <!--end of main content of body-->
   
   <!--profilemodal-->
  

<!-- Modal -->
<div class="modal fade" id="profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-backgroud text-white text-center">
          <h5 class="modal-title" id="exampleModalLabel"> TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width: 150px ">
              <br>
          <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName() %></h5>
   <!--table-->
   <div id="profile-details">
   <table class="table">
 
  <tbody>
    <tr>
      <th scope="row">ID :</th>
      <td><%= user.getId()%></td>

    </tr>
    <tr>
      <th scope="row">Email :</th>
      <td><%= user.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender :</th>
      <td><%= user.getGender() %></td>
          </tr>
          
       <tr>
      <th scope="row">Status :</th>
      <td><%= user.getAbout() %></td>
          </tr>
           <tr>
      <th scope="row">Registered on :</th>
      <td><%= user.getDateTime().toString() %></td>
          </tr>
  </tbody>
</table>

   </div>
          
          <!--profile edit-->
          <div id="profile-edit" style="display: none;">
              <h3 class="mt-2">Please Edit Carefully</h3>
              <form action="EditServlet" method="post" enctype="multipart/form-data">
                  <table class="table">
                      <tr>
                          <td>ID :</td>
                          <td><%= user.getId()%></td>
                      </tr>
                      <tr>
                          <td>Email :</td>
                          <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"</td>
                      </tr>
                 
                      <tr>
                          <td>Name :</td>
                          <td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"</td>
                      </tr>
                      <tr>
                          <td>Password :</td>
                          <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"</td>
                      </tr>
                      <tr>
                          <td>Gender :</td>
                          <td><%=user.getGender().toUpperCase() %></td>
                      </tr>
                      <tr>
                          <td>About :</td>
                          <td>
                              <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%></textarea>
                          </td>
                      </tr>
                      <tr>
                          <td>Select Photo :</td>
                          <td>
                              <input type="file" name="image" class="form-control">
                          </td>
                      </tr>
                  </table>
                          <div class="container">
                              <button type="submit" class="btn btn-outline-primary">Save</button>
                          </div>
              </form>
          
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
      </div>
    </div>
  </div>
</div>
                          
                          
 <!--add post modal--> 
 
 
 
 
 <!--javascripts-->
 
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
    $(document).ready(function(){
        let editStatus=false;
       $('#edit-profile-button').click(function(){

           if(editStatus==false)
           {
               $("#profile-details").hide() 
               $("#profile-edit").show()
               editStatus=true;
               $(this).text("Back")
           }else
           {
               $("#profile-details").show() 
               $("#profile-edit").hide()
               editStatus=false;
              $(this).text("Edit")
           }
       })
        
    });
</script>
<!-- now add post javaScript -->
<script>
    $(document).ready(function(e){
   
       $("#add-post").on("submit",function(event){
            //this code gets call when form is submitted...
            event.preventDefault();
            console.log("you have clicked on submit");
            let form=new FormData(this);
          // now requesting to server
           $.ajax( {
               url:"AddPostServlet",
               type: 'POST',
               data: form,
               success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        if(data.trim()== 'done')
                        {
                            swal("Good job!", "Post Uploaded Successfully!", "success");
                        }else
                        {
                            swal("Error!!", "Post not uploaded,Try Again!", "error");
                        }
                        
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Error!!", "Post not uploaded,Try Again!", "error");
                    },
                    processData: false,
                    contentType: false
           })
        })
    });
</script>
</body>
</html>