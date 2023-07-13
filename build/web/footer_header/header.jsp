<%-- 
    Document   : header
    Created on : Jun 8, 2021, 8:24:46 PM
    Author     : laptop
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>lion</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
    </head>
    <!-- body -->
    <body class="main-layout">

        <div class="wrapper">

            <!-- end loader -->
            <div class="sidebar">
                <!-- Sidebar  -->
                <nav id="sidebar">

                    <div id="dismiss">
                        <i class="fa fa-arrow-left"></i>
                    </div>

                    <ul class="list-unstyled components">

                        <li class="active">
                            <a href="home">Home</a>
                        </li>
                        <li>
                            <a href="#brand">Áo</a>
                        </li>
                        <li>
                            <a href="#shoes">Giày</a>
                        </li>
                        <li>
                            <a href="#jewellery">Trang sức</a>
                        </li>
                    </ul>

                </nav>
            </div>


            <div id="content">
                <!-- header -->
                <header>
                    <!-- header inner -->
                    <div class="head_top">
                        <div class="header">

                            <div class="container-fluid">

                                <div class="row">
                                    <div class="col-lg-3 logo_section">
                                        <div class="full">
                                            <div class="center-desk">
                                                <div class="logo">
                                                    <a href="home"><img src="images/logo.png" alt="#"></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-9">
                                        <div class="right_header_info">
                                            <ul>
                                                <%  Account userLogin = (Account) session.getAttribute("account");
                                                    if (userLogin == null) {
                                                %>
                                                <li class="menu_iconb">
                                                    <a href="login">Log in <img style="margin-right: 15px;" src="icon/5.png" alt="#" /> </a>
                                                </li>
                                                <li class="menu_iconb">
                                                    <a href="signup">Signup<img style="margin-left: 15px;" src="icon/6.png" alt="#" /></a>
                                                </li>

                                                <%} else if (userLogin.getRole().equals("user")) {// User login%> 
                                                <li class="menu_iconb">
                                                    <a href="logout.jsp">Logout <img style="margin-right: 15px;" src="icon/5.png" alt="#" /> </a>
                                                </li>
                                                <li class="menu_iconb">
                                                    <a href="account"><%=userLogin.getUsername()%><img style="margin-left: 15px;" src="icon/6.png" alt="#" /></a>
                                                </li>
                                                <% } else { // Admin login%>
                                                <li class="menu_iconb">
                                                    <a href="logout.jsp">Logout <img style="margin-right: 15px;" src="icon/5.png" alt="#" /> </a>
                                                </li>
                                                <li class="menu_iconb">
                                                    <a href="account"><%=userLogin.getUsername()%><img style="margin-left: 15px;" src="icon/6.png" alt="#" /></a>
                                                </li>
                                                <li class="menu_iconb">
                                                    <a href="crud">Products<img style="margin-left: 15px;" src="icon/6.png" alt="#" /></a>
                                                </li>
                                                <li class="menu_iconb">
                                                    <a href="morder">Manage<img style="margin-left: 15px;" src="icon/6.png" alt="#" /></a>
                                                </li>
                                                <% }%>
                                                <li class="tytyu">
                                                    <a href="#"> <img style="margin-right: 15px;" src="icon/2.png" alt="#" /></a>
                                                </li>
                                                <li class="menu_iconb">
                                                    <a href="#"><img style="margin-right: 15px;" src="icon/3.png" alt="#" /></a>
                                                </li>

                                                <li>
                                                    <button type="button" id="sidebarCollapse">
                                                        <img src="images/menu_icon.png" alt="#" />
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- end header inner -->

                        <!-- end header -->
                        <section class="slider_section">
                            <div class="banner_main">
                                <div class="container-fluid padding3">
                                    <div class="row">
                                        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mapimg">
                                            <div class="text-bg">
                                                <h1>Thế <br>
                                                    Giới<br>
                                                    Thời <br>
                                                    Trang</h1>
                                                <span>Shopping cùng </span>
                                                <a href="#">Buy now</a>
                                            </div>
                                        </div>
                                        <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12">
                                            <div id="myCarousel" class="carousel slide banner_Client" data-ride="carousel">
                                                <ol class="carousel-indicators">
                                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                                </ol>
                                                <div class="carousel-inner">
                                                    <div class="carousel-item active">
                                                        <div class="container">
                                                            <div class="carousel-caption text">
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="img_bg">
                                                                            <figure><img src="images/cap.png" /></figure>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="carousel-item">
                                                        <div class="container">
                                                            <div class="carousel-caption text">
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="img_bg">
                                                                            <figure><img src="images/cap.png" /></figure>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="carousel-item">
                                                        <div class="container">
                                                            <div class="carousel-caption text">
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="img_bg">
                                                                            <figure><img src="images/cap.png" /></figure>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                    
                </header>
            </div>
    </body>
</html>
