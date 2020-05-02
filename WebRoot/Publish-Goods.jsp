<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,beans.*" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    response.setCharacterEncoding("utf-8");%>
<%@ include file="filter.jsp" %>
<!-- 此页面用来显示所有商品信息 -->

<html lang="zxx">
<style type="text/css">
    .img-wrap {
        position: relative;
        display: inline-block;
        font-size: 0;
    }

    .img-wrap .close {
        position: absolute;
        top: 2px;
        right: 2px;
        z-index: 100;
        background-color: #FFF;
        padding: 5px 2px 6px;
        color: #000;
        font-weight: bold;
        cursor: pointer;
        text-align: center;
        font-size: 22px;
        line-height: 10px;
        border-radius: 50%;
    }

    .img-wrap:hover .close {
        opacity: 1;
    }
</style>
<!--固定页头部分 -->
<%@ include file="header.jsp" %>
<body style="height: 100%">

<!--  主体部分  -->
<script language="javascript">
    function check() {
        if (publishGoods.goods_stock.value > 20) {
            layer.msg("发布数量请少于20件！");
            publishGoods.goods_stock.focus();
            return false;
        }
        var myeprice = publishGoods.goods_price.value;  //
        var myReg = /\d+(\.\d+)?/;
        if (!myReg.test(myeprice)) {
            layer.msg("请输入正确的价格");
            publishGoods.goods_price.focus();
            return false;
        }
    }

</script>


<!--  开始进行发布商品 -->

<div class="offcanvas-wrapper">
    <!-- Start Page Title -->
    <div class="page-title">
        <div class="container">
            <div class="column">
                <h1>发布你的二手信息</h1>
            </div>
            <div class="column">
                <ul class="breadcrumbs">
                    <li><a href="index-1.html">主页</a></li>
                    <li class="separator">&nbsp;</li>
                    <li>发布商品</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- End Page Title -->


    <!-- Start Product Content -->
    <div class="container padding-top-1x padding-bottom-3x">
        <div class="row">
            <!--                                                      在这里上传多张图片，并预览                                      -->
            <!--            Start Product Gallery -->
            <div class="col-md-6">
                <div class="product-gallery">
                <span class="product-badge text-danger"> <button type="button" class="layui-btn" id="uploadImages">
  				<i class="layui-icon">&#xe67c;</i>上传图片
				</button><span>&nbsp;&nbsp;&nbsp;<i class="layui-icon">&nbsp;&nbsp;&nbsp;&#xe609;&nbsp;你上传的第一张图片将作为封面&nbsp;&#xe609;</i></span></span>

                    <!--                <i class="layui-icon">&#xe624;</i>     -->
                    <div class="product-carousel" id="showImgDiv">
                        <div class="owl-stage-outer">
                            <div class="owl-stage"
                                 style="width: 523px; transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s;">
                                <div class="owl-item active" style="width: 523px;">
                                    <div id="bigImg">
                                        <%--<img src="uploadFile/b/7/test1_1586159270676.jpg" alt="Product">--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <ul class="product-thumbnails" id="allImgs">
                    </ul>
                </div>
            </div>
            <!--             End Product Gallery -->
            <!--                                                               结束上传多张图片                                            -->

            <!-- Start Product Info -->
            <div class="col-md-6 single-shop">
                <div class="hidden-md-up"></div>


                <!--开始填写表单，待执行servlet验证       -->
                <form class="row" name="publishGoods" id="publishGoodsForm" action="usuallyController" method="post"
                      onsubmit="return check()">
                    <input type="hidden" name="url" value="发布商品">

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="account-fn">商品名</label>
                            <input class="form-control" type="text" name="goods_name" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="account-fn">价格</label>
                            <input class="form-control" type="text" name="goods_price" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="account-ln">发布的数量</label>
                            <input class="form-control" type="text" name="goods_stock" required
                                   oninput="value=value.replace(/[^\d]/g , '')">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="quantity">请选择分类</label>
                            <select class="form-control" id="quantity" name="goods_category">
                                <option value="计算机书籍">计算机书籍</option>
                                <option value="耳机">耳机</option>
                                <option value="电脑">电脑</option>
                                <option value="相机">相机</option>
                                <option value="单片机">单片机</option>
                                <option value="开发软件/工具">开发软件/工具</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="account-phone">添加商品简介</label>
                            <textarea class="form-control" name="goods_describe" required></textarea>
                        </div>
                    </div>


                    <div class="col-6">
                        <hr class="mt-2 mb-3">
                        <div class="d-flex flex-wrap justify-content-between align-items-center">
                            <input type="hidden" name="goodsPictures" id="goodsPictures" value="">
                            <button class="btn btn-primary " type="button" onclick="submitGoods()">发布</button>
                        </div>
                    </div>


                </form>
            </div>

            <!-- End Product Info -->
        </div>


    </div>
    <!-- End Product Content -->
</div>
<!--固定页脚部分 -->
<%@ include file="publishGoodsfooter.jsp" %>

</body>
<script>
    $(function () {
        var allImgs = $("#allImgs");
        layui.use(['upload', 'layer'], function () {
            var upload = layui.upload,
                layer = layui.layer;
            //多文件上传
            var multipleUploadInst = upload.render({
                elem: '#uploadImages'
                , url: basePath + '/uploadFile?url=multipleUpload'
                , multiple: true
                , acceptMime: 'image/*'
                , field: 'files'
                , choose: function (obj) {
                    layer.load(); //上传loading
                }
                , done: function (res) {
                    if (res.code == '0') {//成功
                        $.each(res.data, function (k, o) {
                            var imgHtml = '<li><a href="#' + o.identifier + '" class="img-wrap"><span onclick="closeImg(this);" class="close">&times;</span><img onclick="imgClick(this);" src="' + o.src + '" alt="Product"></a></li>';
                            allImgs.append(imgHtml);
                        });
                    } else {
                        layer.msg(res.msg, {
                            icon: 2
                        });
                    }
                }
                , allDone: function (obj) { //当文件全部被提交后，才触发
                    $("#allImgs li:last-child").find("img").click();
                    layer.closeAll('loading');
                    layer.msg("文件上传完成！", {
                        icon: 1
                    });
                }
                , error: function () {
                    layer.closeAll('loading');
                    layer.msg("请求异常", {
                        icon: 2
                    });
                }
            });
        });
    })
    function imgClick(obj){
        $("#bigImg").html('<img src="'+$(obj).attr("src")+'" alt="Product">');
        $(obj).parent().parent().siblings().removeClass('active');
        $(obj).parent().parent().addClass("active")
    }
    function closeImg(obj){
        $(obj).parent().parent().remove();
        if($("#allImgs li:last-child").length > 0){
            $("#allImgs li:last-child").find("img").click();
        }else{
            $("#bigImg").html('');
        }

    }
    function submitGoods(){
        var goodsPictures = new Array();
        $("#allImgs li").each(function(){
            goodsPictures.push($(this).find("img").attr("src"));
        });
        $("#goodsPictures").val(goodsPictures.join(","));
        $("#publishGoodsForm").submit();
    }
</script>
</html>



