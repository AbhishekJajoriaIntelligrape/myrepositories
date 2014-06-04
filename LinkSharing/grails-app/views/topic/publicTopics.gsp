
<%@ page import="linksharing.Topic" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-topic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>
<div id="list-topic" class="content scaffold-list" role="main">
    <h1>Public Topic List</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="title" title="${message(code: 'topic.title.label', default: 'Title')}" />
            <g:sortableColumn property="description" title="${message(code: 'topic.description.label', default: 'Description')}" />
            <th><g:message code="topic.user.label" default="User" /></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${topicInstanceList}" status="i" var="topicInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${topicInstance.id}">${fieldValue(bean: topicInstance, field: "title")}</g:link></td>

                <td>${fieldValue(bean: topicInstance, field: "description")}</td>

                <td>${fieldValue(bean: topicInstance, field: "user")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${topicInstanceCount ?: 0}" />
    </div>
</div>
</body>
</html>
