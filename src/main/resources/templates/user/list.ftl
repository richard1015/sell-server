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
                            <th>用户id</th>
                            <th>用户姓名</th>
                            <th>类型</th>
                            <th>邮箱</th>
                            <th>电话</th>
                            <th>创建时间</th>
                            <th>修改时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list userList as productInfo>
                        <tr>
                            <td>${productInfo.id}</td>
                            <td>${productInfo.username}</td>
                            <td>
                                  <#if productInfo.state=="1">
                                     超级管理员
                                  </#if>
                                 <#if productInfo.state=="0">
                                     普通管理员
                                 </#if>
                            </td>
                            <td>${productInfo.email!""}</td>
                            <td>${productInfo.tel!""}</td>
                            <td>${productInfo.createTime}</td>
                            <td>${productInfo.updateTime}</td>
                            <td><a href="/sell/seller/user/index?id=${productInfo.id}">修改</a></td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>