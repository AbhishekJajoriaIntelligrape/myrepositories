<html>
<head>
    <meta name="layout" content="main">
    <title>LinkSharing</title>
</head>
<body>
<g:dateFormat date="2009-12-01" name="myDate"/>
<br/>
<div id="loginDiv">
    <br/>
    <g:if test="${msg!=null&&!msg.isEmpty()}">
        ${msg}
    </g:if><br/>
    <g:link controller="home" action="index"> Go to Login</g:link>

</div>
</body>
</html>