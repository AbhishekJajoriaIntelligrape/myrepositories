<%@ page import="linksharing.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <g:set var="uname" value="user" />
        <script type="text/javascript">
            $( document ).ready(function() {
                alert("Document is ready")
            });
     </script>
		<title>User Show</title>
	</head>
	<body>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link controller="topic" action="index">Topic List</g:link></li>
            <li><g:link controller="topic" action="publicTopics">Public Topic List</g:link></li>
            <li><g:link controller="login" action="logout">Sign out</g:link></li>
        </ul>
    </div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1>user</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
                <li>
                    <span id="user-label" class="property-label">Name :</span>
                    <span class="property-value" aria-labelledby="user-label">${userinstance.name}</span>
                </li>
                <br/>
                <li>
                    <span id="user-email" class="property-label">Email :</span>
                    <span class="property-value" aria-labelledby="user-label">${userinstance.email}</span>
                </li>
                <br/>
                <li>
                    <span id="user-phone" class="property-label">Phone :</span>
                    <span class="property-value" aria-labelledby="user-label">${userinstance.contactNO}</span>
                </li>
                <br/>
                <li>
                    <span id="user-address" class="property-label">Address :</span>
                    <span class="property-value" aria-labelledby="user-label">${userinstance.address}</span>
                </li>
                <br/>
                <li>
                    <span id="user-description" class="property-label">Description :</span>
                    <span class="property-value" aria-labelledby="user-label">${userinstance.description}</span>
                </li>
                <br/>
                <li>
                    <span id="user-country" class="property-label">Country :</span>
                    <span class="property-value" aria-labelledby="user-label">${userinstance.country}</span>
                </li>
                <br/>
                <li>
                    <span id="user-gender" class="property-label">Gender :</span>
                    <span class="property-value" aria-labelledby="user-label">${userinstance.gender}</span>
                </li>
			</ol>
            <br/>
			<g:form url="[resource:userinstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userinstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    <g:link controller="topic" action="create">Create new Topic</g:link><br/>

                </fieldset>
			</g:form>
		</div>
	</body>
</html>
