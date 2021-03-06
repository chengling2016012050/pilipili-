<%--
  Created by IntelliJ IDEA.
  User: 张慧
  Date: 2019/6/3
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
    <script>var ctx = "${ctx}"</script>
    <link rel="shorcut icon" type="image/x-icon" href="${ctx}/static/img/favicon.ico">
    <link href="${ctx}/static/css/index.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/sideMenu.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/topnav.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/userIndex.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/myInf.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/imgUpload.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/iconfont.css" rel="stylesheet" type="text/css">

    <script src="${ctx}/static/vue/vue.js"></script>
</head>
<div class="contenter">
    <div class="news-topnav">
        <div class="widthfix">
                <span class="news-logo" onclick="javascript:window.location.href='${ctx}/index'">
                    <img src="static/img/CN_bilibiliB.png">
                </span>
            <span class="top-icon">
                <c:choose>
                    <c:when test="${user.avatar!=''&&user.avatar!=null}">
                        <img src="${ctx}/upload/${user.avatar}">
                    </c:when>
                    <c:otherwise>
                        <img src="${ctx}/static/img/indexPhoto.jpg">
                    </c:otherwise>
                </c:choose>
                <div class="userInf-drop-down">
                    <span class="userInf-drop-down-name">${user.username}</span>
                    <span onclick="javascript:window.location.href='${ctx}/myInf'">个人中心</span>
                    <shiro:hasRole name="admin">
                        <span onclick="javascript:window.location.href='${ctx}/add'">写文章</span>
                    </shiro:hasRole>
                    <span onclick="javascript:window.location.href='${ctx}/logout'">登出</span>
                </div>
            </span>
        </div>
    </div>
    <div class="main-body">
        <div class="widthfix">
            <div class="side-menu" id="side-menu">
                <div class="menu-avatar">
                    <div class="menu-myAvatar">
                        <c:choose>
                            <c:when test="${user.avatar!=''&&user.avatar!=null}">
                                <img src="${ctx}/upload/${user.avatar}">
                            </c:when>
                            <c:otherwise>
                                <img src="${ctx}/static/img/indexPhoto.jpg">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="menu-myName">${user.username}</div>
                </div>
                <ul class="menu-body menu-body-nomal" onselectstart="return flase">
                    <li onclick="javascript:window.location.href='${ctx}/myInf'" class="bc-highlight">
                        <svg class="icon" aria-hidden="true"><use xlink:href="#i-personal"></use></svg>个人信息
                    </li>
                    <li onclick="javascript:window.location.href='${ctx}/myComment'">
                        <svg class="icon" aria-hidden="true"><use xlink:href="#i-wenzhang"></use></svg>我的评论
                    </li>
                </ul>
                <shiro:hasRole name="admin">
                    <ul class="menu-body menu-body-author" onselectstart="return flase">
                        <li onclick="javascript:window.location.href='${ctx}/myArticle'">
                            <svg class="icon" aria-hidden="true"><use xlink:href="#i-linedesign-01"></use></svg>文章管理
                        </li>
                    </ul>
                </shiro:hasRole>
            </div>
            <%--右边栏，用户信息详情--%>
            <div class="main-content">
                <div class="inf-body" id="inf-body">
                    <div class="avatar-box">
                        <span class="inf-lable">头像</span>
                        <p>
                            <span class="inf-avatar">
                                <c:choose>
                                    <c:when test="${user.avatar!=''&&user.avatar!=null}">
                                        <img src="${ctx}/upload/${user.avatar}">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${ctx}/static/img/indexPhoto.jpg">
                                    </c:otherwise>
                                </c:choose>
                            </span>
                            <span class="inf-update-btn">
                                <span id="show-field" v-on:click="turnUploadBox">{{avatarfix}}</span>
                            </span>
                        </p>
                        <div class="upload-field" v-bind:class="{hide:avatarBox}">
                            <span class="upload-tip" id="upload-tip">将jpg、jpeg或png格式图片拖入此框或点击下面按钮选择本地图片</span><br>
                            <div class="show-field">
                                <form action="${ctx}/myInf/upload" method="post" enctype="multipart/form-data">
                                    <label for="input-file">
                                        <img src="${ctx}/static/img/show.png" id="show-img"><br>
                                        从本地选择
                                    </label><br>
                                    <input type="file" accept="image/jpeg,image/jpg,image/png" id="input-file" name="uploadfile"
                                           required="required" class="hide" onchange="preview()">
                                    <input type="submit" value="提交" id="avatar-submit">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="inf-box">
                        <span class="inf-lable">用户名</span>
                        <p>${user.username}</p>
                    </div>
                    <div class="inf-box">
                        <span class="inf-lable">性别</span>
                        <p>${user.gender.name}<span class="inf-update-btn"
                                                    v-on:click="turnGenderBox">{{genderfix}}</span></p>
                        <form method="post" action="${ctx}/myInf/editGender" v-bind:class="{hide:genderBox}"
                              class="gender-form">
                            <input name="gender" type="radio" value="男" id="male"><label for="male">男</label><br>
                            <input name="gender" type="radio" value="女" id="female"><label for="female">女</label><br>
                            <input name="gender" type="radio" value="保密" id="secret"><label for="secret">保密</label><br>
                            <input type="submit" class="inf-submit-btn" value="确认">
                        </form>
                    </div>
                    <div class="inf-box">
                        <span class="inf-lable">学历</span>
                        <p>${user.education.name}<span class="inf-update-btn" v-on:click="turnEducationBox">{{educationfix}}</span>
                        </p>
                        <form method="post" action="${ctx}/myInf/editEducation" v-bind:class="{hide:educationBox}"
                              class="edu-form">
                            <select name="education" required="required">
                                <option value="无">无</option>
                                <option value="小学">小学</option>
                                <option value="初中">初中</option>
                                <option value="高中">高中</option>
                                <option value="大学及以上">大学及以上</option>
                            </select>
                            <br>
                            <input type="submit" class="inf-submit-btn" value="确认">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${ctx}/static/js/myInf.js"></script>
<script src="${ctx}/static/js/imgUpload.js"></script>
<script src="//at.alicdn.com/t/font_1255575_oim453ibvj.js"></script>

</html>
