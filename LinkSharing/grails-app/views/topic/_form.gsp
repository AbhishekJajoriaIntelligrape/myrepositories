<%@ page import="linksharing.Topic" %>



<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="topic.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${topicInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="topic.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${topicInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="topic.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${linksharing.User.list()}" optionKey="id" required="" value="${topicInstance?.user?.id}" class="many-to-one"/>

</div>

