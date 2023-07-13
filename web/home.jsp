<%-- 
    Document   : home
    Created on : Jun 6, 2021, 6:46:14 PM
    Author     : laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

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

    <body>

        <%@include file="footer_header/header.jsp" %>
        <form action="search" method="post" class="form-inline my-2 my-lg-0">
            <div class="input-group" style="margin-left: 700px">
                <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" name="query" />
                <button type="button" class="btn btn-outline-primary">search</button>
            </div>
            <a class="btn btn-success btn-sm ml-3" href="chart">
                <i class="fa fa-shopping-cart"></i> Cart
                <span class="badge badge-light">3</span>
            </a>
        </form>
        <!-- Categories -->
        <div class="Categories">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title">
                            <h2> Danh mục</h2>
                            <ul class="categiri">
                                <c:forEach items="${listC}" var="o">
                                    <li class="active"><a href="#">${o.cname}</a></li>
                                    </c:forEach>


                        </div>
                    </div>
                </div>

                <!-- news brand -->
                <div id="brand"  class="brand-bg">
                    <h3>New brands</h3>
                    <div class="row">
                        <c:forEach items = "${requestScope.cheap1}" var="ch">
                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 margintop">
                                <div class="brand-box">
                                    <h5>Sale</h5>
                                    <i><img src="<%=request.getContextPath()%>/images/${ch.image}"/>
                                    </i>
                                    <h4>Price <span class="nolmal">$${ch.price}</span></h4>

                                </div>
                                <a class="buynow" href="detail?product=${ch.productID}">Buy now</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <a class="seemore" href="catalog?categoryID=1&page=1">See more</a>
                <!-- end news brand --> 

                <!-- news shoes -->
                <div id="shoes" class="shoes-bg">
                    <h3>New shoes</h3>
                    <div class="row">
                        <c:forEach items = "${requestScope.cheap2}" var="ch">
                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 margintop">
                                <div class="brand-box">
                                    <h5>Sale</h5>
                                    <i><img src="<%=request.getContextPath()%>/images/${ch.image}"/>
                                    </i>
                                    <h4>Price <span class="nolmal">$${ch.price}</span></h4>

                                </div>
                                <a class="buynow" href="detail?product=${ch.productID}">Buy now</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <a class="seemore" href="catalog?categoryID=2&page=1">See more</a>
            </div>

        </div>
    </div>
    <!-- end news shoes -->

    <!-- end Categories --> 
    <section>
        <!--  save -->

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="save">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                <div class="save_box">
                                    <h3>save up to 50%</h3>
                                    <a href="#">Buy now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end save -->
    </section>

    <!--    news Jewellery -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div id="jewellery" class="Jewellery-bg">
                    <h3>New Jewellery</h3>
                    <div class="row">
                        <c:forEach items = "${requestScope.cheap3}" var="ch">
                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 margintop">
                                <div class="brand-box">
                                    <h5>Sale</h5>
                                    <i><img src="<%=request.getContextPath()%>/images/${ch.image}"/>
                                    </i>
                                    <h4>Price <span class="nolmal">$${ch.price}</span></h4>

                                </div>
                                <a class="buynow" href="detail?product=${ch.productID}">Buy now</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <a class="seemore" href="catalog?categoryID=3&page=1">See more</a>
            </div>
        </div>
    </div>

    <!-- end news Jewellery -->

    <%@include file="footer_header/footer.jsp" %>
    <!-- Javascript files-->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.0.0.min.js"></script>

    <!-- sidebar -->
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/custom.js"></script>
    <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#dismiss, .overlay').on('click', function () {
                $('#sidebar').removeClass('active');
                $('.overlay').removeClass('active');
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').addClass('active');
                $('.overlay').addClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
        });
    </script>

    <script>
        $(document).ready(function () {
            $(".fancybox").fancybox({
                openEffect: "none",
                closeEffect: "none"
            });

            $(".zoom").hover(function () {

                $(this).addClass('transition');
            }, function () {

                $(this).removeClass('transition');
            });
        });
    </script>
    <script>
        // This example adds a marker to indicate the position of Bondi Beach in Sydney,
        // Australia.
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 11,
                center: {
                    lat: 40.645037,
                    lng: -73.880224
                },
            });

            var image = 'images/maps-and-flags.png';
            var beachMarker = new google.maps.Marker({
                position: {
                    lat: 40.645037,
                    lng: -73.880224
                },
                map: map,
                icon: image
            });
        }
    </script>
    <!-- google map js -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8eaHt9Dh5H57Zh0xVTqxVdBFCvFMqFjQ&callback=initMap"></script>
    <!-- end google map js -->
</body>

</html>









































                                <!--                                    <li><a href="#shoes">Giày</a></li>
                                                                    <li><a href="#">Watches</a></li>
                                                                    <li><a href="#jewellery">Trang sức</a></li>-->