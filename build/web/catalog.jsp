<%-- 
    Document   : catalog
    Created on : Jun 6, 2021, 8:47:29 PM
    Author     : laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="style.css">
        <script src="js/mycode.js"></script>
        <style>

            #content{
                margin: 0 auto;
            }

            #cate > a:hover:not(.active){
                background-color: teal;
                color: white;
            }

            .pagination {
                margin: 20px;
                display: inline-block;
            }
            .pagination a {
                color: black;
                font-size: 22px;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
            }
            .pagination a.active {
                background-color: #4CAF50;
                color: white;
            }
            .pagination a:hover:not(.active) {
                background-color: #FFF44F;
                color: black;
            }

            #product .img-responsive{
                width: 120px;
                height: 150px;
            }

        </style>
        <title>Danh mục</title>
    </head>

    <body>

        <%@include file="footer_header/header.jsp" %>


        <div class="main">
            <div class="container-fluid mt-3 mb-5">
                <%
                    int categoryID = Integer.valueOf(request.getParameter("categoryID"));
                    if (categoryID == 1) {
                %>
                <h1 style="margin-left: 850px"> Áo </h1>
                <%
                } else if (categoryID == 2) {
                %>
                <h1 style="margin-left: 850px"> Giày <h1/>
                <%} else {
                %>
                <h1 style="margin-left: 850px"> Trang sức</h1>
                <%
                }
                %>

            </div>
        </div>
        <div id="content" class="col-11 justify-content-center">

            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:forEach begin="1" end="${requestScope.num}" var="i">
                        <li class="page-item"><a class="page-link ${requestScope.page==i?"active":""}" href="catalog?categoryID=${requestScope.categoryID}&page=${i}">${i}</a></li>
                        </c:forEach>
                </ul>
            </nav>

            <div id="main-product">
                <c:forEach items="${requestScope.data}" var="p">
                    <div id="product" class="border border-info rounded d-inline-block col-5 col-md-4 col-lg-2 m-3 pt-2 pb-1">
                        <div class="grid  text-center">
                            <div class="portfolio app mix_all" data-cat="app" style="display: inline-block; opacity: 1;">
                                <div class="portfolio-wrapper">
                                    <a data-toggle="modal" data-target=".bs-example-modal-md" href="#" class="b-link-stripe b-animate-go  thickbox">
                                        <img class="img-responsive" src="<%=request.getContextPath()%>/images/${p.image}" />
                                        <div class="b-wrapper">
                                            <h2 class="b-animate b-from-left b-delay03 "><img src="images/link-ico.png" alt="" /></h2>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <p class="text-center" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; ">${p.productName}</p>
                            <div class="text-center text-danger"><h3>$${p.price}</h3></div>
                            <a href="detail?product=${p.productID}"><button class="btn btn-light m-2"><i class="fas fa-cart-plus"></i></button></a>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:forEach begin="1" end="${requestScope.num}" var="i">
                        <li class="page-item"><a class="page-link ${requestScope.page==i?"active":""}" href="catalog?categoryID=${requestScope.categoryID}&page=${i}">${i}</a></li>
                        </c:forEach>
                </ul>
            </nav>

        </div>

        <%@include file="footer_header/footer.jsp" %>

    </body>

</html>
