<%-- 
    Document   : cart
    Created on : Jun 12, 2021, 7:54:23 PM
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

        <script>

            function showAlert() {
                var x = ${requestScope.test};
                alert("TEST");
            }

        </script>

        <title>Giỏ hàng</title>
    </head>
    <body>

        <%@include file="footer_header/header.jsp" %>

        <div class="container mb-4">
            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col"> </th>
                                    <th scope="col">Tên sản phẩm</th>
                                    <th scope="col">Size</th>
                                    <th scope="col" class="text-center">Số lượng</th>
                                    <th scope="col" class="text-right">Đơn giá</th>
                                    <th scope="col" class="text-right">Thành tiền</th>
                                    <th> </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${sessionScope.cartlist}" var="item">
                                    <tr>
                                        <td><img class="img-responsive" src="<%=request.getContextPath()%>/images/${item.product.image}" /> </td>
                                        <td><a href="detail?dog=${item.product.productID}" style="text-decoration: none;">${item.product.productName}</a></td>
                                        <td>${item.size}</td>
                                        <td>
                                            <form action="change">
                                                <input size="1" class="form-control" type="number" id="quantity" name="quantity" min="1" value="${item.quantity}" onchange="this.form.submit()"/>
                                                <input type="text" name="id" value="${item.product.productID}" style="display: none">
                                                <input type="text" name="size" value="${item.size}" style="display: none">
                                            </form>
                                        </td>
                                        <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price}"/></td>
                                        <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="2" value="${item.price*item.quantity}"/></td>
                                        <td class="text-right"><a href="remove?size=${item.size}&id=${item.product.productID}"><button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button> </a></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>Sub-Total</td>
                                    <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="2" value="${sessionScope.total}"/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>Shipping</td>
                                    <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="2" value="${(sessionScope.total*5)/1000}"/></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><strong>Total</strong></td>
                                    <td class="text-right"><strong><fmt:formatNumber type="number" maxFractionDigits="2" value="${(sessionScope.total*1005)/1000}"/></strong></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col mb-2">
                    <div class="row">
                        <div class="col-sm-12  col-md-6">
                            <button class="btn btn-block btn-light" onclick="location.href = 'home';">Continue Shopping</button>
                        </div>
                        <div class="col-sm-12 col-md-6 text-right">
                            <button id="checkout" class="btn btn-lg btn-block btn-success text-uppercase" onclick="location.href = 'checkout?cart=${sessionScope.cart}';">Checkout</button>
                            <script>
                                document.getElementById('checkout').addEventListener('click', function () {
                                    Swal.fire({
                                        position: 'top-end',
                                        icon: 'success',
                                        title: 'Đơn hàng của bạn đã được tiếp nhận. ',
                                        showConfirmButton: false,
                                        timer: 1500
                                    })
                                })
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%@include file="footer_header/footer.jsp" %>

    </body>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</html>
