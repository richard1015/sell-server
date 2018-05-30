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
                    <form class="form-horizontal" role="form">
                        <div class="form-group" >
                            <label>用户id</label>
                            <input id="userId" disabled type="text" class="form-control" value="${(user.id)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>账号</label>
                            <input id="username" type="text" class="form-control" value="${(user.username)!''}"/>
                        </div>
                          <#if user.id?? >

                          <#else>
                            <div class="form-group">
                                <label>密码</label>
                                <input id="password" type="password" class="form-control"/>
                            </div>
                          </#if>
                        <div class="form-group">
                            <label>邮箱</label>
                            <input id="email" type="email" class="form-control" value="${(user.email)!''}"/>
                        </div>

                        <div class="form-group">
                            <label>电话</label>
                            <input id="tel" type="tel" class="form-control" value="${(user.tel)!''}"/>
                        </div>
                        <button type="button" class="btn btn-default" onclick="submitOK()">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    function submitOK() {
        debugger
        var userId = $("#userId").val();
        var username = $("#username").val();
        var eamil = $("#eamil").val();
        var tel = $("#tel").val();
        var password = $("#password").val();
        $.ajax({
            type: 'POST',
            url: "/sell/seller/register",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                username: username,
                password: password,
                state: 0,
                email: eamil,
                tel: tel,
                openid:new Date().getTime()
            }),
            dataType: 'json',
            success: function (data) {
                console.log(data);
                if (data.code == 0) {
                    alert('添加成功');
                    window.location.href="/sell/seller/user/list"
                }
            }
        });
    }
</script>
</body>
</html>