<%@ page import="java.sql.*"%>
<%
Connection con=null;  
Statement stm=null;

try
{
    String serverName = "localhost:3306"; 
    String mydatabase = "inova";   
    String username = "root"; 
    String password = "12345";    
    String driverName = "com.mysql.jdbc.Driver";    
    Class.forName(driverName); 
    
    String url = "jdbc:mysql://" + serverName + "/" + mydatabase; 
    con = DriverManager.getConnection(url, username, password);
    
    stm = con.createStatement();    
}
catch(SQLException ex)
{
  out.print("<p> Erro abrindo a conexão com o BD: verificar login/senha, nome do BD etc. em conecta.jsp. <br/>" + ex.getMessage() + "</p>");
}
%>