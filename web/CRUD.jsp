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
        <script src="js/mycode.js"></script>
        <style>

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

            .img-responsive{
                width: 120px;
                height: 150px;
            }

            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 10px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 10px 15px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {        
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }	
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 5px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }	
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {        
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }    
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {    
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }	
            .modal form label {
                font-weight: normal;
            }	
        </style>
        <script>

            $(document).on("click", ".edit", function () {
                $(".modal-body #id").val($(this).data('id'));
                $(".modal-body #name").val($(this).data('name'));
                $(".modal-body #price").val($(this).data('price'));
                $(".modal-body #descript").val($(this).data('descript'));
                $(".modal-body #supplier").val($(this).data('supplier'));
            });

            $(document).on("click", ".delete", function () {
                var id = $(this).data('id');
                $(".modal-body #productID").val(id);
            });

        </script>
    </head>
    <body>
        <%@include file="footer_header/header.jsp" %>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Quản lý</h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm</span></a>						
                            </div>
                        </div>
                    </div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${requestScope.num}" var="i">
                                <li class="page-item"><a class="page-link ${requestScope.page==i?"active":""}" href="crud?page=${i}">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </nav>

                    <!--                    <div class="table-responsive mx-auto">-->
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th width="7%">Mã số</th>
                                <th width="20%">Tên</th>
                                <th width="7%">Giá</th>
                                <th width="19%">Người cung cấp</th>
                                <th width="7%">Mô tả</th>
                                <th width="20%">Ảnh</th>
                                <th width="20%">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.data}" var="p">
                                <tr>
                                    <td>${p.productID}</td>
                                    <td><p style=" width: 200px ;white-space: nowrap; overflow: hidden; text-overflow: ellipsis; ">${p.productName}</p></td>
                                    <td>${p.price}</td>
                                    <td>${p.supplier}</td>
                                    <td>${p.description}</td>
                                    <td>
                                        <img class="img-responsive" src="images/${p.image}" />
                                    </td>
                                    <td>
                                        <a href="#editEmployeeModal" class="edit" data-toggle="modal" data-id="${p.productID}" data-name="${p.productName}" data-price="${p.price}" data-descript="${p.description}" data-supplier="${p.supplier}" data-img="${p.image}"><i class="fas fa-pen"></i></a>
                                        <a href="#deleteEmployeeModal" class="delete" data-toggle="modal" data-id="${p.productID}"><i class="fas fa-trash-alt"></i></a>
                                        <a href="addstock?id=${p.productID}&img=${p.image}" style="margin: 5px">Add in Stock</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!--                    </div>-->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${requestScope.num}" var="i">
                                <li class="page-item"><a class="page-link ${requestScope.page==i?"active":""}" href="crud?page=${i}">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </nav>
                </div>
            </div>        
        </div>
        <!-- Add Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addcrud">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">	
                            <div class="form-group">
                                <label for="img">Chọn ảnh</label>
                                <input type="file" id="img-up" name="img" accept="image/*">
                            </div>
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Giá</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Mô tả</label>
                                <input name="description" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Nhà cung cấp</label>
                                <input name="supplier" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="categoryID">Phân loại</label>
                                <select name="categoryID" id="cars">
                                    <option value="1">Áo</option>
                                    <option value="2">Giày</option>
                                    <option value="3">Trang sức</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editcrud">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="image">Select image:</label>
                                <input type="file" id="img-up" name="image" accept="image/*">
                            </div>
                            <div class="form-group">
                                <label>ID</label>
                                <input name="id" id="id" type="text" class="form-control" readonly>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name"  id="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" id="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <input name="description" id="descript" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Supplier</label>
                                <input name="supplier" id="supplier" type="text" class="form-control" required>
                            </div>	
                            <div class="form-group">
                                <label for="categoryID">Phân loại</label>
                                <select name="categoryID" id="cars">
                                    <option value="1">Áo</option>
                                    <option value="2">Giày</option>
                                    <option value="3">Trang sức</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="deletecrud">
                        <div class="modal-header">						
                            <h4 class="modal-title">Xóa sản phẩm</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete this item?</p>
                            <input type="text" id="productID" name="id" readonly="" style="display: none;">
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="footer_header/footer.jsp" %>
    </body>
</html>