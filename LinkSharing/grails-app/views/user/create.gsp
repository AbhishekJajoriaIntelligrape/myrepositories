<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
        <script type="text/javascript">
            $(document).ready(function() {
                alert("Document is ready")
            });
        </script>
        
	</head>
	<body>
		<a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-user" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form controller="user" action="save">
                <label>Email ID :</label> <g:textField name="email" maxlength="50" size="50"/><br/><br/>
                <label>Name : </label> <g:textField name="name" maxlength="50" size="50"/><br><br/>
                <label>PassWord :</label>   <g:passwordField name="password" maxlength="50" size="50"/><br/><br/>
                <label>Re Type Password: </label><g:passwordField name="confirmPassWord" maxlength="50" size="50"/>
                <br/><br/>
                <g:submitButton name="sign" value="Sign Up" />
            </g:form>
		</div>
	</body>
</html>