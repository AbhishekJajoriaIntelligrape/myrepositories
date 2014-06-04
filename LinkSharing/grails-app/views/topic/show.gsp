<%@ page import="helper.InterestLevel; linksharing.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-topic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><g:link class="list" controller="user" action="index">Send Invites</g:link></li>
                <li><g:link class="list" controller="user" action="index">Resources</g:link></li>
			</ul>
		</div>
		<div id="show-topic" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list topic">
			
				<g:if test="${topicInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="topic.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${topicInstance}" field="description"/></span>
					
				</li>
                    <li class="fieldcontain">
                        <span id="user-label" class="property-label">Visibility</span>

                        <span class="property-value" aria-labelledby="user-label">${topicInstance.access}</span>

                    </li>
				</g:if>
			
				<g:if test="${topicInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="topic.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${topicInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topicInstance?.user}">
				<li class="fieldcontain">
					<span id="user" class="property-label"><g:message code="topic.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${topicInstance?.user?.id}">${topicInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>

                <li class="fieldcontain">
                    <g:form controller="subscribed" action="save">
                    <span id="user-label" class="property-label">Subscribed</span>
                    <span  class="property-value" aria-labelledby="user-label">
                        <g:checkBox name="isSubscribed"/>
                    </span>
                        <br/>
                        <span id="user-label" class="property-label">Interest Level</span>

                        <span  class="property-value" aria-labelledby="user-label">
                            <g:select name="interestLevel" from="${Interestlist}"  optionKey="name"  optionValue="name"/>
                        </span>
                        <g:hiddenField name="user" value="${topicInstance.user.id}"/>
                        <g:hiddenField name="topic" value="${topicInstance.id}"/>
                        <g:submitButton name="update" value="Update"/>
                    </g:form>
                </li>
                    <li class="fieldcontain">
                        <span id="date-label" class="property-label">Date Created</span>
                        <span id="date-value" class="property-label">${topicInstance.dateCreated}</span>
                        <span id="resource-label" class="property-label">Attach Resource</span>
                        <span id="resource-value" class="property-label"> <input type="file" name="myFile" /></span>
                    </li>

				</g:if>

			</ol>
			<g:form url="[resource:topicInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" controller="user"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>

			</g:form>
		</div>
	</body>
</html>