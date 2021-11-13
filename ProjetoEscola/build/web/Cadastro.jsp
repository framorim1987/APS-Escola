<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conecta.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Aluno inserido no BD</title>
        <link rel="stylesheet" href="estilos.css" type="text/css" />
    </head>
    <body>
       <h2>Usuário inserido no BD </h2>
           
        <%  
                       
            
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            String sql = "";
            PreparedStatement pstm= null;
            ResultSet rs =null;
             
            //Cadastro Aluno
            if(request.getParameter("cadastrar_tipo").equals("1")){
            try {
               
                 sql= "SELECT * FROM tb_aluno WHERE login= ?";
                 pstm = con.prepareStatement(sql);
                 pstm.setString(1, request.getParameter("email"));
                 rs = pstm.executeQuery();
                 
                 if(rs.next()){
                     response.sendRedirect("painel-administrador-cadastrar.jsp?UserExis=User");
                 }
                 
                else{
                    
                
                sql = "INSERT INTO tb_aluno (id_Aluno,Nome,Sobrenome,id_Responsavel,Turma,login,senha) VALUES (?,?,?,?,?,?,?)";
                
                pstm = con.prepareStatement(sql);
                
                pstm.setString(1, request.getParameter("id_aluno"));
                pstm.setString(2, request.getParameter("nome"));
                pstm.setString(3, request.getParameter("sobrenome"));
                pstm.setString(4, request.getParameter("id_responsavel"));
                pstm.setString(5, request.getParameter("turma"));
                pstm.setString(6, request.getParameter("email"));
                pstm.setString(7, request.getParameter("senha"));
                                 
                
                int retorno = pstm.executeUpdate();
              
                if (retorno > 0) {                    
                    response.sendRedirect("painel-administrador-cadastrar.jsp?dadosSuc=DADOS GRAVADOS COM SUCESSO");
                } else {                    
                    response.sendRedirect("painel-administrador-cadastrar.jsp?dadosErro=ERRO! Verifique os dados digitados");
                }
              }
            } catch (Exception ex) {
                response.sendRedirect("painel-administrador-cadastrar.jsp?dadosErro2=ERRO");
            }
            finally { 
                if(stm!=null)stm.close();
                if(con!=null)con.close();                
            }
            
}        
            //Cadastro Professor
            else if(request.getParameter("cadastrar_tipo").equals("2")){
                        try {
                String nome = request.getParameter("nome");
                
                    if (nome != null) {
                        
                 sql= "SELECT * FROM tb_professor WHERE login= ?";
                 pstm = con.prepareStatement(sql);
                 pstm.setString(1, request.getParameter("email"));
                 rs = pstm.executeQuery();
                 
                 if(rs.next()){
                     response.sendRedirect("painel-administrador-cadastrar.jsp?UserExis=User");
                 }
                 
                else{

                        sql = "INSERT INTO tb_professor (Nome,Sobrenome,login,senha) VALUES (?,?,?,?)";
                       
                        pstm = con.prepareStatement(sql);

                        pstm.setString(1, request.getParameter("nome"));
                        pstm.setString(2, request.getParameter("sobrenome"));
                        pstm.setString(3, request.getParameter("email"));
                        pstm.setString(4, request.getParameter("senha"));

                        int retorno = pstm.executeUpdate();

                        if (retorno > 0) {
                            response.sendRedirect("painel-administrador-cadastrar.jsp?dadosSuc=DADOS GRAVADOS COM SUCESSO");
                        } else {
                            response.sendRedirect("painel-administrador-cadastrar.jsp?dadosErro=ERRO! Verifique os dados digitados");
                        }
               }
             }   
            } catch (Exception ex) {
                
                response.sendRedirect("painel-administrador-cadastrar.jsp?dadosErro2=ERRO! Falha na conexão");
            }
            finally { 
                if(stm!=null)stm.close();
                if(con!=null)con.close();                
            }
            }
            
            else if(request.getParameter("cadastrar_tipo").equals("3")){
            try {
                
                   
                        

                        sql = "INSERT INTO tb_responsavel (Nome,Sobrenome) VALUES (?,?)";
                       
                        pstm = con.prepareStatement(sql);

                        pstm.setString(1, request.getParameter("nome"));
                        pstm.setString(2, request.getParameter("sobrenome"));

                        int retorno = pstm.executeUpdate();

                        if (retorno > 0) {
                            response.sendRedirect("painel-administrador-cadastrar.jsp?dadosSuc=DADOS GRAVADOS COM SUCESSO");
                        } else {
                            response.sendRedirect("painel-administrador-cadastrar.jsp?dadosErro=ERRO! Verifique os dados digitados");
                        }                    
            
                
            } catch (Exception ex) {
                
                response.sendRedirect("painel-administrador-cadastrar.jsp?dadosErro2=ERRO! Falha na conexão");
            }
            finally {
                if(stm!=null)stm.close();
                if(con!=null)con.close();                
            }
           }
            else{
             response.sendRedirect("painel-administrador-cadastrar.jsp");
            }

        %>
        
    
    </body>
    <br/><br/>
    <a href="index.html">Voltar</a> para a página inicial.    
</html>