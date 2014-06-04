<%@ page import="linksharing.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link controller="login" action="logout">Sign out</g:link></li>
            </ul>
		</div>
		<div id="edit-user" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${user}">
			<ul class="errors" role="alert">
				<g:eachError bean="${user}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:user, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${user?.version}" />
                Name : <g:textField name="name" value="${user.name}"/><br/><br/>
                Address:<g:textArea name="address" value="${user.address}"/><br/><br/>
                Country:<g:countrySelect name="country" value="${user.country}"/><br/><br/>
                Contact NO : <g:textField name="contactNO" value="${user.contactNO}"/>
                Gender : <g:select name="gender" from=""/>
                <br/><br/>

                <fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
