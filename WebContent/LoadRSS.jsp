<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.w3c.dom.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.transform.Transformer" %>
<%@ page import="javax.xml.transform.TransformerFactory" %>
<%@ page import="javax.xml.transform.dom.DOMSource" %>
<%@ page import="javax.xml.transform.stream.StreamResult" %>
<%@ page import="java.io.PrintWriter" %>
<%
DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
DocumentBuilder db =dbf.newDocumentBuilder();
 Document doc=db.parse("http://udn.com/udnrss/basketball.xml");

StringBuffer buf=new StringBuffer();
buf.append(doc.toString());
response.setContentType("text/xml");
response.setHeader("Content-type", "text/xml");
response.setHeader("Cache-Control", "no-cache");

PrintWriter os = response.getWriter();   

TransformerFactory tf = TransformerFactory.newInstance();
Transformer ts = tf.newTransformer();

ts.transform(new DOMSource(doc), new StreamResult(os));
os.close();  

%>