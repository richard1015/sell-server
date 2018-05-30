<html>
<body>

<link href="https://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="jumbotron">
                <h1>
                    商家登录
                </h1>
            </div>
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">账号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="username" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="password" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="button" onclick="login()" class="btn btn-default">登录</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
<script>
    function login() {
        var userId=$("#username").val();
        var pwd=$("#password").val();
        $.ajax({
            type: 'POST',
            url: "/sell/seller/login",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify( {
                username:userId,
                password:pwd
            }),
            dataType: 'json',
            success: function(data){
                console.log(data);
                if(data.code==0){

                    localStorage.setItem("userInfo",JSON.stringify(data.data));
                    window.location.href="/sell/seller/order/list";
                }
            }
        });
    }
</script>
</html>