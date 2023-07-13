<%-- 
    Document   : contact
    Created on : Jun 6, 2021, 7:37:42 PM
    Author     : laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Liên hệ</title>
    </head>

    <body>

        <%@include file="footer_header/header.jsp" %>


        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 border border-dark m-5">
                        <h3>Thông tin liên hệ</h3>
                        <p>Địa chỉ: Số 7 Thiền Quang, Nguyễn Du, Hai Bà Trưng, Hà Nội</p>
                        <p>SĐT: 024 3573 6650</p>
                        <p>Facebook: <a href="https://www.facebook.com/hood.red.397/">Click here</a></p>
                        <img class="w-100 p-3" src="image/contact1.jpg" alt="">
                    </div>
                    <form class="col-lg-4 m-5">
                        <div class="form-group">
                            <label>Họ và tên:</label>
                            <input type="text" class="form-control" name="name" placeholder="Nhập họ và tên">
                        </div>
                        <div class="form-group">
                            <label>Email:</label>
                            <input type="email" class="form-control" name="email" placeholder="Nhập địa chỉ email">
                            <small id="emailHelp" class="form-text text-muted">Chúng tôi sẽ không chia sẻ thông tin với bất kỳ ai</small>
                        </div>
                        <div class="form-group">
                            <label>Số điện thoại:</label>
                            <input type="text" class="form-control" name="phone" placeholder="Nhập số điện thoại">
                        </div>
                        <div class="form-group">
                            <label>Nội dung lời nhắn:</label>
                            <textarea type="text" class="form-control" name="content" rows="7" placeholder="Để lại lời nhắn"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">GỬI ĐI</button>
                    </form>
                </div>
            </div>
        </div>

        <%@include file="footer_header/footer.jsp" %>

    </body>

</html>
