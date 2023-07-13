
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <script src="js/mycode.js"></script>
        <title>Đăng nhập</title>
    </head>

    <body>

        <%@include file="footer_header/header.jsp" %>


        <div class="main">
            <div class="container-fluid mb-5 mt-5">
                
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <c:if test = "${requestScope.error != null}">
                            <h2>${requestScope.error}</h2>
                        </c:if>
                        <div class="card">
                            <div class="card-header">Đăng nhập</div>
                            <div class="-body p-4">
                                <form action="login" method="post">
                                    <div class="form-group row">
                                        <label for="email_address" class="col-md-4 col-form-label text-md-right">Tên đăng nhập</label>
                                        <div class="col-md-6">
                                            <input type="text" id="username" class="form-control" name="username" required autofocus>
                                        </div>
                                    </div>
                                        
                                    <div class="form-group row">
                                        <label for="password" class="col-md-4 col-form-label text-md-right">Mật khẩu</label>
                                        <div class="col-md-6">
                                            <input type="password" id="password" class="form-control" name="password" required>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-6 offset-md-4">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="remember"> Ghi nhớ đăng nhập
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                            Đăng nhập
                                        </button>
                                    </div>

                                    <div class="col-md-6 offset-md-4">
                                        <small id="signup" class="form-text text-muted mt-4">Chưa có tài khoản?<span>
                                                <a href="signup" class="btn btn-link">
                                                    Đăng ký
                                                </a>
                                            </span></small>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="footer_header/footer.jsp" %>

    </body>

</html>
