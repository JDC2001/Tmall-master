<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>模仿天猫-后台</title>
    <!-- Bootstrap Styles-->
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->

    <!-- Custom Styles-->
    <link href="../assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- TABLE STYLES-->
    <link href="../assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="listCategory">Tmall</a>
        </div>
    </nav>

    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a class="active-menu" href="listCategory"><i class="fa fa-bars"></i> 分类管理</a>
                </li>
                <li>
                    <a href="listUser"><i class="fa fa-user"></i> 用户管理</a>
                </li>
                <li>
                    <a href="listOrder"><i class="fa fa-list-alt"></i> 订单管理</a>
                </li>
                <li>
                    <a href="listLink"><i class="fa fa-link"></i> 推荐链接管理</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        分类管理
                        <small> - ${category.name} 产品管理</small>
                    </h1>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <a href="javascript:history.back()" class="btn btn-success">返回上一页</a>
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            产品管理表
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>产品id</th>
                                        <th>产品名称</th>
                                        <th>产品标题</th>
                                        <th>产品价格</th>
                                        <th>产品销量</th>
                                        <th>产品库存</th>

                                        <th>编辑产品</th>
                                        <th>编辑图片</th>
                                        <th>编辑属性</th>
                                        <th>删除产品</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${products}" var="p">
                                        <tr>
                                            <td>${p.id}</td>
                                            <td>${p.name}</td>
                                            <td>${p.sub_title}</td>
                                            <td>${p.price}</td>
                                            <td>${p.sale}</td>
                                            <td>${p.stock}</td>

                                            <td><a href="editProduct?id=${p.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                                            <td><a href="editProductImage?product_id=${p.id}"><span class="glyphicon glyphicon-picture"></span></a></td>
                                            <td><a href="listPropertyValue?product_id=${p.id}&category_id=${category.id}"><span class="glyphicon glyphicon-list"></span></a></td>
                                            <td><a href="deleteProduct?id=${p.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>

            <%-- 产品增加表单 --%>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            增加产品
                        </div>
                        <div class="panel-body">
                            <form action="addProduct" role="form">
                                <input type="hidden" name="id" value="">
                                <label>产品名称：</label>
                                <input type="text" class="form-control" name="name" placeholder="请在这里输入产品名称">
                                <label>产品标题：</label>
                                <input type="text" class="form-control" name="sub_title" placeholder="">
                                <label>产品价格：</label>
                                <input type="text" class="form-control" name="price" placeholder="">
                                <label>产品销量：</label>
                                <input type="text" class="form-control" name="sale" placeholder="">
                                <label>产品库存：</label>
                                <input type="text" class="form-control" name="stock" placeholder="">
                                <input type="hidden" name="category_id" value="${category.id}">
                                <input type="submit" class="btn btn-default pull-right" value="添加">
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="../assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="../assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="../assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="../assets/js/dataTables/jquery.dataTables.js"></script>
<script src="../assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- Custom Js -->
<script src="../assets/js/custom-scripts.js"></script>


</body>
</html>
