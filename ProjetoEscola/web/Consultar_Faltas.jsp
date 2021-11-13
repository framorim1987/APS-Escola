<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.net.URLEncoder"%>
<%@ include file="conecta.jsp" %>
<%    
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%  
    if(session.getAttribute("nomeAl")!=null){
    
    String sql, nome="", sobrenome="",turma= "";
    int IDresp= 0;
    ResultSet rs=null;
    PreparedStatement pstm= null;
    
    try {
        int idUserAl = (int) session.getAttribute("idAluno");
        
        sql = "SELECT COUNT(id_Falta) quant_falta FROM tb_falta WHERE id_Disciplina= ? AND id_Aluno= ?";
        
        pstm = con.prepareStatement(sql);
        
        pstm.setString(1, request.getParameter("disciplina"));
        pstm.setInt(2, idUserAl);
        
        rs= pstm.executeQuery();
        
        if(rs.next()) {
            String resultado = rs.getString("quant_falta");
          

            
    String nomeEncoded = URLEncoder.encode(nome, StandardCharsets.UTF_8.toString());        
    String sbEncoded = URLEncoder.encode(sobrenome, StandardCharsets.UTF_8.toString());
    String turmaAl = URLEncoder.encode(turma, StandardCharsets.UTF_8.toString());
    String dst = "area-do-aluno-faltas.jsp?faltas=" + resultado;
    
    
    response.sendRedirect(dst);
        }
        else{
            out.print("Erro ao encontrar os dados");
        }

    } catch (SQLException ex) {
        out.print("Erro" + ex.getMessage());
    } 
    finally { 
        if (rs != null) rs.close();
        if (pstm != null) pstm.close();
        if (con != null) con.close();
    }
    
    }
    else{
       response.sendRedirect("minha-area.jsp");
    }
%>
    </body>
</html>
