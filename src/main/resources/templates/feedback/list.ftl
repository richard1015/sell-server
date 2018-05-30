<html>
<#include "../common/header.ftl">

<body>
<div id="wrapper" class="toggled">

<#--边栏sidebar-->
    <#include "../common/nav.ftl">

<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>问题id</th>
                            <th>提问用户</th>
                            <th>问题描述</th>
                            <th>问题内容</th>
                            <th>回复内容</th>
                            <th>回复状态</th>
                            <th>创建时间</th>
                            <th>更新时间</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list questionList as productInfo>
                        <tr>
                            <td>${productInfo.id}</td>
                            <td>${productInfo.buyerId}</td>
                            <td>${productInfo.title}</td>
                            <td>${productInfo.content!""}</td>
                            <td>${productInfo.reply!""}</td>
                            <td>${productInfo.status}</td>
                            <td>${productInfo.createTime}</td>
                            <td>${productInfo.updateTime!""}</td>
                            <td><a href="/sell/buyer/question/index?id=${productInfo.id}">回复</a></td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</body>
</html>