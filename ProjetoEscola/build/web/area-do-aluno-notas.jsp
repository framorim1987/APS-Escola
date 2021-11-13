<!DOCTYPE html>
<%@ include file="conecta.jsp" %>
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
    <link rel="stylesheet" href="css/area-do-aluno.css">
    <link rel="stylesheet" href="css/estiloMensagem.css">
    <title>Área do aluno</title>
</head>

<body>
        <%  
            if(session.getAttribute("nomeAl")!=null){
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

    <section class="container-area-do-aluno">
        <div class="menu-lateral">
            <div><a href="area-do-aluno-notas.jsp" class="btn-notas active">Consultar notas</a></div>
            <div><a href="area-do-aluno-faltas.jsp" class="btn-faltas">Consultar faltas</a></div>
        </div>
        <div class="form-aluno">
            <h2 class="area-do-aluno-titulo">Área do aluno</h2>

            <!-- Início da tabela de notas -->

            <%  
            
               
                PreparedStatement pstm= null;
                ResultSet rs = null;
                String sql;
                try {%>
                
            <table  class="table-notas" border="1" cellspacing="0" cellpadding="2" class="table-faltas">
                
            <tr>
                <th class="justifesquerda"><strong>&nbsp; Disciplina &nbsp;</strong></th>
                <th class="justifesquerda"><strong>&nbsp; Nota A1 &nbsp;</strong></th>
                <th class="justifesquerda"><strong>&nbsp; Nota A2 &nbsp;</strong></th>
                <th class="justifesquerda"><strong>&nbsp; Nota Final &nbsp;</strong></th>
            </tr>
            <%
                   
                   int id_aluno= (int)session.getAttribute("idAluno");
                   
                    pstm = con.prepareStatement("SELECT DISTINCT tb_nota.id_Disciplina, tb_disciplina.Nome_Disciplina, tb_nota.notaA1,tb_nota.notaA2 FROM tb_nota" +
                                          " INNER JOIN tb_disciplina ON tb_nota.id_Disciplina=tb_disciplina.id_Disciplina WHERE tb_nota.id_Aluno= ?");

                    pstm.setInt(1, id_aluno);
                    
                    rs = pstm.executeQuery();                    

                   
                    while (rs.next()) {
                        float nota1 = rs.getFloat("tb_nota.notaA1");
                        float nota2 = rs.getFloat("tb_nota.notaA2");
                        String Disc = rs.getString("Nome_Disciplina");
            %>
            <tr>            
                
               
                <td><%= Disc%></td>
                <td><%= nota1%></td>
                <td><%= nota2%></td>
                <td><%= (nota1 + nota2) %></td>
            </tr>
            <%
                }
                } catch (Exception ex) {
                        out.print("<p class='erro'>Erro ao listar as notas</p>" + ex.getMessage());
                }
                finally {
                    if (rs != null)  rs.close();
                    if (pstm != null) pstm.close();
                    if (con != null) con.close();
                }
            %> 
                </table><br>
            <!-- Fim da tabela de notas -->

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