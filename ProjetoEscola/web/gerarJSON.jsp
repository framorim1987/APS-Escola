<%@page import="java.sql.*"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%@include file="conecta.jsp"%>

{
"alunos":
    [ 
        <%
            ResultSet rs = null;
            String sql = ""; 
            PreparedStatement pstm= null;
            try{
                sql = "SELECT * FROM tb_aluno";
                pstm = con.prepareStatement(sql);
                rs = pstm.executeQuery();                
                while(rs.next()) {            
                    %>
                     {"id":<%= rs.getInt("id_Aluno")%>, "nome":"<%= rs.getString("Nome")%>", 
                       "sobrenome":"<%= rs.getString("Sobrenome")%>", "login":"<%= rs.getString("login")%>", 
                       "Senha":"<%= rs.getString("senha")%>", "id responsavel":<%= rs.getInt("id_Responsavel")%>} <% if(!rs.isLast()){ %>,<% }                                     
                } 
        } catch(Exception ex){
            out.print(ex.getMessage());
        }
        finally {
            if(rs!=null) rs.close();
            if(pstm!=null) pstm.close();
        }
        %>
    ]
}