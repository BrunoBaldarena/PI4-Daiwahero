<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Daiwahero Categoria</title>

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

 

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

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
          <span>Login</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Acessos</h6>
            <a class="collapse-item" href="login_register.html">ADM</a>
            <a class="collapse-item" href="login_register.html">Funcionários</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="Estoque.html" >
          <i class="fas fa-fw fa-wrench"></i>
          <span>Estoque</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">teste2</h6>
            <a class="collapse-item" href="utilities-color.html">teste</a>
            <a class="collapse-item" href="utilities-border.html">teste</a>
            <a class="collapse-item" href="utilities-animation.html">teste</a>
            <a class="collapse-item" href="utilities-other.html">outros</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Cadastros: 
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Cliente</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Acesso</h6>
            <a class="collapse-item" href="TabelaCliente.html">Consultar Cliente</a>
            <a class="collapse-item" href="TabelaCliente.html">Cadastrar Cliente</a>
            
            </div>
        </div>
      </li>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Produto</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Acesso</h6>
            <a class="collapse-item" href="TabelaProduto.html">Consultar Produto</a>
            <a class="collapse-item" href="indexProduto.html">Cadastrar Produto</a>
            
            </div>
        </div>
      </li>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Categoria</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Acesso</h6>
            
            <a class="collapse-item" href="CadastroCategoria.html">Cadastrar Categoria</a>
            <a class="collapse-item" href="EditarCategoria.html">Editar Categoria</a>
            
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

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
		  
            <i class="fa fa-bars"></i>
          </button>

         

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto" >
          <h1>CADASTRO DE CATEGORIA</h1> 
            

            

           

        </nav>
        <!-- End of Topbar -->

  <!-- Page Content -->
  
  
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
      <!-- /.col-lg-3 -->
  
  <div class="container-fluid">

	

	<form action="${pageContext.request.contextPath}/categoriaSalvar" method="post" class="form-vertical  js-form-loading">
		
		<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
					<label for="categoria">Categoria</label>
					<input name="nome" type="text" class="form-control" />
				</div>
			</div>
			
<div class="form-group" style="margin-top: 3% ">
			<button class="btn  btn-primary" type="submit">Salvar</button>
		</div>
      
		</div>
        </form>
   
   <div class="table-responsive-sm">
  <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Id</th>
      <th scope="col">Nome</th>
      <th><th>
    </tr>
  </thead>
  <tbody>
      
   <c:forEach items="${categoria}" var="categoria">
                            <tr>
                                <td><c:out value="${categoria.getId()}"/></td>
                                <td><c:out value="${categoria.getNome()}"/></td>
                               
                                <td class="text-right">
                                    
                                    <a href="${pageContext.request.contextPath}/categoriaEditar01?cod=<c:out value='${categoria.getId()}'/>"><input type="button"  value="Editar"></a>
                                    <a href="${pageContext.request.contextPath}/categoriaInativar?cod=<c:out value='${categoria.getId()}'/>"><input type="button"  value="Excluir"></a>

                                </td>
                            </tr>
    </c:forEach>

  
  </tbody>
  
  
  
</table>


</div>

      


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
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript 
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    

  <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>