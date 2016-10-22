<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link href="css/profilebox.css" rel="stylesheet" type="text/css"
	media="all" />
	<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<body>
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<div class="container" style="margin-top: 20px; margin-bottom: 20px;">
	<div class="row panel">
		<div class="col-md-4 bg_blur ">
    	    <a href="#" class="follow_btn hidden-xs">Everything Is Beautiful But Everything Isn't Beautiful</a>
		</div>
        <div class="col-md-8  col-xs-12">
           <img src="E:\eclipse 2\eclipse\workspace\cart\src\main\webapp\resources\images\kumar.jpj.JPG" class="img-thumbnail picture hidden-xs" />
           <img src="http://lorempixel.com/output/people-q-c-100-100-1.jpg" class="img-thumbnail visible-xs picture_mob" />
           <div class="header">
                <h1>${user.firstname}</h1>
                <h4>Web Developer</h4>
                <span>
"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."</span>
           </div>
        </div>
    </div>   
    
	<div class="row nav">    
        <div class="col-md-4"></div>
        <div class="col-md-8 col-xs-12" style="margin: 0px;padding: 0px;">
            <div class="col-md-8 col-xs-12 well"><i class=""></i> Niit Habsiguda ,Course=DEVOPS</div>
            <div class="col-md-8 col-xs-12 well"><i class=""></i> location = Boduppal near sri krishna temple,pin=500092</div>
            <div class="col-md-8 col-xs-12 well"><i class=""></i>${user.ph} </div>
            <div class="col-md-4 col-xs-4 well"><i class="fa fa-weixin fa-lg"></i> 16</div>
            <div class="col-md-4 col-xs-4 well"><i class="fa fa-heart-o fa-lg"></i> 14</div>
            <div class="col-md-4 col-xs-4 well"><i class="fa fa-thumbs-o-up fa-lg"></i> 26</div>
        </div>
    </div>
</div>

</body>
</html>