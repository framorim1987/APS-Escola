<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conecta.jsp" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Bem vindo</h1>
        <%
           String sql = "";
            PreparedStatement pstm= null;
           // ResultSet rs =null;
             
           
            try {
                         
               sql = "INSERT INTO tb_faleconosco (Assunto,Nome,Email,Telefone,Mensagem) VALUES (?,?,?,?,?)";
                
                pstm = con.prepareStatement(sql);
                
                pstm.setString(1, request.getParameter("subject"));
                pstm.setString(2, request.getParameter("nome"));
                pstm.setString(3, request.getParameter("email"));
                pstm.setString(4, request.getParameter("tell"));
                pstm.setString(5, request.getParameter("menssagem"));
                                 
                
                int retorno = pstm.executeUpdate();
              
                if (retorno > 0) {    
                    response.sendRedirect("fale-conosco.jsp?conf=gravado");
                } else {   
                    response.sendRedirect("fale-conosco.jsp?erro=erro");
                    
                }
              
            } catch (Exception ex) {
                response.sendRedirect("fale-conosco.jsp?erro=erro");
            }
            finally { 
                if(stm!=null)stm.close();
                if(con!=null)con.close();                
            }
        %>
    </body>
</html>
