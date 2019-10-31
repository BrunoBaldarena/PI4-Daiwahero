<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Daiwahero</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- jQuery first, then Popper.js, then Bootstrap JS 110-->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            @media screen and (min-width: 350px) {
                div.example {
                    padding-top: 20%;
                }
            }
            .content {
                padding: 30px 0;

                .container {
                    max-width: 1128px;
                    margin: 0 auto;
                }
                body {
                    font-size: 62.5%;
                }

            }
            .footer {
                position: fixed;
                width: 100%;
                margin-top: 2.4em;
                margin-bottom: 2.4em;
                float: left;
                clear: both;
            }

            /***
            Pricing table
            ***/
            .pricing {
                position: relative;
                margin-bottom: 15px;
                border: 3px solid #eee;
            }

            .pricing-active {
                border: 3px solid #36d7ac;
                margin-top: -10px;
                box-shadow: 7px 7px rgba(54, 215, 172, 0.2);
            }

            .pricing:hover {
                border: 3px solid #343aeb;
            }

            .pricing:hover h4 {
                color: #36d7ac;
            }

            .pricing-head {
                text-align: center;
            }

            .pricing-head h3,
            .pricing-head h4 {
                margin: 0;
                line-height: normal;
            }

            .pricing-head h3 span,
            .pricing-head h4 span {
                display: block;
                margin-top: 5px;
                font-size: 14px;
                font-style: italic;
            }

            .pricing-head h3 {
                font-weight: 300;
                color: #fafafa;
                padding: 12px 0;
                font-size: 27px;
                background: #36d7ac;
                border-bottom: solid 1px #41b91c;
            }

            .pricing-head h4 {
                color: #bac39f;
                padding: 5px 0;
                font-size: 54px;
                font-weight: 300;
                background: #343aeb;
                border-bottom: solid 1px #f5f9e7;
            }

            .pricing-head-active h4 {
                color: #343aeb;
            }

            .pricing-head h4 i {
                top: -8px;
                font-size: 28px;
                font-style: normal;
                position: relative;
            }

            .pricing-head h4 span {
                top: -10px;
                font-size: 14px;
                font-style: normal;
                position: relative;
            }

            /*Pricing Content*/
            .pricing-content li {
                color: #888;
                font-size: 12px;
                padding: 7px 15px;
                border-bottom: solid 1px #f5f9e7;
            }

            /*Pricing Footer*/
            .pricing-footer {
                color: #777;
                font-size: 11px;
                line-height: 17px;
                text-align: center;
                padding: 0 20px 19px;
            }

            /*Priceing Active*/
            .price-active,
            .pricing:hover {
                z-index: 9;
            }

            .price-active h4 {
                color: #36d7ac;
            }

            .no-space-pricing .pricing:hover {
                transition: box-shadow 0.2s ease-in-out;
            }

            .no-space-pricing .price-active .pricing-head h4,
            .no-space-pricing .pricing:hover .pricing-head h4 {
                color: #343aeb;
                padding: 15px 0;
                font-size: 80px;
                transition: color 0.5s ease-in-out;
            }

            .yellow-crusta.btn {
                color: #FFFFFF;
                background-color: #343aeb;
            }
            .yellow-crusta.btn:hover,
            .yellow-crusta.btn:focus,
            .yellow-crusta.btn:active,
            .yellow-crusta.btn.active {
                color: #FFFFFF;
                background-color: #343aeb;


                /* The navigation menu */
                .navbar {
                    overflow: hidden;
                    background-color: #333;
                }

                /* Navigation links */
                .navbar a {
                    float: left;
                    font-size: 16px;
                    color: white;
                    text-align: center;
                    padding: 14px 16px;
                    text-decoration: none;
                }

                /* The subnavigation menu */
                .subnav {
                    float: left;
                    overflow: hidden;
                }

                /* Subnav button */
                .subnav .subnavbtn {
                    font-size: 16px;
                    border: none;
                    outline: none;
                    color: white;
                    padding: 14px 16px;
                    background-color: inherit;
                    font-family: inherit;
                    margin: 0;
                }

                /* Add a red background color to navigation links on hover */
                .navbar a:hover, .subnav:hover .subnavbtn {
                    background-color: red;
                }

                /* Style the subnav content - positioned absolute */
                .subnav-content {
                    display: none;
                    position: absolute;
                    left: 0;
                    background-color: red;
                    width: 100%;
                    z-index: 1;
                }

                /* Style the subnav links */
                .subnav-content a {
                    float: left;
                    color: white;
                    text-decoration: none;
                }

                /* Add a grey background color on hover */
                .subnav-content a:hover {
                    background-color: #eee;
                    color: black;
                }

                /* When you move the mouse over the subnav container, open the subnav content */
                .subnav:hover .subnav-content {
                    display: block;
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

                    <a class="navbar-brand" href="login_register.html" style="position: absolute; top: 5%; right: 15%;"><img width= "30px" height= "30px" src="img\login.png" alt=""  style="right:25%; padding-right: 2%"/>Login</a>
                    <a href="Carrinho.html"><button class="btn" type="submit" style="position: absolute; top: 5%; right: 11%; width: 30px; height: 30px"><img  width= "20px" height= "20px" title="Carrinho" src="img\carrinho.png" alt=""/></button></a>
                </nav>

                <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #00264d; margin-top: 4.4%">
                    <div class="container-fluid" style="position: float;">
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


                        <ul class=" nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#" >Home
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Celulares</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Tablets</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Tv e Vídeo</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Informática</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Geladeiras</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Fogão</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Maquina de Lavar</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Notebook</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Micro-ondas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Videogame</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!-- Page Content -->
            <div class="container" style="margin-top: 7%; top: -15;">


                <div class="row" >
                    <!-- Pricing -->
                    <div class="col-md-3">
                        <div class="pricing hover-effect" style="margin-top:9%;" >
                            <div class="pricing-head" >
                                <h3 style="background-color: #343aeb;">FILTRO <span >
                                        Pesquisa por Preço: </span>
                                </h3>
                            </div>
                            <ul class="pricing-content list-unstyled">
                                <li>
                                    <div class="form-check" style="padding-left: 18%">
                                            <input type="checkbox" class="form-check-input" id="Check1">
                                            <label class="form-check-label" for="exampleCheck1"> Até R$100</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-check" style="padding-left: 18%">
                                            <input type="checkbox" class="form-check-input" id="Check2">
                                            <label class="form-check-label" for="exampleCheck1">R$101 a R$500</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-check" style="padding-left: 18%">
                                            <input type="checkbox" class="form-check-input" id="Check3">
                                            <label class="form-check-label" for="exampleCheck1">R$501 a R$2000</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-check" style="padding-left: 18%">
                                            <input type="checkbox" class="form-check-input" id="Check4">
                                            <label class="form-check-label" for="exampleCheck1">R$2001 a R$5000</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-check" style="padding-left: 18%">
                                            <input type="checkbox" class="form-check-input" id="Check5">
                                            <label class="form-check-label" for="exampleCheck1">Mais de R$5001</label>
                                        </div>
                                    </li>
                                </ul>
                                <div class="pricing-footer">

                                    <a href="javascript:;" class="btn yellow-crusta">
                                        Aplicar
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!--
                              <div class="col-lg-3" >
                                  <h3 class="my-4" > Pesquisa por Preço: </h3>
                                  <div >
                                <div class="form-check" style="padding-left: 18%">
                            <input type="checkbox" class="form-check-input" id="Check1">
                            <label class="form-check-label" for="exampleCheck1"> Até R$100</label>
                          </div>
                          <div class="form-check" style="padding-left: 18%">
                            <input type="checkbox" class="form-check-input" id="Check2">
                            <label class="form-check-label" for="exampleCheck1">R$101 a R$500</label>
                                </div>
                                 <div class="form-check" style="padding-left: 18%">
                            <input type="checkbox" class="form-check-input" id="Check3">
                            <label class="form-check-label" for="exampleCheck1">R$501 a R$2000</label>
                          </div>
                          <div class="form-check" style="padding-left: 18%">
                            <input type="checkbox" class="form-check-input" id="Check4">
                            <label class="form-check-label" for="exampleCheck1">R$2001 a R$5000</label>
                                </div>
                                <div class="form-check" style="padding-left: 18%">
                            <input type="checkbox" class="form-check-input" id="Check5">
                            <label class="form-check-label" for="exampleCheck1">Mais de R$5001</label>
                                </div>
                          </div>
                              </div>
                        <!-- /.col-lg-3 -->

                        <div class="col-lg-9">

                            <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <img class="d-block img-fluid" src="img/banner01.jpg" alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block img-fluid" src="img/banner02.jpg" alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block img-fluid" src="img/banner03.jpg" alt="Third slide">
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>

                            <div class="row">
                                <c:forEach items="${produtos}" var="produtos">
                                    <c:forEach items="${imagens}" var="imagens">
                                        <c:if test = "${produtos.getPk_produto() == imagens.getFk_produto() }">
                                            <div class="col-lg-4 col-md-6 mb-4">
                                                <div class="card h-100">
                                                    <a href="ProdutoServletJohnathan?action=prod&id=${produtos.getPk_produto()}" name="id"><img class="card-img-top" src="${imagens.getImagem()}" alt="foto" ></a>
                                                    <div class="card-body">
                                                        <h4 class="card-title">
                                                            <a  href="ProdutoServletJohnathan?action=prod&id=${produtos.getPk_produto()}" name="id">${produtos.getNome()}</a>
                                                        </h4>
                                                        <h5>${produtos.getValor()}</h5>
                                                        <p class="card-text">${produtos.getBreveDescricao()}</p>
                                                    </div>
                                                    <div class="card-footer">
                                                        <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </div>
                            <!-- /.row -->

                        </div>
                        <!-- /.col-lg-9 -->

                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container -->
            </div>

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
                        <i class="fab-"></i>

                        <!-- Facebook -->
                        <a href="https://pt-br.facebook.com/"><img width= "50px" height= "50px" src="img\face.png" title="Facebook" alt=""/></a>
                        <i class="fab fa-facebook-f"></i>

                        <!-- Twitter -->
                        <a href="https://twitter.com/"><img width= "50px" height= "50px" src="img\twitter.png" title="Twitter" alt=""/></a>
                        <i class="fab fa-twitter"></i>


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

        </div>

    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
