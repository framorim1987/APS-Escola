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
    if(session.getAttribute("NomeAdm")!=null){ 

    if(request.getParameter("consultar_tipo").equals("1")){
    String sql, nome="", sobrenome="", turmaAl="";
    int ID= 0,IDresp= 0;
    ResultSet rs=null;
    PreparedStatement pstm= null;
    
    try {
        sql = "SELECT * FROM tb_aluno WHERE id_Aluno = ?";
        
        pstm = con.prepareStatement(sql);
        
        pstm.setString(1, request.getParameter("id_usuario"));
        
        rs= pstm.executeQuery();
        
        if(rs.next()) {
            nome=rs.getString("Nome");            
            sobrenome=rs.getString("Sobrenome");
            ID = rs.getInt("id_Aluno");
            IDresp = rs.getInt("id_Responsavel");
            turmaAl= rs.getString("Turma");

            
    String nomeEncoded = URLEncoder.encode(nome, StandardCharsets.UTF_8.toString());        
    String sbEncoded = URLEncoder.encode(sobrenome, StandardCharsets.UTF_8.toString());
    String dst = "painel-administrador-editar.jsp?nome=" + nomeEncoded + "&sobrenome=" + sbEncoded 
            + "&idUser=" + ID + "&idResp=" + IDresp + "&tipoUserAl=" + "Aluno" + "&turma=" + turmaAl;
    response.sendRedirect(dst);
        }
        else{
        response.sendRedirect("painel-administrador-editar.jsp?dados=erro");
        }

    } catch (SQLException ex) {
        response.sendRedirect("painel-administrador-editar.jsp?dados=erro");
    } 
    finally { 
        if (rs != null) rs.close();
        if (pstm != null) pstm.close();
        if (con != null) con.close();
    }
    

}

    else if(request.getParameter("consultar_tipo").equals("2")){
    
    String sql, nome="", sobrenome="";
    int ID= 0;
    ResultSet rs=null;
    PreparedStatement pstm= null;
    
    try {
        sql = "SELECT * FROM tb_professor WHERE id_Professor = ?";
        
        pstm = con.prepareStatement(sql);
        
        pstm.setString(1, request.getParameter("id_usuario"));
        
        rs= pstm.executeQuery();
        
        if(rs.next()) {
            nome=rs.getString("Nome");            
            sobrenome=rs.getString("Sobrenome");
            ID = rs.getInt("id_Professor");
            
            
    String nomeEncoded = URLEncoder.encode(nome, StandardCharsets.UTF_8.toString());        
    String sbEncoded = URLEncoder.encode(sobrenome, StandardCharsets.UTF_8.toString());
    String dst = "painel-administrador-editar.jsp?nome=" + nomeEncoded + "&sobrenome=" + sbEncoded 
            + "&idUser=" + ID + "&tipoUserProf=" + "Professor";
    response.sendRedirect(dst);
        }
        else{
        response.sendRedirect("painel-administrador-editar.jsp?dados=erro");
        }

    } catch (SQLException ex) {
        response.sendRedirect("painel-administrador-editar.jsp?dados=erro");
    } 
    finally {
        if (rs != null) rs.close();
        if (pstm != null) pstm.close();
        if (con != null) con.close();
    }
        }
    

       else if(request.getParameter("consultar_tipo").equals("3")){
    
    String sql, nome="", sobrenome="";
    int ID= 0;
    ResultSet rs=null;
    PreparedStatement pstm= null;
    
    try {
        sql = "SELECT * FROM tb_responsavel WHERE id_Responsavel = ?";
        
        pstm = con.prepareStatement(sql);
        
        pstm.setString(1, request.getParameter("id_usuario"));
        
        rs= pstm.executeQuery();
        
        if(rs.next()) {
            nome=rs.getString("Nome");            
            sobrenome=rs.getString("Sobrenome");
            ID = rs.getInt("id_Responsavel");
            
            
    String nomeEncoded = URLEncoder.encode(nome, StandardCharsets.UTF_8.toString());        
    String sbEncoded = URLEncoder.encode(sobrenome, StandardCharsets.UTF_8.toString());
    String Resp = URLEncoder.encode("Respons??vel", StandardCharsets.UTF_8.toString());
    
    String dst = "painel-administrador-editar.jsp?nome=" + nomeEncoded + "&sobrenome=" + sbEncoded 
            + "&idUser=" + ID + "&tipoUserResp=" + Resp;
    response.sendRedirect(dst);
        }
        else{
        response.sendRedirect("painel-administrador-editar.jsp?dados=erro");
        }

    } catch (SQLException ex) {
        response.sendRedirect("painel-administrador-editar.jsp?dados=erro");
    }  
    finally {
        if (rs != null) rs.close();
        if (pstm != null) pstm.close();
        if (con != null) con.close();
    }
        }

        else{
           response.sendRedirect("painel-administrador-editar.jsp");
       }
    }
    else {
          response.sendRedirect("minha-area.jsp");
  }
%>
    </body>
</html>
