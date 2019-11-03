<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="br">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Daiwahero</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <script src="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></script>
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->

        <style>
            .content {
                display: inline-block;
            }
        </style>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="padding-top: 4%; background-color: #00264d;">

            <div class="navbar-header">
                <button type="button" class="navbar-toggle navbar-toggler collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="navbar-toggler-icon"></span>   
                </button>
            </div>

            <div class="input-group" style="position: absolute; top: 5%; left: 40%; padding-right: 80%">		
                <input class="form-control mr-sm-3" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-light" type="submit"> <img width= "20px" height= "20px" src="img\lupa.png" alt=""/></button>
            </div>

            <a class="navbar-brand " href="login_register.html" style="position: absolute; top: 5%; right: 15%;"><img width= "30px" height= "30px" src="img\login.png" alt=""  style="right:25%; padding-right: 2%"/>Login</a>
            <a href="Carrinho.html"><button class="btn" type="submit" style="position: absolute; top: 5%; right: 11%; width: 30px; height: 30px"><img  width= "20px" height= "20px" title="Carrinho" src="img\carrinho.png" alt=""/></button></a>
        </nav>

        <!-- Page Content -->
        <div class="container" style="margin-top: 7%;">
            <div class="row"> 
                <div class="col-lg-5" >
                    <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                        <ol class="carousel-indicators">
                            ${indicators}
                        </ol>
                        <div class="carousel-inner" role="listbox" style="margin-left: 5%;">
                            ${inner}
                        </div>
                        <button class="carousel-control-prev" href="#carouselExampleIndicators" type="button" data-slide="prev" style="; height: 10%; width: 8%; margin-top: 40%">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="false"></span>
                            <span class="sr-only">Previous</span>
                        </button>

                        <button class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next" style="height: 10%; width: 8%; margin-top: 40.8%; left: 91%;">
                            <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </button>     
                    </div>
                </div>
            <div class="col-lg-6 col-md-6 mb-4" style="margin-top: 1.5%">
                <p class="text-body h2">${produto.getNome()}</p>

                <a>${produto.getBreveDescricao()}</a>   
                <div style="margin-top: 5%;" class="row">
                    <div class="col-md-6">  
                        <p class="text-danger" >${estoque}</p>
                    </div>
                    <div class="col-md-6">
                        <p class="h4" style="position:absolute; left: 50%;">R$ ${valor}</p>
                    </div>
                </div>       
                <p class="h6" style="position:absolute; left: 50%;">12x de <b>R$ ${dividido}</b> sem juros no cartão</P>
                <div class="row" style="margin-top: 25%">
                    <div class="col">
                        <label for="usr" >Quantidade: <a style="color: red">*</a></ label>
                            <input type="text" class="form-control w-50" id="usr" required>
                            </div>
                            <div class="col" style="margin-top: 5.5%;">
                                <button type="button" style="position:absolute; left: 65%;" class="btn btn-outline-primary">Comprar</button>
                            </div>
                    </div>
                </div> 

                <div class="col-lg-11 col-md-12 mb-4" style="margin-top: 3%">


                    <h3>Descrição do Produto</h3>
                    <hr style="height:2px; border:none; color:#000; background-color:#000; margin-bottom: 5%;"/>
                    <a>
                        ${produto.getDescricao()}
                    </a>
                </div>
            </div>
        </div>


        <!-- /.container -->

        <!-- Footer -->
        <!-- Footer -->
        <footer class="py-5 page-footer font-small mdb-color lighten-3 pt-4" style="margin-top: 2%; background-color: #00264d;">

            <!-- Footer Links -->
            <div class="container text-center text-md-left">

                <!-- Grid row -->
                <div class="row">

                    <!-- Grid column -->
                    <div style="float: left; padding-left:8%;" class="col-md-4 col-lg-3 mr-auto my-md-4 my-0 mt-4 mb-1">

                        <!-- Content -->


                        <b><p class="m-0 text-white">Institucional</p></b>
                        <a href="#"><p class="m-0 text-white">Sobre a Daiwahero</p></a>
                        <a href="#"><p class="m-0 text-white">Trabalhe na Daiwahero</p></a>
                    </div>

                    <!-- Grid column -->

                    <hr class="clearfix w-100 d-md-none">



                    <!-- Grid column -->
                    <div style="float: left; padding-left:7%;" class="col-md-4 col-lg-3 mr-auto my-md-4 my-0 mt-4 mb-1">

                        <!-- Content -->



                        <b><p class="m-0  text-white">Dúvidas</p></b>
                        <a href="#"><p class="m-0 text-white">Central de atendimento</p></a>
                        <a href="#"><p class="m-0 text-white">Trocas e devoluções</p></a>	
                        <a href="#"><p class="m-0 text-white">Processo de entrega</p></a>
                    </div>

                    <!-- Grid column -->

                    <hr class="clearfix w-100 d-md-none">


                    <!-- Grid column -->
                    <div style="float: left; padding-left:7%;" class="col-md-4 col-lg-3 mr-auto my-md-4 my-0 mt-4 mb-1">

                        <!-- Content -->



                        <b><p class="m-0 text-white">Serviços</p></b>
                        <a href="#"><p class="m-0 text-white" >Tipos de entrega</p></a>
                        <a href="#"><p class="m-0 text-white" >Seguro roubo e furto</p></a>
                        <a href="#"><p class="m-0 text-white">Garantia estendida</p></a>
                    </div>

                    <!-- Grid column -->

                    <hr class="clearfix w-100 d-md-none">

                    <!-- Grid column -->
                    <div class="container col-md-2 col-lg-2 text-center mx-auto my-4" style="float: left;  padding-rigth: 1%;">

                        <!-- Instagram -->
                        <a href="https://www.instagram.com/?hl=pt-br"><img width= "40px" height= "40px" src="img\insta.png" title="Instagram" alt=""/></a>
                        <i class="fab"></i>
                        </a>
                        <!-- Facebook -->
                        <a href="https://pt-br.facebook.com/"><img width= "50px" height= "50px" src="img\face.png" title="Facebook" alt=""/></a>
                        <i class="fab fa-facebook-f"></i>
                        </a>
                        <!-- Twitter -->
                        <a href="https://twitter.com/"><img width= "50px" height= "50px" src="img\twitter.png" title="Twitter" alt=""/></a>
                        <i class="fab fa-twitter"></i>
                        </a>

                    </div>

                </div>
                <!-- Grid column -->
                <hr class="clearfix w-100 d-md-none">
                <!-- Copyright -->
                <div style="padding-top: 12%;">
                    <p class="m-0 text-center text-white">Daiwahero / CNPJ: 00.000.000/0000-00 / Inscrição Estadual: 000.000.000.000 / Av. Eng. Eusébio Stevaux, 823 - São Paulo, SP - 04696-000  </p>
                </div>
                <!-- Copyright -->

            </div>
            <!-- Grid row -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>

