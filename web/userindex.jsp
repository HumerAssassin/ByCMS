<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 2018/4/11
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<%@ page import="com.util.*" %>
<%@page import="com.product.*" %>
<%
  String path=request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()
          +":"+request.getServerPort()+path+"/";
  //获取session中的username
  String username=(String)session.getAttribute("username");
  //获取从 servlet ProductActiion 中 传递的参数(数据库查询的结果)
  List<Map<String,Object>> list =(List<Map<String,Object>>) request.getAttribute("listProduct");
  //获取分页对象
  DividePage dividePage = (DividePage) request.getAttribute("dividePage");
  // 获取查询的关键词
  String productName = (String) request.getAttribute("productName");
  if(list==null){
    //第一次进 main.jsp页面，默认加载所有的产品
    ProductService service = new ProductDao();
    int totalRecord = service.getItemCount("");
    dividePage = new DividePage(5,totalRecord,1);
    int start = dividePage.fromIndex();
    int end = dividePage.toIndex();
    list = service.listProduct("", start, end);
  }
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>>">
    <title>欢迎来到斑鱼水族馆</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap style -->
    <link id="callCss" rel="stylesheet" href="themes/bootshop/bootstrap.min.css" media="screen"/>
    <link href="themes/css/base.css" rel="stylesheet" media="screen"/>
    <!-- Bootstrap style responsive -->
    <link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet"/>
    <link href="themes/css/font-awesome.css" rel="stylesheet" type="text/css">
    <!-- Google-code-prettify -->
    <link href="themes/js/google-code-prettify/prettify.css" rel="stylesheet"/>
    <!-- fav and touch icons -->
    <!-- 页顶LOGO
    	<link rel="shortcut icon" href="themes/images/ico/favicon.ico">-->
    <style type="text/css" id="enject"></style>

    <script type="text/javascript">
        function searchProduct(){
            var th = document.form2;
            th.action="<%=path%>/servlet/ProductAction?action_flag=search";
            th.submit();
        }

        function first(){

            window.location.href = "<%=path%>/servlet/ProductAction?action_flag=search&pageNum=1";

        }
        function next(){

            window.location.href = "<%=path%>/servlet/ProductAction?action_flag=search&pageNum=<%=dividePage.getCurrentPage()+1%>";

        }
        function forward(){

            window.location.href = "<%=path%>/servlet/ProductAction?action_flag=search&pageNum=<%=dividePage.getCurrentPage()-1%>";

        }
        function end(){

            window.location.href = "<%=path%>/servlet/ProductAction?action_flag=search&pageNum=<%=dividePage.getPageCount() %>";

        }

        function changePage(currentPage){

            window.location.href = "<%=path%>/servlet/ProductAction?action_flag=search&pageNum="+currentPage;

        }

        function selectAll(flag){

            var ids = document.getElementsByName("ids");
            for(var i = 0 ; i < ids.length ; i++){
                ids[i].checked = flag;
            }

        }

        function getSelectedCount(){

            var ids = document.getElementsByName("ids");
            var count = 0;
            for(var i = 0 ; i < ids.length ; i++)
            {

                ids[i].checked==true?count++:0;
            }
            return count;

        }

        function del(){

            if(getSelectedCount()==0){

                alert("至少选择一个删除项！");
                return;

            }

            var th = document.form1;
            th.action="<%=path%>/servlet/ProductAction?action_flag=del";
            th.submit();

        }

        function getSelectedValue(){
            var ids = document.getElementsByName("ids");

            for(var i = 0 ; i < ids.length ; i++)
            {

                if(ids[i].checked){
                    return ids[i].value;
                }
            }

        }

        function view(){

            if(getSelectedCount()<1){

                alert("至少选择一个查看项！");
                return;

            }else if(getSelectedCount()>1){
                alert("只能选择一个查看项！");
                return;
            }

            var th = document.form1;
            th.action="<%=path%>/servlet/ProductAction?action_flag=view&proid="+getSelectedValue();
            th.submit();

        }

        function logout(){

            window.location.href="<%=path %>/servlet/LogoutAction?action_flag=logout";

        }


    </script>
  </head>
  <body>
    <div id="header">
      <div class="container">
        <div id="welcomeLine" class="row">
          <div class="span6">欢迎光临 <strong><%=username%></strong><a href="javascript:logout();">退出</a></div>
          <div class="span6">
            <div class="pull-right">
              <span class="btn btn-mini">502..</span>
              <a href="shoppingcarts.jsp">
                <span class="btn btn-mini btn-primary">
                  <i class="icon-shopping-cart icon-white"></i>您的购物车中有3件商品
                </span>
              </a>
            </div>
          </div>
        </div>

      </div>
    </div>

    <script src="themes/js/jquery.js" type="text/javascript"></script>
    <script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="themes/js/google-code-prettify/prettify.js"></script>

    <script src="themes/js/bootshop.js"></script>
    <script src="themes/js/jquery.lightbox-0.5.js"></script>
  </body>
</html>
