<%-- 
    Document   : chart
    Created on : Jul 9, 2021, 1:45:29 PM
    Author     : laptop
Trong trang chart.jsp, danh sách đơn hàng được hiển thị dưới dạng bảng và có các thông tin như
mã đơn hàng, tên khách hàng, số điện thoại, địa chỉ và tổng giá trị của đơn hàng.
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

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        
            <script>

                function showAlert() {
            <c:forEach items="${requestScope.olist}" var="order">
                    var x = "${order.oid}";
                    console.log(x);
            </c:forEach>
                }
        </script>
        <title>${requestScope.title}</title>
    </head>
    <body>

        <%@include file="footer_header/header.jsp" %>

        <div class="table-responsive mx-auto col-10" >
            <h3 style="color: red; margin-bottom: 20px">${requestScope.title}</h3>
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Ship Date</th>
                        <th scope="col">Payment</th>
                        <th scope="col">Shipping</th>
                        <th scope="col">Total</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="o" items="${requestScope.olist}">
                        <tr>
                            <td>${o.oid}</td>
                            <td>${o.odate}</td>
                            <td>${o.sdate}</td>
                            <td>$ ${o.payment}</td>
                            <td>$ ${o.shipping}</td>
                            <td>$ ${o.total}</td> 
                            <td><span style="font-weight: bold; text-transform: uppercase; color: ${o.status=='delivering'?"red":"darkgreen"}">${o.status}</span></td>
                            <td style="text-align: center"><a href="odetail?oid=${o.oid}"><button class="btn btn-primary">Detail</button></a></td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
        <%@include file="footer_header/footer.jsp" %>
    </body>
</html>
