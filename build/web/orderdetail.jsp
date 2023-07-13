<%-- 
    Document   : orderdetail
    Created on : Jul 8, 2021, 11:28:28 PM
    Author     : laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <link href="https://fonts.googleapis.com/css?family=Abel|Abril+Fatface|Acme|Alegreya|Alegreya+Sans|Anton|Archivo|Archivo+Black|Archivo+Narrow|Arimo|Arvo|Asap|Asap+Condensed|Bitter|Bowlby+One+SC|Bree+Serif|Cabin|Cairo|Catamaran|Crete+Round|Crimson+Text|Cuprum|Dancing+Script|Dosis|Droid+Sans|Droid+Serif|EB+Garamond|Exo|Exo+2|Faustina|Fira+Sans|Fjalla+One|Francois+One|Gloria+Hallelujah|Hind|Inconsolata|Indie+Flower|Josefin+Sans|Julee|Karla|Lato|Libre+Baskerville|Libre+Franklin|Lobster|Lora|Mada|Manuale|Maven+Pro|Merriweather|Merriweather+Sans|Montserrat|Montserrat+Subrayada|Mukta+Vaani|Muli|Noto+Sans|Noto+Serif|Nunito|Open+Sans|Open+Sans+Condensed:300|Oswald|Oxygen|PT+Sans|PT+Sans+Caption|PT+Sans+Narrow|PT+Serif|Pacifico|Passion+One|Pathway+Gothic+One|Play|Playfair+Display|Poppins|Questrial|Quicksand|Raleway|Roboto|Roboto+Condensed|Roboto+Mono|Roboto+Slab|Ropa+Sans|Rubik|Saira|Saira+Condensed|Saira+Extra+Condensed|Saira+Semi+Condensed|Sedgwick+Ave|Sedgwick+Ave+Display|Shadows+Into+Light|Signika|Slabo+27px|Source+Code+Pro|Source+Sans+Pro|Spectral|Titillium+Web|Ubuntu|Ubuntu+Condensed|Varela+Round|Vollkorn|Work+Sans|Yanone+Kaffeesatz|Zilla+Slab|Zilla+Slab+Highlight" rel="stylesheet">
        <link rel="stylesheet" href="style.css">
        <script src="js/mycode.js"></script>
        <style>
            .img-responsive{
                width: 60px;
                height: 75px;
            }
        </style>
        <title>Detail</title>
    </head>
    <body>

        <%@include file="footer_header/header.jsp" %>

        <div class="container mb-4">
            <div class="row">
                <div class="col-12">
                    <div class="row mt-2 mb-2">
                        <div class="col-5">
                            <p>Order Date: ${requestScope.order.odate}</p>
                            <p>Ship Date: ${requestScope.order.sdate}</p>
                            <p>Status: <span style="font-weight: bold; text-transform: uppercase; color: ${requestScope.order.status=='delivering'?"red":"darkgreen"}">${requestScope.order.status}</span></p>
                                <c:if test="${requestScope.order.status=='delivering'}">
                                    <a href="confirm?oid=${requestScope.order.oid}&message=delivered"><button class="btn btn-success mb-3"><span>${sessionScope.account.role == 'user'?"RECEIVED THIS":"DELIVERED"}</span></button></a>
                                </c:if>
                                <c:if test="${requestScope.order.status=='delivered'&&sessionScope.account.role == 'admin'}">
                                    <a href="confirm?oid=${requestScope.order.oid}&message=delivering"><button class="btn btn-danger mb-3"><span>UNDONE</span></button></a>
                                 </c:if>
                        </div>
                        <c:if test="${sessionScope.account.role == 'admin'}">
                            <div class="col-6">
                                <p>Full Name: ${requestScope.customer.fullname}</p>
                                <p>Address: ${requestScope.customer.address}</p>
                                <p>Phone: ${requestScope.customer.phone}</p>
                            </div>
                        </c:if>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col"> </th>
                                    <th scope="col" class="text-center">Tên sản phẩm</th>
                                    <th scope="col" class="text-center">Size</th>
                                    <th scope="col" class="text-center">Số lượng</th>
                                    <th scope="col" class="text-right">Đơn giá</th>
                                    <th scope="col" class="text-right">Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.list}" var="item">
                                    <tr>
                                        <td class="text-center"><img class="img-responsive" src="<%=request.getContextPath()%>/images/${item.product.image}" /> </td>
                                        <td>${item.product.productName}</td>
                                        <td style="text-align: center">${item.size}</td>
                                        <td style="text-align: center">${item.quantity}</td>
                                        <td class="text-right">$<fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price}"/></td>
                                        <td class="text-right">$<fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price*item.quantity}"/></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>Sub-Total</td>
                                    <td class="text-right">$<fmt:formatNumber type="number" maxFractionDigits="2" value="${requestScope.order.payment}"/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>Shipping</td>
                                    <td class="text-right">$<fmt:formatNumber type="number" maxFractionDigits="2" value="${requestScope.order.shipping}"/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><strong>Total</strong></td>
                                    <td class="text-right">$<fmt:formatNumber type="number" maxFractionDigits="2" value="${requestScope.order.total}"/></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer_header/footer.jsp" %>

    </body>
</html>
