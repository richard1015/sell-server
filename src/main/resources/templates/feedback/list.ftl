<html>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
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
                            <td><textarea name="" id="" cols="30" rows="3">${productInfo.content!""}</textarea></td>
                            <td><textarea name="" id="q${productInfo.id}" cols="30"
                                          rows="3">${productInfo.reply!""}</textarea></td>
                            <td>
                                <#if productInfo.status==0>
                                    未回复
                                </#if>
                                  <#if productInfo.status==1>
                                    已回复
                                  </#if>
                            </td>
                            <td>${productInfo.createTime}</td>
                            <td>${productInfo.updateTime!""}</td>
                            <td>
                                  <#if productInfo.status==0>
                                                                    <a href="javascript:void(0)"
                                                                       onclick="reply(${productInfo.id})">回复</a>
                                  </#if>
                                  <#if productInfo.status==1>
                                    无
                                  </#if>
                            </td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <script>
        function reply(id) {
            var replycontent = $("#q" + id).val();
            if (!eplycontent) {
                alert("请填写回复内容");
            }
            $.ajax({
                type: 'POST',
                url: "/sell/buyer/question/reply",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({
                    id: id,
                    reply: replycontent
                }),
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    if (data.code == 0) {
                        window.location.reload();
                    }
                }
            });
        }
    </script>
</body>
</html>