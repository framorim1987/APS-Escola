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
    <style>
        .sucesso{
         color: green;
         font-weight: bold;
      }
      .erro{
          color: red;
          font-weight: bold;
      }
    </style>
</head>

<body>
        <%  
            if(session.getAttribute("NomeAdm")!=null){
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
        </ul>
    </header>

    <section class="container-area-do-administrador">
        <div class="menu-lateral">
            <div><a href="#" class="btn-action btn-cadastrar active">Cadastrar</a></div>
            <div><a href="#" class="btn-action btn-consultar">Consultar</a></div>
            <div><a href="#" class="btn-action btn-editar">Editar</a></div>
            <div><a href="#" class="btn-action btn-deletar">Deletar</a></div>
        </div>
        <div class="form-administrador">
            <h2 class="area-do-administrador-titulo">Painel do administrador</h2>

            <!-- In�cio do formul�rio de cadastro -->
            <form action="Cadastro.jsp" class="form-administrador-cadastrar form-administrador-visible">
                <div class="row">
                    <div class="col1">
                        <label for="cadastrar_tipo">Selecione o tipo de usu�rio:</label><br>
                        <select name="cadastrar_tipo" id="cadastrar_tipo" onchange="changeSelect()">
                            <option value=""></option>
                            <option value="1">Aluno</option>
                            <option value="2">Professor</option>
                            <option value="3">Respons�vel</option>
                        </select>
                    </div>
                    <div class="col2">
                    </div>
                </div>

                <div class="row">
                    <div class="col1">
                        <label for="nome">Nome:</label><br>
                        <input type="text" name="nome" id="nome">
                    </div>

                    <div class="col2">
                        <label for="sobrenome">Sobrenome:</label><br>
                        <input type="text" name="sobrenome" id="sobrenome">
                    </div>
                </div>

                <div class="row row-responsavel none">
                    <div class="col1">
                        <label for="id_responsavel">ID do respons�vel:</label><br>
                        <input type="text" name="id_responsavel" id="id_responsavel">
                    </div>

                    <div class="col2">
                    </div>
                </div>

                <div class="row-btn">
                    <input type="submit" value="Gravar" class="btn-form-area-do-administrador-nota">
                </div>
                
                  <%
                    String respSuc= request.getParameter("dadosSuc");
                    String respErro= request.getParameter("dadosErro");
                    String respErro2= request.getParameter("dadosErro2");
                  if(respSuc!=null){%>                  
                  <br> <p class="sucesso"><%=respSuc%></p>                    
                  <%}%>
                  
                  <% if(respErro!=null){%>                  
                  <br> <p class="erro"><%=respErro%></p>                    
                  <%}%>
                  
                  <% if(respErro2!=null){%>                  
                  <br><p class="erro">ERRO! Verifique o ID do respons�vel</p>                    
                  <%}%>
            </form>
            <!-- Fim do formul�rio de cadastro -->

            <!-- In�cio do formul�rio de consulta -->
            <form action="Consultar.jsp" class="form-administrador-consultar form-administrador-visible none">
                <div class="row">
                    <div class="col1">
                        <label for="consultar_tipo">Selecione o tipo de usu�rio:</label><br>
                        <select name="consultar_tipo" id="consultar_tipo" onchange="changeSelectConsulta()">
                            <option value=""></option>
                            <option value="1">Aluno</option>
                            <option value="2">Professor</option>
                            <option value="3">Respons�vel</option>
                        </select>
                    </div>
                    <div class="col2">
                        <label for="id_usuario">ID do usu�rio:</label><br>
                        <input type="text" name="id_usuario" id="id_usuario">
                    </div>
                </div>


                <div class="row">
                    <div class="col1">
                        <label for="nome">Nome:</label><br>
                        <input type="text" name="nome" id="nome">
                    </div>

                    <div class="col2">
                        <label for="sobrenome">Sobrenome:</label><br>
                        <input type="text" name="sobrenome" id="sobrenome">
                    </div>
                </div>

                <div class="row row-responsavel-consulta none">
                    <div class="col1">
                        <label for="id_responsavel">ID do respons�vel:</label><br>
                        <input type="text" name="id_responsavel" id="id_responsavel">
                    </div>

                    <div class="col2">
                    </div>
                </div>

                <div class="row-btn">
                    <input type="submit" value="Consultar" class="btn-form-area-do-administrador-falta">
                </div>
            </form>
            <!-- Fim do formul�rio de consulta -->

            <!-- In�cio do formul�rio de edi��o -->

            <form action="Editar.jsp" class="form-consultar-editar form-auxiliar-visible none">
                <div class="row">
                    <div class="col1">
                        <label for="editar_tipo">Selecione o tipo de usu�rio:</label><br>
                        <select name="editar_tipo" id="editar_tipo" onchange="changeSelectEdita()">
                            <option value=""></option>
                            <option value="1">Aluno</option>
                            <option value="2">Professor</option>
                            <option value="3">Respons�vel</option>
                        </select>
                    </div>

                    <div class="col2">
                        <label for="id_usuario">ID do usu�rio:</label><br>
                        <input type="text" name="id_usuario" id="id_usuario">
                    </div>
                </div>

                <div class="row-btn">
                    <input type="submit" value="Consultar" class="btn-form-area-do-administrador-falta">
                </div>

            </form>
            
            <form action="#" class="form-administrador-editar form-administrador-visible none">
                <div class="row">
                    <div class="col1">
                        <label for="nome">Nome:</label><br>
                        <input type="text" name="nome" id="nome">
                    </div>

                    <div class="col2">
                        <label for="sobrenome">Sobrenome:</label><br>
                        <input type="text" name="sobrenome" id="sobrenome">
                    </div>
                </div>

                <div class="row row-responsavel-edita none">
                    <div class="col1">
                        <label for="id_responsavel">ID do respons�vel:</label><br>
                        <input type="text" name="id_responsavel" id="id_responsavel">
                    </div>

                    <div class="col2">
                    </div>
                </div>

                <div class="row-btn">
                    <input type="submit" value="Editar" class="btn-form-area-do-administrador-falta">
                </div>
            </form>
            <!-- Fim do formul�rio de edi��o -->

            <!-- In�cio do formul�rio deletar -->

            <form action="" class="form-consultar-deletar form-auxiliar-visible none">
                <div class="row">
                    <div class="col1">
                        <label for="deletar_tipo">Selecione o tipo de usu�rio:</label><br>
                        <select name="deletar_tipo" id="deletar_tipo" onchange="changeSelectDeleta()">
                            <option value=""></option>
                            <option value="aluno">Aluno</option>
                            <option value="professor">Professor</option>
                            <option value="responsavel">Respons�vel</option>
                        </select>
                    </div>
                    <div class="col2">
                        <label for="id_usuario">ID do usu�rio:</label><br>
                        <input type="text" name="id_usuario" id="id_usuario">
                    </div>
                </div>

                <div class="row-btn">
                    <input type="submit" value="Consultar" class="btn-form-area-do-administrador-falta">
                </div>
            </form>

            <form action="#" class="form-administrador-deletar form-administrador-visible none">
                <div class="row">
                    <div class="col1">
                        <label for="nome">Nome:</label><br>
                        <input type="text" name="nome" id="nome">
                    </div>

                    <div class="col2">
                        <label for="sobrenome">Sobrenome:</label><br>
                        <input type="text" name="sobrenome" id="sobrenome">
                    </div>
                </div>

                <div class="row row-responsavel-deleta none">
                    <div class="col1">
                        <label for="id_responsavel">ID do respons�vel:</label><br>
                        <input type="text" name="id_responsavel" id="id_responsavel">
                    </div>

                    <div class="col2">
                    </div>
                </div>

                <div class="row-btn">
                    <input type="submit" value="Deletar" class="btn-form-area-do-administrador-falta">
                </div>
            </form>
            <!-- Fim do formul�rio deletar -->
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

    <script>
        const btn = document.querySelectorAll('.btn-action');
        const select = document.querySelector('#cadastrar_tipo');
        const selectConsulta = document.querySelector('#consultar_tipo');
        const selectEdita = document.querySelector('#editar_tipo');
        const selectDeleta = document.querySelector('#deletar_tipo');
        const forms = document.querySelectorAll('.form-administrador-visible');
        const formsAuxiliar = document.querySelectorAll('.form-auxiliar-visible');

        const removeClass = (classe) => {
            forms.forEach(form => {
                form.classList.add('none');
            });

            document.querySelector(classe).classList.remove('none');
        }

        const removeClassAuxiliar = (classe) => {
            formsAuxiliar.forEach(form => {
                form.classList.add('none');
            });

            document.querySelector(classe).classList.remove('none');
        }

        const exibeForm = (btnText) => {
            switch (btnText) {
                case 'Cadastrar':
                    removeClass('.form-administrador-cadastrar');
                    removeClassAuxiliar('.null');
                    break;
                case 'Consultar':
                    removeClass('.form-administrador-consultar');
                    removeClassAuxiliar('.null');
                    break;
                case 'Editar':
                    removeClass('.form-administrador-editar');
                    removeClassAuxiliar('.form-consultar-editar');
                    break;
                case 'Deletar':
                    removeClass('.form-administrador-deletar');
                    removeClassAuxiliar('.form-consultar-deletar');
                    break;
            }
        }

        const changeSelect = () => {
            if (select.value == "1") {
                document.querySelector('.row-responsavel').classList.remove('none');
            } else {
                document.querySelector('.row-responsavel').classList.add('none');
            }
        }

        const changeSelectConsulta = () => {
            if (selectConsulta.value == "aluno") {
                document.querySelector('.row-responsavel-consulta').classList.remove('none');
            } else {
                document.querySelector('.row-responsavel-consulta').classList.add('none');
            }
        }

        const changeSelectEdita = () => {
            if (selectEdita.value == "aluno") {
                document.querySelector('.row-responsavel-edita').classList.remove('none');
            } else {
                document.querySelector('.row-responsavel-edita').classList.add('none');
            }
        }

        const changeSelectDeleta = () => {
            if (selectDeleta.value == "aluno") {
                document.querySelector('.row-responsavel-deleta').classList.remove('none');
            } else {
                document.querySelector('.row-responsavel-deleta').classList.add('none');
            }
        }

        btn.forEach(button => {
            button.addEventListener('click', (event) => {
                btn.forEach(bt => {
                    bt.classList.remove('active');
                });

                event.target.classList.add('active');

                exibeForm(event.target.text);
            })
        });


    </script>
    <%}
   else{
     response.sendRedirect("minha-area.jsp");
   }
    %>
</body>

</html>