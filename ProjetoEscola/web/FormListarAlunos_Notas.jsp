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
        <link rel="stylesheet" href="css/area-do-professor.css">
        <link rel="stylesheet" href="css/estiloMensagem.css" type="text/css" />
        <title>�rea do professor</title>
        <style>
            .campo{
                text-align: center;
            }
            .campoId{
                text-align: center;
                border:none;
            }
            .campoId:active{
                box-shadow: 0 0 0 0;
                outline: 0;
            }
            .table-notas-alunos th,td{
                height: 40px;
            }
        </style>
    </head>

    <body>
        <%            if (session.getAttribute("nomeP") != null) {
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
                <div><a href="area-do-professor-notas.jsp" class="btn-notas active">Lan�ar notas</a></div>
                <div><a href="area-do-professor-faltas.jsp" class="btn-faltas">Controle de frequ�ncia</a></div>
            </div>
            <div class="form-professor">
                <h2 class="area-do-professor-titulo">�rea do professor</h2>

                <!-- In�cio do formul�rio de notas -->

                <form action="GravarNotas.jsp" class="form-professor-nota">
                    <div class="row">

                        <div class="turma-faltas">
                            <label for="disciplinas">Selecione a disciplina:</label><br>
                            <select name="disciplinas" id="disciplinas" required="required">
                                <option value=""></option>
                                <option value="1">L�ngua Portuguesa</option>
                                <option value="2">Reda��o</option>
                                <option value="3">Matem�tica</option>
                                <option value="4">Hist�ria</option>
                                <option value="5">Geografia</option>
                                <option value="6">Ci�ncias</option>
                                <option value="7">Artes</option>
                                <option value="8">Educa��o F�sica</option>
                                <option value="9">Ing�s</option>
                                <option value="10">F�sica</option>
                            </select>
                        </div>
                    </div>



                    <table   border="1" cellspacing="0" cellpadding="2" class="table-notas-alunos">
                        <tr>
                            <th><strong>&nbsp; ID do Aluno &nbsp;</strong></th>
                            <th><strong>&nbsp; Nome &nbsp;</strong></th>
                            <th><strong>&nbsp; Sobrenome &nbsp;</strong></th>
                            <th><strong>&nbsp; Nota A1 &nbsp;</strong></th>
                            <th><strong>&nbsp; Nota A2 &nbsp;</strong></th>
                        </tr>
                        <%
                            if (request.getParameter("turma").equals("") || request.getParameter("turma").equals(null)) {
                                response.sendRedirect("area-do-professor-notas.jsp?dadosErro=ERRO ao listar as notas");
                            }

                            PreparedStatement pstm = null;
                            ResultSet rs = null;
                            String sql;

                            try {

                                pstm = con.prepareStatement("SELECT * FROM tb_aluno WHERE Turma= ? ORDER BY id_Aluno");

                                pstm.setString(1, request.getParameter("turma"));

                                rs = pstm.executeQuery();

                                while (rs.next()) {
                                    int idAl = rs.getInt("id_Aluno");
                                    String nome = rs.getString("Nome");
                                    String sbNome = rs.getString("Sobrenome");
                        %>
                        <tr>            
                            <td>&nbsp;<input class="campoId" type="text" name="aluno" value="<%=idAl%>" readonly="readonly"> &nbsp;</td>
                            <td>&nbsp; <%= nome%> &nbsp;</td>
                            <td><%= sbNome%></td>
                            <td> <input class="campo" type="number" step="0.1" min="0" max="5" name="valor-notaA1" value="" required="required"></td>
                            <td> <input class="campo" type="number" step="0.1" min="0" max="5" name="valor-notaA2" value="" required="required"></td>
                        </tr>
                        <%
                                }
                            } catch (Exception ex) {
                                response.sendRedirect("area-do-professor-notas.jsp?dadosErro=ERRO!");
                            } finally {
                                if (rs != null) {
                                    rs.close();
                                }
                                if (pstm != null) {
                                    pstm.close();
                                }
                                if (con != null) {
                                    con.close();
                                }
                            }
                        %> 
                    </table><br>


                    <div class="row-btn">
                        <input type="submit" value="Gravar" class="btn-form-area-do-professor-falta">
                    </div>
                </form><br>

                <!-- Fim do formul�rio de notas -->

            </div>
        </section>

        <footer>
            <p class="heavy">Escola Principal Inova</p>
            <div class="footer-div">
                <p>S�o Paulo, Brasil</p>
            </div>
            <div class="footer-div">
                <p class="light">Rua Dr. Ulisses Cirilo, 225</p>
                <p class="light">S�o Miguel Pta.</p>
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
        <%} else {
                response.sendRedirect("minha-area.jsp");
            }
        %>
    </body>

</html>