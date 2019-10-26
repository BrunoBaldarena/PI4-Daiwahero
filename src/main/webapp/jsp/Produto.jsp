<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="br">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Daiwahero Cadastro de Produto</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

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



        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
        <script>
            window.onload = function () {

                //Check File API support
                if (window.File && window.FileList && window.FileReader)
                {
                    var filesInput = document.getElementById("files");

                    filesInput.addEventListener("change", function (event) {

                        var files = event.target.files; //FileList object
                        var output = document.getElementById("result");

                        for (var i = 0; i < files.length; i++)
                        {
                            var file = files[i];

                            //Only pics
                            if (!file.type.match('image'))
                                continue;

                            var picReader = new FileReader();

                            picReader.addEventListener("load", function (event) {

                                var picFile = event.target;

                                var div = document.createElement("div");

                                div.innerHTML = "<table><tr data-row><td><img style='width: 300px; height: 200px' class='thumbnail' src='" + picFile.result + "'" +
                                        "title='" + picFile.name + "'/></td><td><a href=# data-remove-file>remove now</a></td></tr></table>";
                                output.insertBefore(div, null);

                            });

                            //Read the image
                            picReader.readAsDataURL(file);
                        }

                    });
                } else
                {
                    console.log("Seu Navegador não suporta!");
                }
            }

            $(document).on("click", "[data-remove-file]", function (e) {

                e.preventDefault();

                $(e.target).closest("[data-row]").remove();

            });

            $(document).on("submit", "form", function (e) {

                //e.preventDefault();

                $(e.target).find("[data-mark-remove-file]").each(function (i, chk) {

                    if ($(chk).is(":checked"))
                        $(chk).closest("[data-row]").remove();
                });

            });
            function arrayParaString(array) {
                i = 0;
                string = "";

                while (array[i]) {
                    string += array[i].name + '|';
                    i++;
                }

                string = string.substring(0, string.length - 1);

                return string;

            }

        </script>
        <style>

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

            body{
                font-family: 'Segoe UI';
                font-size: 12pt;
            }

            header h1{
                font-size:12pt;
                color: #fff;
                background-color: #1BA1E2;
                padding: 20px;

            }
            article
            {
                width: 80%;
                margin:auto;
                margin-top:10px;
            }


            .thumbnail{

                height: 100px;
                margin: 10px;    
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



                        <h3>CADASTRO DE PRODUTO</h3> 

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

                    <div class="container" style="margin-top: 7%;">

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
                        </div>
                    </div>
                    <!-- /.col-lg-3 -->

                    <div class="container-fluid">



                        <form action="${pageContext.request.contextPath}/produtoSalvar" method="post" class="form-vertical  js-form-loading" enctype = "multipart/form-data">

                            <div class="form-group">
                                <label for="nome">Nome: </label>
                                <input id="nome" type="text" name="nome" class="form-control" style="  width: 50%; height: 50% "/>
                            </div>

                            <div class="form-group">
                                <label for="bdescricao">Breve Descrição: </label>
                                <input id="bdescricao" name="breve" type="text" class="form-control" style="  width: 50%; height: 50% "/>
                            </div>

                            <div class="form-group">
                                <label for="descricao">Descrição: </label>
                                <textarea id="descricao" name="descricao" rows="3" class="form-control"></textarea>
                            </div>

                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="preco">Preço unitário: </label>
                                        <input id="preco" type="text" name="valor" class="form-control" placeholder="R$" style="  width: 60%; height: 60% "/>
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label for="estoque">Estoque: </label>
                                        <input id="estoque" type="text" name="qtd" class="form-control" placeholder="Unidades" style="  width: 60%; height: 60% "/>
                                    </div>
                                </div>



                                <div class="col-sm-3">
                                    <div class="form-group" style="padding-right: 50%">
                                        <label for="input-produto-categoria">Categorias: </label>
                                        <select name="categoria" placeholder="Qual?">
                                            <c:forEach items="${categoria}" var="categoria">
                                                <option value="${categoria.getId()}">${categoria.getNome()}</option>  
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>


                                <label style="margin-top: 3.5%; padding-right: 1%">Desabilitado</label>
                                <div class="toggle" style="margin-top: 3.5%">
                                    <input name="status" type="checkbox" id="foo" />
                                    <label for="foo"></label>
                                </div>
                                <label style="margin-top: 3.5%; padding-left: 1%">Habilitado</label>

                            </div>

                            <div class="form-group">
                                <button class="btn  btn-primary" type="submit">Salvar</button>
                                <a href="#" class="btn  btn-default" style="background: #ff3300; color: white;" >Cancelar</a>
                                <a href="#" class="btn  btn-link  aw-btn-link-danger" onclick="limparForm()">Limpar Formulário</a>
                            </div>

                            <header>
                                <h1 style="position: center; padding-left:400px;">******ESCOLHA AS IMAGENS******</h1>
                            </header>


                            <div class="form-group">
                                <div class="row" style="margin: 12px; ">

                                    <div class="span8">
                                        <div class="row">

                                            <label for="files">Selecione as imagens: </label>

                                            <input id="files" type = "file" multiple/>
                                            <output id="result"/>

                                            <h4><strong><a style="padding-left:20px;">Imagens</a></strong></h4>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- /.col-lg-3 
      
            <div class="col-lg-9">
      
      
            <!-- /.container -->


            <!-- Bootstrap core JavaScript 
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>                                  
            <!-- Page level custom scripts -->
            <script src="js/demo/chart-area-demo.js"></script>
            <script src="js/demo/chart-pie-demo.js"></script>

    </body>

</html>
