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
                    <form role="form" method="post">
                        <div class="form-group">
                            <label>用户id</label>
                            <input name="categoryName" disabled type="text" class="form-control" value="${(user.id)!''}" />
                        </div>
                        <div class="form-group">
                            <label>姓名</label>
                            <input name="categoryType" type="text" class="form-control" value="${(user.username)!''}"/>
                        </div>

                        <div class="form-group">
                            <label>邮箱</label>
                            <input name="categoryType" type="text" class="form-control" value="${(user.eamil)!''}"/>
                        </div>

                        <div class="form-group">
                            <label>电话</label>
                            <input name="categoryType" type="text" class="form-control" value="${(user.tel)!''}"/>
                        </div>
                        <button type="button" class="btn btn-default">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>