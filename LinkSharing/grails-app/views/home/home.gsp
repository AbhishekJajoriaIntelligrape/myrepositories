<html>
<head>
    <meta name="layout" content="main">
    <title>LinkSharing</title>
</head>
<body>
<g:dateFormat date="2009-12-01" name="myDate"/>
<br/>
<div id="loginDiv">
    <g:form controller="login" action="login" method="post">
        <label>UserName :</label> <g:textField name="userName" maxlength="50" size="50"/><br/><br/>
        <label>PassWord :</label>   <g:passwordField name="passWord" maxlength="50" size="50"/>
        <br/><br/>
        <g:submitButton name="sign" value="Sign In" />
    </g:form><br/>
    <g:link controller="home" action="sentPasswordDetails">Forgot Password</g:link>
    <br/>
    <label>Not A member </label><g:link controller="user" action="create">Create New User</g:link>
</div>
</body>
</html>
