<%-- 
    Document   : addstock
    Created on : Jul 7, 2021, 10:14:51 AM
    Author     : laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>Số lượng</title>
        <script>
            function load(){
                var id = document.getElementById("id").value;
                var img = document.getElementById("img").value;
                var size = document.getElementById("size").value;
                document.location.href="addstock?id="+id+"&size="+size+"&img="+img; 
            }
        </script>
    </head>
    <body>

        <%@include file="footer_header/header.jsp" %>

        <form class="form-horizontal mx-auto col-10 col-md-9 col-lg-8 m-3" action="addstock" method="POST">
            <fieldset>

                <!-- Form Name -->
                <legend>PRODUCTS</legend>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="id">Product ID</label>  
                    <div class="col-md-4">
                        <input id="id" name="id" value="${requestScope.id}" class="form-control input-lg" readonly type="text">
                    </div>
                </div>

                <div class="form-group" style="display: none">
                    <div class="col-md-4">
                        <input type="text" id="img" name="img" value="images/${requestScope.img}">
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <div class="col-md-4">
                        <img src="<%=request.getContextPath()%>/images/${requestScope.img}" style="width: 120px; height: 150px;">
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="product_name">SIZE</label>  
                    <div class="col-md-4">

                        <select id="size" name="size" onchange="load()">
                            <option value="L" ${requestScope.size=="L"?"selected":""}>L</option>
                            <option value="XL" ${requestScope.size=="XL"?"selected":""}>XL</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="num">In Stock</label>  
                    <div class="col-md-4">
                        <input id="num" name="num" class="form-control input-lg" value="${requestScope.num}" readonly type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="add">Add More</label>  
                    <div class="col-md-4">
                        <input id="add" name="add" class="form-control input-lg" type="number" value="0">
                    </div>
                </div>

                <!-- Button -->
                <div class="form-group">
                    <div class="col-md-4">
                        <button id="singlebutton" name="singlebutton" class="btn btn-primary">Add to Stock</button>
                    </div>
                </div>

            </fieldset>
        </form>

        <%@include file="footer_header/footer.jsp" %>

    </body>
</html>
