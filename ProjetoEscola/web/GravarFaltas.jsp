
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.net.URLEncoder"%>
<%@ include file="conecta.jsp" %>
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
    <a href="FormListarAlunos.jsp"></a>
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/area-do-professor.css">
    <link rel="stylesheet" href="css/estiloMensagem.css" type="text/css" />
    <title>Área do professor</title>
</head>

<body>
        <%  
            if(session.getAttribute("nomeP")!=null){
        %>
    <header>
        <div class="logo">
            <h1><a href="index.html"><span class="escola">Escola</span><span class="inova">Inova</span></a></h1>
        </div>
        <ul class="menu">
            <li><a href="index.html">Home</a></li>
            <li><a href="sobre.jsp">Sobre</a></li>
            <li><a href="fale-conosco.jsp">Fale Conosco</a></li>
            <li><a href="sair.jsp" class="area">Sair</a></li>
            <li><a href="GerarJson&Xml.html">Gerar JSON e XML</a></li>
        </ul>
    </header>

    <section class="container-area-do-professor">
        <div class="menu-lateral">
            <div><a href="area-do-professor-notas.jsp" class="btn-notas">Lançar notas</a></div>
            <div><a href="area-do-professor-faltas.jsp" class="btn-faltas active">Controle de frequência</a></div>
        </div>
        <div class="form-professor">
            <h2 class="area-do-professor-titulo">Área do professor</h2>

            
            <%            
                String faltas[] = request.getParameterValues("faltas_alunos");
                if (faltas != null) {

                    int idUserP = (int) session.getAttribute("idProf");

                    int retorno = 0;
                    
                    String sql = "";
                    try {

                        for (int i = 0; i < faltas.length; i++) {

                            sql = "INSERT INTO tb_falta (data,id_Professor,id_Disciplina,id_Aluno) VALUES (current_date(),?,?,?)";
                            

                            PreparedStatement pstm = con.prepareStatement(sql);

                           
                            pstm.setInt(1, idUserP);
                            pstm.setString(2, request.getParameter("disciplinas"));
                            pstm.setString(3, (faltas[i]));

                            retorno = pstm.executeUpdate();

                        }
                        if (retorno > 0) {%>
                        <p class='sucesso'>FALTAS GRAVADAS COM SUCESSO</p><br> 
                        <a href="area-do-professor-faltas.jsp">Clique aqui </a>para voltar ao início
                      <%} 
                    } catch (SQLException ex) {%>
                             <p class='erro'>ERRO na conexão com o Banco de Dados</p><br>
                   <% } finally {
                        if (con != null) {
                            con.close();
                        }
                    }
                } else {%>
                        <p class='sucesso'>NÃO TEVE FALTAS</p><br> 
                        <a href="area-do-professor-faltas.jsp">Clique aqui </a>para voltar ao início 
               <%}

            %>

           

        </div>
    </section>

    <footer>
        <p class="heavy">Escola Principal Inova</p>
        <div class="footer-div">
            <p>São Paulo, Brasil</p>
        </div>
        <div class="footer-div">
            <p class="light">Rua Dr. Ulisses Cirilo, 225</p>
            <p class="light">São Miguel Pta.</p>
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
      <%}
      else{
        response.sendRedirect("minha-area.jsp");
       }      
      %>
</body>

</html>