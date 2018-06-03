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
                        <#--<div class="form-group">-->
                            <#--<label>用户id</label>-->
                        <#--</div>-->
                        <div class="form-group">
                            <label>账号</label>
                            <input id="username" type="text" class="form-control" value="${(user.username)!''}"/>
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <#if user.id??>
                                                        <input id="password" type="password"
                                                               class="form-control"
                                                               value="${(user.password)!''}"/>
                            <#else>
                                                            <input id="password" type="password" class="form-control"
                                                                   value="${(user.password)!''}"/>
                            </#if>
                        </div>
                        <div class="form-group">
                            <label>邮箱</label>
                            <input id="email" type="email" class="form-control" value="${(user.email)!''}"/>
                        </div>

                        <div class="form-group">
                            <label>电话</label>
                            <input id="tel" type="tel" class="form-control" value="${(user.tel)!''}"/>
                        </div>
                        <input hidden type="text" id="state" value="${(user.state)!''}">
                        <input hidden type="text" id="userid" value="${(user.id)!''}">
                        <input id="userId" hidden type="text" disabled value="${(user.id)!''}"/>
                        <button type="button" class="btn btn-default" onclick="submitOK()">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    function submitOK() {
        var id = $("#userid").val();
        var userId = $("#userId").val();
        var username = $("#username").val();
        var email = $("#email").val();
        var tel = $("#tel").val();
        var password = $("#password").val();
        var state = $("#state").val();
        var params = {
            username: username,
            password: password,
            state: state || 0,
            email: email,
            tel: tel,
            openid: new Date().getTime(),
            id: id
        };
        console.log(params)
        $.ajax({
            type: 'POST',
            url: userId ? "/sell/seller/update" : "/sell/seller/register",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(params),
            dataType: 'json',
            success: function (data) {
                console.log(data);
                if (data.code == 0) {
                    alert(userId ? '修改成功' : "添加成功");
                    window.location.href = "/sell/seller/user/list"
                }else if(data.code == 50001){
                    alert("该业务员已经存在");
                }else{
                    alert("提交失败！")
                }
            }
        });
    }
</script>
</body>
</html>