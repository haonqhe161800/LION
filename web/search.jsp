<%-- 
    Document   : search
    Created on : Jun 21, 2021, 11:20:48 PM
    Author     : laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
        <link rel="stylesheet" href="style.css">
        <script src="js/mycode.js"></script>
        <style>

            .main{
                margin: 10%;
            }

            #result .img-responsive{
                width: 120px;
                height: 150px;
            }

            .form-inline{margin-left: 550px;}
        </style>
        <title>Kết quả tìm kiếm</title>
    </head>
    <body>
        <%@include file="footer_header/header.jsp" %>
        <div class="row d-flex justify-content-center">

            <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <h1 class="display-4">Kết quả tìm kiếm cho "${requestScope.query}" </h1>
                </div>
            </div>


            <div class="pagination" style="justify-content: center;">

                <c:forEach begin="1" end="${requestScope.num}" var="i">
                    <a class="${requestScope.page==i?"active":""}" href="search?query=${requestScope.query}&page=${i}">${i}</a>
                </c:forEach>

            </div>

            <div id="main"class="col-11 m-5 justify-content-center">
                <c:forEach items="${requestScope.search}" var="p">
                    <div id="result" class="border border-info rounded d-inline-block col-5 col-md-3 col-lg-2 m-1 pt-2 pb-1">
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
                <div class="clearfix"></div>
            </div>

            <div class="pagination" style="justify-content: center;">

                <c:forEach begin="1" end="${requestScope.num}" var="i">
                    <a class="${requestScope.page==i?"active":""}" href="catalog?sex=${requestScope.sex}&page=${i}">${i}</a>
                </c:forEach>

            </div>

        </div>
        <%@include file="footer_header/footer.jsp" %>
    </body>
</html>
