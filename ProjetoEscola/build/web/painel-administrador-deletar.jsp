<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Koh+Santepheap:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Ephesis&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/painel-administrador.css">
    <title>Painel do administrador</title>
    <link rel="stylesheet" href="css/estiloMensagem.css" type="text/css" />
</head>

<body>
    
         <%
            if(session.getAttribute("NomeAdm")!=null){
                
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            
            String nomeP = request.getParameter("nome");
            String sbNomeP = request.getParameter("sobrenome");
            String id_User= request.getParameter("idUser");
            String IDresp = request.getParameter("idResp");
            
            String tipoUserAl = request.getParameter("tipoUserAl");
            String Turma = request.getParameter("turma");
            
            if (nomeP == null) nomeP = "";
            if (sbNomeP == null) sbNomeP = "";
            if (id_User == null) id_User = "";
            if (IDresp == null) IDresp = "";
            if (Turma == null) Turma = "";
            
        %>
        
    <header>
        <div class="logo">
            <h1><a href="index.html"><span class="escola">Escola</span><span class="inova">Inova</span></a></h1>
        </div>
        <ul class="menu">
            <li><a href="index.html">Home</a></li>
            <li><a href="sobre.html">Sobre</a></li>
            <li><a href="fale-conosco.html">Fale Conosco</a></li>
            <li><a href="sair.jsp" class="area">Sair</a></li>
            <li><a href="GerarJson&Xml.html">Gerar JSON e XML</a></li>
        </ul>
    </header>

    <section class="container-area-do-administrador">
        <div class="menu-lateral">
            <div><a href="painel-administrador-cadastrar.jsp" class="btn-action btn-cadastrar">Cadastrar</a></div>
            <div><a href="painel-administrador-consultar.jsp" class="btn-action btn-consultar">Consultar</a></div>
            <div><a href="painel-administrador-editar.jsp" class="btn-action btn-editar">Editar</a></div>
            <div><a href="painel-administrador-deletar.jsp" class="btn-action btn-deletar active">Deletar</a></div>
        </div>
        <div class="form-administrador">
            <h2 class="area-do-administrador-titulo">Painel do administrador</h2>

            <!-- In??cio do formul??rio deletar -->
            <form action="Consultar_(Deletar).jsp" method="post" class="form-consultar-deletar form-auxiliar-visible">
                <div class="row">
                    <div class="col1">
                        <label for="deletar_tipo">Selecione o tipo de usu??rio:</label><br>
                        <select name="consultar_tipo" id="deletar_tipo" onchange="changeSelectDeleta()">
                            <option value=""></option>
                            <option value="1">Aluno</option>
                            <option value="2">Professor</option>
                            <option value="3">Respons??vel</option>
                        </select>
                    </div>
                    <div class="col2">
                        <label for="id_usuario">ID do usu??rio:</label><br>
                        <input type="text" name="id_usuario" id="id_usuario">
                    </div>
                </div>
                
                <div class="row-btn">
                    <input type="submit" value="Consultar" class="btn-form-area-do-administrador-falta">
                </div>
            </form>
            
                  <%                  
                    String Dados= request.getParameter("dados");
                    
                  if(Dados!=null){%>                
                  <span class="erro">DADOS N??O ENCONTRADOS</span>                  
                 <%}%>

            <form action="DeletarUsuario.jsp" method="post" class="form-administrador-deletar form-administrador-visible">
               
               <%if (request.getParameter("idUser") != null) {%> 
               
                <p class="info">
                    *Os campos: Tipo de usu??rio e ID do usu??rio est??o apenas no modo de exibi????o, 
                    para confirmar os dados.
                    
                
                </p><br>
                
                <div class="row">

                    <%if (request.getParameter("tipoUserAl") != null) {%>

                    <div class="col1">
                        
                        <label for="nome">Tipo de usu??rio:</label><br>
                        <input type="text" name="tipo_usuario" value="Aluno" id="nome" readonly="readonly">

                    </div>

                    <%} else if (request.getParameter("tipoUserProf") != null) {%>

                    <div class="col1">
                        
                        <label for="nome">Tipo de usu??rio:</label><br>
                        <input type="text" name="tipo_usuario" value="Professor" id="nome" readonly="readonly">
                       
                    </div>
                    <%} else if (request.getParameter("tipoUserResp") != null) {%>

                    <div class="col1">
                        <label for="nome">Tipo de usu??rio:</label><br>
                        <input type="text" name="tipo_usuario" value="Respons??vel" for="nome" readonly="readonly">
                    </div>
                    <%}%>

                    <%if (request.getParameter("idUser") != null) {%>
                    <div class="col2">
                        <label for="id_usuario">ID do usu??rio:</label><br>
                        <input type="text" name="ID_Usuario" id="id_usuario" value="<%=id_User%>" readonly="readonly">
                    </div>

                </div>
                <div class="row">
                    <div class="col1">
                        <label for="nome">Nome:</label><br>
                        <input type="text" name="nome" id="nome" value="<%=nomeP%>" readonly="readonly">
                    </div>

                    <div class="col2">
                        <label for="sobrenome">Sobrenome:</label><br>
                        <input type="text" name="sobrenome" id="sobrenome" value="<%=sbNomeP%>" readonly="readonly">
                    </div>
                </div>
                
                 
                    
               <%
                if(request.getParameter("idResp") != null){%>

                    
              <div class="row row-responsavel-consulta">

                    <div class="col1">
                        <label for="id_turma">Turma:</label><br>
                        <input type="text" name="turma" id="id_turma" value="<%=Turma%>" readonly="readonly">
                    </div>
                    
                     <div class="col2">
                        <label for="id_responsavel">ID do respons??vel:</label><br>
                        <input type="text" name="id_resp" id="id_resp" value="<%=IDresp%>" readonly="readonly">
                    </div>

                </div>
               <%}%>
               
                <div class="row-btn">
                    <input type="submit" name="bt_delete" value="Deletar" class="btn-form-area-do-administrador-falta">
              <%--      <button name="dele" value="Calcular">Deletar</button> --%>
                </div>
               <%}
               }
               %>




                  <%                  
                    String Suc= request.getParameter("suc");
                    String Erro= request.getParameter("erro");
                    
                  if(Suc!=null){%>                
                  <p class="sucesso">DADOS DELETADOS COM SUCESSO</p>                    
                 <%}
                  else if(Erro!=null){%>                
                  <p class="erro">ERRO AO DELETAR OS DADOS</p>                    
                 <%}%>
            </form>
            <!-- Fim do formul??rio deletar -->
        </div>
    </section>

    <footer>
        <p class="heavy">Escola Principal Inova</p>
        <div class="footer-div">
            <p>S??o Paulo, Brasil</p>
        </div>
        <div class="footer-div">
            <p class="light">Rua Dr. Ulisses Cirilo, 225</p>
            <p class="light">S??o Miguel Pta.</p>
        </div>
        <p class="light">(11)3333-3333</p>
        <p class="light">contato@escolaprincipalinova.com.br</p>
        <div class="footer-container">
            <div class="footer-icons">
                <div><img src="./images/icon-lin.png" alt=""></div>
                <div><img src="./images/icon-lin.png" alt=""></div>
                <div><img src="./images/icon-lin.png" alt=""></div>
            </div>
            <div>
                <p class="footer-text-right">Um novo conceito em escola</p>
            </div>
        </div>
        <span>2012 All rights reserved</span>
        <br>
        <span>privacy policy</span>
        <span>Web site terms of use</span>
        <span>LGPD</span>
        <span>cookie usage</span>
    </footer>

    <script>
        const selectDeleta = document.querySelector('#deletar_tipo');
        const changeSelectDeleta = () => {
            if (selectDeleta.value == "1") {
                document.querySelector('.row-responsavel-deleta').classList.remove('none');
            } else {
                document.querySelector('.row-responsavel-deleta').classList.add('none');
            }
        }
    </script>
    <%} else {
            response.sendRedirect("minha-area.jsp");
        }%>
</body>

</html>