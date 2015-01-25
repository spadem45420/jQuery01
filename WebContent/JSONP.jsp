<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	 String callback = request.getParameter("callback");
     out.print(callback+"([ { name:'John',age:'19'},{ name:'joe',age:'20'}] );");
     //out.print(callback);
%>
