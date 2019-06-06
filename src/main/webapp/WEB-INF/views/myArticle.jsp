<%--
  Created by IntelliJ IDEA.
  User: 张慧
  Date: 2019/6/2
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的文章</title>
    <script>var ctx=${ctx}</script>
    <link rel="shorcut icon" type="image/x-icon" href="${ctx}/static/img/favicon.ico">
    <link href="${ctx}/static/css/index.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/sideMenu.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/topnav.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/userIndex.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/myArticle.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/static/vue/vue.js"></script>
</head>
<body>
<div class="contenter">
    <div class="news-topnav">
        <div class="widthfix">
                <span class="news-logo" onclick="javascript:window.location.href='${ctx}/index'">
                    <img src="static/img/CN_bilibiliB.png">
                </span>
            <span class="icon">

                </span>
        </div>
    </div>
    <div class="main-body">
        <div class="widthfix">
            <div class="side-menu" id="side-menu" v-bind:class="{lowH:notauthor,highH:!notauthor}">
                <div class="menu-avatar">
                    <div class="menu-myAvatar"><img src="static/img/indexPhoto.png"></div>
                    <div class="menu-myName">${user.username}</div>
                </div>
                <ul class="menu-body menu-body-nomal" onselectstart="return flase">
                    <li onclick="javascript:window.location.href='${ctx}/myInf'">
                        个人信息
                    </li>
                    <li onclick="javascript:window.location.href='${ctx}/myComment'">
                        我的评论
                    </li>
                </ul>
                <ul class="menu-body menu-body-author" v-bind:class="{hide:notauthor}" onselectstart="return flase">
                    <li onclick="javascript:window.location.href='${ctx}/myArticle'" class="bc-highlight">
                    文章管理
                    </li>
                    <li onclick="javascript:window.location.href='${ctx}/commentManagement'">
                    评论管理
                    </li>
                </ul>
            </div>
            <div class="main-content" id="myarticle-area">
                <div class="article-search">
                    <form action="#" method="post" class="article-search">
                        <input type="text" name="search" class="article-search-text">
                        <input type="submit" value="查找" class="article-search-btn">
                    </form>
                    <span class="article-add-btn" onclick="javascript:window.location.href='${ctx}/add'">
                        <img src="static/img/addnav.png"/>
                        新增
                    </span>
                </div>
                <ul class="article-list">
                    <li class="article-empty-nav" v-bind:class="{hide:!noArticle}">
                        <img src="static/img/none.jpg" style="width: 300px">
                    </li>
                    <c:forEach var="article" items="${newsList}">
                        <li class="article-nav" onclick="javascript:window.location.href='${ctx}/article/view/${article.id}'">
                            <div class="article-title">
                                <a>${article.title}</a>
                            </div>
                            <div class="atricle-inf">
                                <span>
                                    ${article.createAt}
                                </span>
                                <span>
                                    评论数：
                                </span>
                                <span class="span-btn eidt-btn" onclick="javascript:window.location.href='${ctx}/edit'">
                                        编辑
                                </span>
                                <span class="span-btn remove-btn">
                                        删除
                                </span>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${ctx}/static/js/index.js"></script>
<script src="${ctx}/static/js/sideMenu.js"></script>
<script src="${ctx}/static/js/myArticle.js"></script>
<script>
    if(${articleList})myArticleVM.noArticle =false;
</script>
</html>
