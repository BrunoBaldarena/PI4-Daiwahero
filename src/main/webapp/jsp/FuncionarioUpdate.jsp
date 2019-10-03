<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Daiwahero Cadastro de Funcionário</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">


        <link href="<c:url value="assets/css/bootstrap.min.css"/>" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->

        <link href="<c:url value="./jsp/css/sb-admin-2.min.css"/>" rel="stylesheet">

        <script>
            function mascaraData(val) {
                var pass = val.value;
                var expr = /[0123456789]/;

                for (i = 0; i < pass.length; i++) {
                    // charAt -> retorna o caractere posicionado no índice especificado
                    var lchar = val.value.charAt(i);
                    var nchar = val.value.charAt(i + 1);

                    if (i == 0) {
                        // search -> retorna um valor inteiro, indicando a posição do inicio da primeira
                        // ocorrência de expReg dentro de instStr. Se nenhuma ocorrencia for encontrada o método retornara -1
                        // instStr.search(expReg);
                        if ((lchar.search(expr) != 0) || (lchar > 3)) {
                            val.value = "";
                        }

                    } else if (i == 1) {

                        if (lchar.search(expr) != 0) {
                            // substring(indice1,indice2)
                            // indice1, indice2 -> será usado para delimitar a string
                            var tst1 = val.value.substring(0, (i));
                            val.value = tst1;
                            continue;
                        }

                        if ((nchar != '/') && (nchar != '')) {
                            var tst1 = val.value.substring(0, (i) + 1);

                            if (nchar.search(expr) != 0)
                                var tst2 = val.value.substring(i + 2, pass.length);
                            else
                                var tst2 = val.value.substring(i + 1, pass.length);

                            val.value = tst1 + '/' + tst2;
                        }

                    } else if (i == 4) {

                        if (lchar.search(expr) != 0) {
                            var tst1 = val.value.substring(0, (i));
                            val.value = tst1;
                            continue;
                        }

                        if ((nchar != '/') && (nchar != '')) {
                            var tst1 = val.value.substring(0, (i) + 1);

                            if (nchar.search(expr) != 0)
                                var tst2 = val.value.substring(i + 2, pass.length);
                            else
                                var tst2 = val.value.substring(i + 1, pass.length);

                            val.value = tst1 + '/' + tst2;
                        }
                    }

                    if (i >= 6) {
                        if (lchar.search(expr) != 0) {
                            var tst1 = val.value.substring(0, (i));
                            val.value = tst1;
                        }
                    }
                }

                if (pass.length > 10)
                    val.value = val.value.substring(0, 10);
                return true;
            }

            function limpa_formulário_cep() {
                //Limpa valores do formulário de cep.
                document.getElementById('endereco').value = ("");
                document.getElementById('bairro').value = ("");
                document.getElementById('cidade').value = ("");
                document.getElementById('uf').value = ("");
            }

            function meu_callback(conteudo) {
                if (!("erro" in conteudo)) {
                    //Atualiza os campos com os valores.
                    document.getElementById('endereco').value = (conteudo.logradouro);
                    document.getElementById('bairro').value = (conteudo.bairro);
                    document.getElementById('cidade').value = (conteudo.localidade);
                    document.getElementById('uf').value = (conteudo.uf);
                } //end if.
                else {
                    //CEP não Encontrado.
                    limpa_formulário_cep();
                    alert("CEP não encontrado.");
                }
            }

            function pesquisacep(valor) {

                //Nova variável "cep" somente com dígitos.
                var cep = valor.replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if (validacep.test(cep)) {

                        document.getElementById('cep').value = cep.substring(0, 5)
                                + "-"
                                + cep.substring(5);

                        //Preenche os campos com "..." enquanto consulta webservice.
                        document.getElementById('endereco').value = "...";
                        document.getElementById('bairro').value = "...";
                        document.getElementById('cidade').value = "...";
                        document.getElementById('uf').value = "...";

                        //Cria um elemento javascript.
                        var script = document.createElement('script');

                        //Sincroniza com o callback.
                        script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';

                        //Insere script no documento e carrega o conteúdo.
                        document.body.appendChild(script);

                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            }
            ;
        </script>       
        <script type="text/javascript">
            function fMasc(objeto, mascara) {
                obj = objeto
                masc = mascara
                setTimeout("fMascEx()", 1)
            }
            function fMascEx() {
                obj.value = masc(obj.value)
            }

            function mCPF(cpf) {
                cpf = cpf.replace(/\D/g, "")
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2")
                return cpf
            }
            function mNum(num) {
                num = num.replace(/\D/g, "")
                return num
            }
        </script>

        <style>
            body {
                background: #eee;
            }
            .toggle > label {
                position: relative;
                display: block;
                height: 20px;
                width: 44px;
                background: #898989;
                border-radius: 100px;
                cursor: pointer;
                transition: all 0.3s ease;
            }
            .toggle > label:after {
                position: absolute;
                left: -2px;
                top: -3px;
                display: block;
                width: 26px;
                height: 26px;
                border-radius: 100px;
                background: #fff;
                box-shadow: 0px 3px 3px rgba(0,0,0,0.05);
                content: '';
                transition: all 0.3s ease;
            }
            .toggle > label:active:after {
                transform: scale(1.15, 0.85);
            }
            .toggle > input:checked ~ label {
                background: #6fbeb5;
            }
            .toggle > input:checked ~ label:after {
                left: 20px;
                background: #179588;
            }
            .toggle > input:disabled ~ label {
                background: #d5d5d5;
                pointer-events: none;
            }
            .toggle > input:disabled ~ label:after {
                background: #bcbdbc;
            }

            .toggle {
                margin-bottom: 40px;
            }
            .toggle > input {
                display: none;
            }

            h11 {
                color:red;
            }

            #logo {
                width:50%;
                height:50%;
            }

            .panel-heading{
                font-size:150%;
            }

        </style>



    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html"><img width= "190px" height= "190px" src="img\logo001.png" alt=""  style="right:10%; padding-right: 2%"/></a>
                <div class="sidebar-brand-icon rotate-n-15">

                </div>

                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="index.html">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Usuários</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Acesso</h6>
                            <a class="collapse-item" href="login_register.html">ADM</a>
                            <a class="collapse-item" href="login_register.html">Funcionários</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="Estoque.html" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities" >
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>Estoque</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Acesso</h6>
                            <a class="collapse-item" href="utilities-color.html">Consultar Estoque</a>

                        </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Cadastros/Consultas 
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePrimary"  aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Cliente</span>
                    </a>
                    <div id="collapsePrimary" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Acesso</h6>
                            <a class="collapse-item" href="CadastrarCliente.html">Cadastrar Cliente</a>
                            <a class="collapse-item" href="TabelaCliente.html">Consultar Cliente</a>

                        </div>
                    </div>
                </li>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#"  data-toggle="collapse" data-target="#collapseSecond" aria-expanded="true" >
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Produto</span>
                    </a>
                    <div id="collapseSecond" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Acesso</h6>
                            <a class="collapse-item" href="indexProduto.html">Cadastrar Produto</a>
                            <a class="collapse-item" href="TabelaProduto.html">Consultar Produto</a>

                        </div>
                    </div>
                </li>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#"  data-toggle="collapse" data-target="#collapseThird" aria-expanded="true" >
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Categoria</span>
                    </a>
                    <div id="collapseThird" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Acesso</h6>

                            <a class="collapse-item" href="CadastroCategoria.html">Cadastrar Categoria</a>
                            <a class="collapse-item" href="EditarCategoria.html">Editar Categoria</a>

                        </div>
                    </div>
                </li>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#"  data-toggle="collapse" data-target="#collapseFourth" aria-expanded="true" >
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Funcionário</span>
                    </a>
                    <div id="collapseFourth" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Acesso</h6>

                            <a class="collapse-item" href="CadastroFuncionario.html">Cadastrar Funcionário</a>
                            <a class="collapse-item" href="TabelaFuncionario.html">Consultar Funcionário</a>

                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">



                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Navigation --
            <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="padding-top: 3%; background-color: #00264d;">
           
              <div class="container">
                <a class="navbar-brand" href="index.html" style="position: absolute; left: 7.3%; top: -100%;" title="Daiwahero.com"><img width= "190px" height= "190px" src="img\logo02.png" alt=""  style="right:10%; padding-right: 2%"/></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                          
              </div>
            </nav>
          
            <!-- Page Content -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">



                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">



                        <h3>ATUALIZAR DADOS DO FUNCIONÁRIO</h3> 

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>










                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <span class="mr-2 d-none d-lg-inline text-gray-600 small" style="padding-top: 27px">ADMINISTRADOR</span>
                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>






                                <!-- Dropdown  -->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                                    <h6 class="dropdown-header">
                                        Message Center
                                    </h6>

                                    <a class="dropdown-item text-center small text-gray-500" href="#"></a>

                                </div>
                            </li>


                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">LOGIN</span>
                                    <!-- <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60"> -->
                                </a>



                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Entrar
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Sair
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Page Content -->

                    <div class="container" style="margin-top: 5%;">


                        <div class="alert" role="alert">
                            ${msg}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div><br><br>
                        <div class="col-md-11 control-label" style="margin-top: -10px;">
                            <p class="help-block"><h11>*</h11> Campo Obrigatório </p>
                        </div>
                        <div class="row">

                            <div class="col-lg-3">
                                <!--
                               <h1 class="my-4"> + Categorias</h1>
                               <div class="list-group">
                                 <a href="#" class="list-group-item">Eletrodomésticos</a>
                                 <a href="#" class="list-group-item">Eletrônicos</a>
                       
                               </div>
                                -->
                            </div>
                            <!-- /.col-lg-3 -->

                            <div class="container-fluid">




                                <form method="get" class="form-vertical  js-form-loading">
                                </form>

                                <form ction="${pageContext.request.contextPath}/FuncionarioServletUpdate" method="post">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div class="form-group" name="div">
                                                <label >Nome: <h11>*</h11></label>
                                                <input id="nome" name="nome" type="text" value="${funcionario.getNome()}" class="form-control "/>
                                            </div>
                                        </div>



                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="cpf">CPF: <h11>*</h11></label>
                                                <input style="  width: 60%; height: 60% "id="cpf" name="cpf" value="${funcionario.getCpf()}" class="form-control input-md" required="" type="text" maxlength="14" onkeydown="javascript: fMasc(this, mCPF);">
                                            </div>
                                        </div>




                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="email">E-mail:<h11>*</h11> </label>
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                                <input id="email" name="email" class="form-control" value="${funcionario.getEmail()}" required="" type="text" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" disabled>
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="senha">Senha: <h11>*</h11></label>
                                                <input class="form-control" type="password" id="senha" name="senha"
                                                       value="${funcionario.getSenha()}" maxlength="8" required style="  width: 60%; height: 60% ">
                                            </div>
                                        </div>


                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="telefone">Telefone:<h11>*</h11> </label>
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                                                <input style="  width: 70%; height: 70% " id="telefone" name="telefone" class="form-control" value="${funcionario.getTelefone()}" required="" type="text" maxlength="13" pattern="\[0-9]{2}\ [0-9]{4,6}-[0-9]{3,4}$"
                                                       OnKeyPress="formatar('(##) #####-####', this)">
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="dataNasc">Data de Nascimento:<h11>*</h11> </label>
                                                <input style="  width: 60%; height: 60% " id="datanasc" name="dataNasc" value="${dataNasc}" class="form-control input-md" required="" type="text" maxlength="10" onkeypress="mascaraData(this)" OnKeyPress="formatar('##/##/####', this)" onBlur="showhide()">
                                            </div>
                                        </div>

                                        <label class="col-md-1 control-label" for="radios" >Sexo <h11>*</h11></label>
                                        <div class="col-sm-3" style="padding-top: 40px; right: 85px;"> 
                                            <label required="" class="radio-inline" for="radios-0" value="${funcionario.getGenero()}">
                                                <input name="sexo" id="sexo" value="feminino" type="radio" required>
                                                Feminino
                                            </label> 
                                            <label class="radio-inline" for="radios-1">
                                                <input name="sexo" id="sexo" value="masculino" type="radio">
                                                Masculino
                                            </label>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="cep">CEP: <h11>*</h11></label>
                                                <input type="text" id="cep" name=cep class="form-control mascCep" maxlength="9" onblur="pesquisacep(this.value);" style="  width: 50%; height: 30% " value="${funcionario.getCep()}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="endereco">Endereço: <h11>*</h11></label>
                                                <input type="text" id="endereco" name="endereco"class="form-control" value="${funcionario.getEndereco()}">
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="bairro">Bairro: <h11>*</h11></label>
                                                <input type="text" id="bairro" name="bairro" class="form-control" value="${funcionario.getBairro()}">
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="cidade">Cidade: <h11>*</h11></label>
                                                <input type="text" name="cidade" id="cidade" class="form-control" value="${funcionario.getCidade()}">
                                            </div>
                                        </div>


                                        <div class="col-sm-3">
                                            <div class="form-group" style="padding-right: 50%">
                                                <label for="input-produto-categoria">UF <h11>*</h11></label>
                                                <select name="uf" id="uf" class="form-control" placeholder="Qual?" value="${funcionario.getUf()}">
                                                    <option>RO</option>
                                                    <option>AC</option>
                                                    <option>AM</option>
                                                    <option>RR</option>
                                                    <option>PA</option>
                                                    <option>AP</option>
                                                    <option>TO</option>
                                                    <option>MA</option>
                                                    <option>PI</option>
                                                    <option>CE</option>
                                                    <option>RN</option>
                                                    <option>PB</option>
                                                    <option>PE</option>
                                                    <option>AL</option>
                                                    <option>SE</option>
                                                    <option>BA</option>
                                                    <option>MG</option>
                                                    <option>ES</option>
                                                    <option>RJ</option>
                                                    <option>SP</option>
                                                    <option>PR</option>
                                                    <option>SC</option>
                                                    <option>RS</option>
                                                    <option>MS</option>
                                                    <option>MT</option>
                                                    <option>GO</option>
                                                    <option>DF</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="complemento">Complemento: </label>
                                                <input type="text" name="complemento" id="complemento" class="form-control" alue="${funcionario.getComplemento()}" style="  width: 60%; height: 60%">
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="numero" >N°: <h11>*</h11></label>
                                                <input type="text" name="numero" id="numero" class="form-control" style="  width: 30%; height: 30% " value="${funcionario.getNumero()}">
                                            </div>
                                        </div>


                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="cargo" style="right: 50px;">Cargo: <h11>*</h11></label>
                                                <select name="cargo" id="cargo" class="form-control" placeholder="Qual?" style="padding-left: 50px;" value="${funcionario.getCargo()}">
                                                    <option>Administrador</option>
                                                    <option>Auxiliar</option>
                                                    <option>Estagiário</option>
                                                    <option>Aprendiz</option>>
                                                </select>
                                            </div>
                                        </div>

                                        <label style="margin-top: 3.5%; padding-left: 15px; left: 50px;">Desabilitado</label>
                                        <div class="toggle" style="margin-top: 3.5%; padding-left: 10px">
                                            <input name="habilitado" type="checkbox" id="foo" />
                                            <label for="foo"></label>
                                        </div>
                                        <label style="margin-top: 3.5%; padding-left: 10px">Habilitado</label>


                                    </div>


                                    <div class="form-group" style="padding-left: 800px; margin-top: 10px;">
                                        <button class="btn  btn-primary" type="submit" name="div" >Salvar</button>
                                        <a href="#" class="btn  btn-default" style="background: #ff3300; color: white;" >Cancelar</a>
                                        <a href="#" class="btn  btn-link  aw-btn-link-danger" type="Reset" >Limpar Formulário</a>
                                    </div>
                                </form>






                                <!--  <div class="alert  alert-danger  alert-dismissible" role="alert">
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <i class="fa  fa-exclamation-circle"></i> Já existe um produto com o nome informado.
                                    </div> --> 




                                <!-- /.col-lg-3 
                          
                                <div class="col-lg-9">
                          
                          
                                </div>
                                <!-- /.col-lg-9 
                              </div>
                                <!-- /.row 
                              </div>
                                <!-- /.container -->

                                <!-- Footer 
                                <footer class="py-5" style="margin-top: 2%; background-color: #00264d;">
                                  <div class="container">
                                      <div style="float: right; padding-right: 6%; margin-top: 2%" >
                                          
                                              </div>
                                  </div>
                                <!-- /.container 
                              </footer>
                            
                                <!-- Bootstrap core JavaScript 
                                <script src="vendor/jquery/jquery.min.js"></script>
                                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                              
                                  
                              
                                <!-- Page level custom scripts -->
                                <script src="js/demo/chart-area-demo.js"></script>
                                <script src="js/demo/chart-pie-demo.js"></script>

                                </body>

                                </html>