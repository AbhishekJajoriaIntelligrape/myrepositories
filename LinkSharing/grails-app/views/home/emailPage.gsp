<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 3/6/14
  Time: 12:53 PM
--%>
<html>
<head>
    <meta name="layout" content="main">
    <title>LinkSharing</title>
</head>
<body>
<g:dateFormat date="2009-12-01" name="myDate"/>
<br/>
<div id="loginDiv">
    <g:form controller="home" action="sentPassword" method="post">
        <label>Email :</label> <g:textField name="email" maxlength="50" size="50"/><br/><br/>
        <br/><br/>
        <g:submitButton name="sign" value="Send Password" />
    </g:form><br/>
</div>
</body>
</html>
