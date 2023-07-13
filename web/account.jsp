

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="style.css">
        <script src="mycode.js"></script>
        <script>
            function check() {
                var confirm = prompt("Enter your old password");
                var oldpass = document.getElementById("oldpass").value;
                if (oldpass == confirm) {
                    alert("Correct password, changes will be saved");
                    return true;
                } else {
                    alert("Wrong password! Change will not be saved");
                    return false;
                }
            }
        </script>
        <title>Thông tin tài khoản</title>
    </head>

    <body>

        <%@include file="footer_header/header.jsp" %>

        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 border border-dark m-5">
                        <h3>Thông tin liên hệ</h3>
                        <p>Địa chỉ: FPT University, Hoa lac, Hà Nội</p>
                        <p>SĐT: 024 xxx 6650</p>
                        <p>Facebook: <a href="https://www.facebook.com/">Click here</a></p>
                        <img class="w-100 p-3" src="image/contact1.jpg" alt="">
                        <div class="form-group">
                            <a href="chgpwd.jsp">Đổi mật khẩu</a>
                        </div>
                    </div>
                    <form class="col-lg-4 m-2" action="account" onsubmit="return check()" method="post">
                        <h3>Thông tin tài khoản</h3>
                        <div class="form-group">
                            <label>Tên đăng nhập</label>
                            <input type="text" class="form-control" name="username" value="${sessionScope.account.username}" readonly>
                        </div>
                        <div class="form-group">
                            <input type="password" style="display: none;" class="form-control" id="oldpass" value="${sessionScope.account.password}">
                        </div>
                        
                        <div class="form-group">
                            <label>Họ và tên</label>
                            <input type="text" class="form-control" name="fullname" value="${requestScope.customer.fullname}">
                        </div>
                        <div class="form-group">
                            <label>Email:</label>
                            <input type="email" class="form-control" name="email" value="${sessionScope.account.email}">
                        </div>
                        <div class="form-group">
                            <label>Số điện thoại:</label>
                            <input type="phone" class="form-control" name="phone" value="${requestScope.customer.phone}">
                        </div>
                        <div class="form-group">
                            <label>Địa chỉ</label>
                            <input type="text" class="form-control" name="address" value="${requestScope.customer.address}">
                        </div>
                        <div class="form-group">
                            <label for="genders">Giới tính</label>
                            <select name="genders">
                                <option value="Nam" selected="">Nam</option>
                                <option value="Nữ">Nữ</option>
                            </select>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Save"/>
                        <small id="emailHelp" class="form-text text-muted">Chúng tôi sẽ không chia sẻ thông tin này với bất kỳ ai</small>
                    </form>
                    <div class="col-lg-3 border border-dark m-5">
                        <h3 style="color: green">Thống kê</h3>
                        <p>Trong tháng này, bạn có <span style="color: red; font-size:20px; font-weight: bold">${requestScope.orderNum}</span> đơn hàng</p>
                        <c:if test="${requestScope.orderNum>0}">
                            <h4 style="color: green">Mặt hàng mua nhiều nhất</h4>
                            <p><bold>${requestScope.most_buy.dogName}</bold> - <span style="color: red; font-size:20px; font-weight: bold">${requestScope.most_num}</span> sản phẩm </p>
                            <img style="width: 120px; height: 150px;" src="${requestScope.most_buy.img}"><br><br>
                        </c:if>
                        <a href="chart" style="text-decoration: threedface;"><button>Xem lại lịch sử mua hàng?</button></a>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="footer_header/footer.jsp" %>

    </body>

</html>
