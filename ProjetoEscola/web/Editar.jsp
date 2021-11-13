
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="conecta.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%  
    if(session.getAttribute("NomeAdm")!=null){         
    
    if(request.getParameter("tipo_usuario").equals("Aluno")){
        
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            
            String sql = "";
            
            int ID = Integer.parseInt(request.getParameter("id_usuario"));
            String nome = request.getParameter("nome");
            String sbNome = request.getParameter("sobrenome");
            String idResp = request.getParameter("id_responsavel"); 
            String turma = request.getParameter("turma");
            
            PreparedStatement pstm= null;
                     
            try {                 
                                    
                sql = "UPDATE tb_aluno SET id_Aluno= ?, Nome= ?, Sobrenome= ?, id_Responsavel= ?, Turma= ?  WHERE id_Aluno= ?";

               pstm = con.prepareStatement(sql);
                    
                
                pstm.setInt(1, ID);
                pstm.setString(2, nome);
                pstm.setString(3, sbNome);
                pstm.setString(4, idResp);
                pstm.setString(5, turma);
                pstm.setInt(6, ID);
                
               
                int retorno = pstm.executeUpdate();
                if (retorno > 0) {
                    response.sendRedirect("painel-administrador-editar.jsp?suc=suc");
                    
                } else {
                    response.sendRedirect("painel-administrador-editar.jsp?erro=erro");
                }
            } catch (Exception ex) {
                    response.sendRedirect("painel-administrador-editar.jsp?erro=erro");
            }
            finally { 
                if(pstm!=null)pstm.close();
                if(con!=null)con.close();                
            }
    

}

    else if(request.getParameter("tipo_usuario").equals("Professor")){
    
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            
            String sql = "";
            
            String ID = request.getParameter("id_usuario");
            String nome = request.getParameter("nome");
            String sbNome = request.getParameter("sobrenome"); 
            
            PreparedStatement pstm= null;
                     
            try {                 
                                    
                sql = "UPDATE tb_professor SET id_Professor= ?, Nome= ?, Sobrenome= ? WHERE id_Professor= ?";

               pstm = con.prepareStatement(sql);
                    
                pstm.setString(1, ID);
                pstm.setString(2, nome);
                pstm.setString(3, sbNome);
                pstm.setString(4, ID);
                
                int retorno = pstm.executeUpdate();
                if (retorno > 0) {
                    response.sendRedirect("painel-administrador-editar.jsp?suc=suc");
                    
                } else {
                    response.sendRedirect("painel-administrador-editar.jsp?erro=erro");
                }
            } catch (Exception ex) {
                    response.sendRedirect("painel-administrador-editar.jsp?erro=erro");
            }
            finally { 
                if(pstm!=null)pstm.close();
                if(con!=null)con.close();                
            }
 
        }
    

       else if(request.getParameter("tipo_usuario").equals("Responsável")){

            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            
            String sql = "";
            
            String ID = request.getParameter("id_usuario");
            String nome = request.getParameter("nome");
            String sbNome = request.getParameter("sobrenome"); 
            
            PreparedStatement pstm= null;
                     
            try {                 
                                    
                sql = "UPDATE tb_responsavel SET id_Responsavel= ?, Nome= ?, Sobrenome= ? WHERE id_Responsavel= ?";

               pstm = con.prepareStatement(sql);
                    
                pstm.setString(1, ID);
                pstm.setString(2, nome);
                pstm.setString(3, sbNome);
                pstm.setString(4, ID);
                
                int retorno = pstm.executeUpdate();
                if (retorno > 0) {
                    response.sendRedirect("painel-administrador-editar.jsp?suc=suc");
                    
                } else {
                    response.sendRedirect("painel-administrador-editar.jsp?erro=erro");
                }
            } catch (Exception ex) {
                    response.sendRedirect("painel-administrador-editar.jsp?erro=erro");
            }
            finally { 
                if(pstm!=null)pstm.close();
                if(con!=null)con.close();                
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
