<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="${ctx}/static/css/reset.css">
    <link href="${ctx}/static/font/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/navbar.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/manage_index.css">

    <title>用户权限管理</title>

</head>
<body>

<!-- navigation -->
<div class="nav-top">
    <a class="navbar-brand" href="" style="color: #fff;">PiliPili</a>
    <ul class="navtop-items">
        <li class="navtop-item">
            <a href="" class="message">
                <i class="fa fa-fw fa-envelope"></i>
                <span>Message</span>
            </a>
        </li>

        <li class="navtop-item">
            <a href="" class="logout">
                <i class="fa fa-fw fa-sign-out"></i>
                <span>Logout</span>
            </a>
        </li>
    </ul>
</div>
<div class="nav-side">
    <ul id="nav-side">
        <li class="nav-item">
            <a class="sidenav-first-level">
                <span class="navside-text">新闻管理</span>
                <i class="fa fa-angle-right "></i>
            </a>

            <ul class="sidenav-second-level">
                <li class="nav-item">
                    <a href=""><span class="navside-text">全部资讯</span></a>
                </li>
                <li class="nav-item">
                    <a href=""><span class="navside-text">最新咨询</span></a>
                </li>
                <li class="nav-item">
                    <a href=""><span class="navside-text">热点资讯</span></a>
                </li>

            </ul>

        </li>

        <li class="nav-item">
            <a href="">
                <span class="navside-text">栏目管理</span>
            </a>
        </li>

        <li class="nav-item">
            <a href="">
                <span class="navside-text">用户权限管理</span>
            </a>
        </li>

        <li class="nav-item">
            <a href="">
                <span class="navside-text">用户信息管理</span>
            </a>
        </li>

        <li class="nav-item">
            <a href="">
                <span class="navside-text"></span>
            </a></li>
        <li class="nav-item">
            <a href="">
                <span class="navside-text"></span>
            </a></li>

        <li class="nav-item">
            <a href="">
                <span class="navside-text"></span>
            </a></li>


    </ul>
</div>


<!-- container -->
<div class="container">
    <div class="container-fluid">
        <!-- 当前所在页面 -->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">index</a>
            </li>
            <li class="breadcrumb-item">
                <span>/ 用户权限管理</span>
            </li>
        </ol>

        <div class="card">

            <div class="card-header">
                <i class="fa fa-table"></i>
                <span>用户列表</span>
                <a id="add">添加<i class="fa fa-plus-square"></i></a>
            </div>

            <div class="card-body">
                <div class="row"></div>

                <!-- 用户列表 -->
                <div class="row">
                    <form>
                        <table style="text-align: center;">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>用户名</th>
                                <th>级别</th>
                                <th colspan="2" >操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>${user.username}</td>
                                <td>${user.role}</td>
                                <td><a id="change-authority" >更改权限</a></td>
                                <td><a id="delect">删除</a></td>
                            </tr>

                            </tbody>
                        </table>

                        <!-- 弹出窗口-添加账户 -->
                        <div id="add-box1">
                            <form>
                                <li>
                                    <lable>用户名：</lable>
                                    <input type="text" name="username" value=""></li>
                                <li>
                                    <lable>权限级别：</lable>
                                    <select>
                                        <option value="administer">管理员</option>
                                        <option value="ordinary-user">普通用户</option>
                                    </select></li>
                                <a class="button" name="">确认添加</a>
                                <a id="closeBtn1" class="button">取消添加</a>
                            </form>
                        </div>

                        <!-- 弹出窗口-更改权限 -->
                        <div id="change-authority-box">
                            <form>
                                <li>
                                    <lable>用户名：</lable>
                                    <input type="text" name="username" value="${user.username}"></li>
                                <li>
                                    <lable>更改权限：</lable>
                                    <select>
                                        <option value="administer">管理员</option>
                                        <option value="ordinary-user">普通用户</option>
                                    </select></li>
                                <a class="button" name="">确认修改</a>
                                <a id="closeBtn2" class="button">取消修改</a>
                            </form>
                        </div>

                        <!-- 弹出窗口-删除 -->
                        <div id="delect-box">
                            <form>
                                <div class="ttBox">
                                    <h1>提示</h1>
                                </div>
                                <div class="txtBox">
                                    <p>你确定要删除该用户吗？？？（小心挨打</p>
                                </div>
                                <div class="btnArea">
                                    <div class="btnArea">
                                        <a class="button">确定删除</a>
                                        <a class="button" id="closeBtn3">取消删除</a>
                                    </div>
                                </div>
                            </form></div>




                        <!-- 分页 -->
                        <div class="row">
                            <ul class="pagination">
                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page_link" id="dataTable_previous disabled">Previous</a></li>
                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page_link">1</a></li>
                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page_link">2</a></li>
                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page_link">3</a></li>
                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page_link">4</a></li>
                                <li class="paginate_button">
                                    <a href="" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page_link next" id="dataTable_next">Next</a></li>
                            </ul>
                        </div>
                    </form>
                </div>


            </div><!-- card -->
        </div>
    </div><!-- container-fluid -->

    <div class="card-footer"></div>





</div>



</div>
<script type="text/javascript" src="${ctx}/static/js/vue.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/static/js/navbar.js"></script>
<script type="text/javascript" src="${ctx}/static/js/accessManagement.js"></script>

</body>
</html>