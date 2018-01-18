<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/plugins/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/plugins/utf8-jsp/ueditor.all.js"></script>

<r:editor id="${param.id}" name="${param.name}" title="${param.title}" value="${param.content}"/>
