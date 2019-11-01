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

        <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #00264d; margin-top: 4.5%">
            <div class="container-fluid" style="position: float;">
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                    <ul class=" nav navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#" >Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item ">
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
        <div class="container" style="margin-top: 7%;">
            <div class="row"> 
                <div class="col-lg-5" >
                    <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                        <c:set var="count" value="0" scope="page"/>		
                        <c:forEach items="${imagens}" var="imagens">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="${count}" class="active"></li>
                            </ol>
                            <div class="carousel-inner" role="listbox" style="margin-left: 5%;">
                                <div class="carousel-item">
                                    <img src="${imagens.getImagem()}" style="width: 400px; right: 300px;">
                                </div>
                            </div>
                            <c:set var="count" value="${count+1}" scope="page"/>
                        </c:forEach>
                        <button class="carousel-control-prev" href="#carouselExampleIndicators" type="button" data-slide="prev" style="; height: 10%; width: 8%; margin-top: 40%">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="false"></span>
                            <span class="sr-only">Previous</span>
                        </button>

                        <button class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next" style="height: 10%; width: 8%; margin-top: 40.8%; left: 91%;">
                            <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </button>     
                    </div>


                    <!-- /.col-lg-9 -->            
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
                    <p class="h6" style="position:absolute; left: 50%;">12x de <b>R$ ${String.format("%.2f",produto.getValor()/12).replace(".",",")}</b> sem juros no cartão</P>
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
                            <b>Características:</b></br>
                            - Marca: Samsung</br>
                            - Modelo: S8+</br></br>
                            <b>Especificações:</b></br>
                            - Sistema Operacional: Sistema Operacional + Versão: Android 7.0</br>
                            - Plataforma: 64 bits</br>
                            - Loja de Aplicativos: Play Store / Galaxy Apps</br></br>
                            <b>Processador:</b></br>
                            - Número de Núcleos: Octa-Core</br>
                            - Velocidade do Processador: 2.3GHz</br></br>
                            <b>Bandas:</b></br>
                            - 2G GSM (GPRS/EDGE): 850/900/1800/1900</br>
                            - 3G Bandas: B1(2100),B2(1900),B4(AWS),B5(850),B8(900)</br>
                            - 3G Downlink / Uplink: HSPA+ 42.2 / 5.76 Mbps</br>
                            - 4G Bandas: B1, B2, B3, B4, B5, B7, B8, B12, B13, B17, B18, B19, B20, B25, B26, B28, B38, B39, B40, B41</br>
                            - 4G categoria: Cat. 16</br></br>
                            <b>Conectividade:</b></br>
                            - Bluetooth: versão 5.0</br>
                            - Browser: Google Chrome, Samsung</br>
                            - Conexão Wi-Fi: Wi-Fi 802.11 a/b/g/n/ac (2.4/5GHz)</br>
                            - Roteador Wi-Fi</br>
                            - NFC</br>
                            - SAMSUNG Pay (NFC e MST)</br>
                            - 2 Chips</br>
                            - Tipo de SIM: Nano SIM (4FF)</br>
                            - USB versão: 3.1</br>
                            - USB Conector: Tipo C</br></br>
                            <b>Email e Escritório:</b></br>
                            - E-mail: Google Mail, SAMSUNG E-mail</br>
                            - Push E-mail: Microsoft | Direct Push E-Mail for Exchange</br>
                            - Tipos de E-mail Suportados: POP3,IMAP4,SMTP,SSL,TLS,EAS</br>
                            - Visualização de Arquivos Office</br>
                            - Edição de Arquivos Office: Disponível para download</br></br>
                            <b>Sensores:</b></br>
                            - Tipos de Sensores: Acelerômetro, Barômetro, Giroscópio, Geomagnético, Hall, Batimentos Cardíacos, Proximidade, Luz RBG, Pressão</br>
                            - Leitor Biométrico</br>
                            - Leitor de Íris</br></br>
                            <b>Display:</b></br>
                            - Tecnologia: Dual Edge Super AMOLED</br>
                            - Tamanho do Display: 6.2" (a tela medida diagonalmente tem 6.2” se considerada um retângulo e 6.1” se considerados os canto arredondados)</br>
                            - Número de Pixels: 2960 x 1440 (Quad HD+)</br>
                            - Quantidade de Cores: 16 Milhões</br>
                            - Vidro Reforçado</br></br>
                            <b>Câmera Traseira:</b></br>
                            - Resolução: 12 MP Dual Pixel (f1.7)</br>
                            - Zoom: Digital 4x</br>
                            - Estabilizador Óptico de Imagem (OIS)</br>
                            - Sensor Phase Detection (PADF)</br>
                            - Foco Automático</br>
                            - Modo de Foto: Automático, Pro, Panorama, Foto Sequencial, HDR (Vívido), Noturno, Embelezar Rosto, Esportes, Som e foto</br>
                            - Timer: Desativado, 2 segundos, 5 segundos,10 segundos</br>
                            - Efeitos de Foto: Negativo, Sépia, Tons cinza</br>
                            - Flash: LED</br></br>
                            <b>Câmera Frontal:</b></br>
                            - Resolução: 8.0 MP AF (f1.7)</br>
                            - Flash Frontal: (usando a tela)</br></br>
                            <b>Vídeo:</b></br>
                            - Formatos Suportados para reprodução: MP4, M4V, 3GP, 3G2, WMV, ASF, AVI, FLV, MKV, WEBM</br>
                            - Resolução de reprodução: UHD 4K (3840 x 2160) | @60fps</br>
                            - Resolução de gravação: UHD 4K (3840 x 2160)@30fps</br>
                            - Formato suportado de Streaming: 3GP,MP4</br></br>
                            <b>Imagem:</b></br>
                            - Formatos Suportados: BMP,GIF,JPEG,PNG</br></br>
                            <b>Música:</b></br>
                            - Reprodução de Música</br>
                            - Formatos Suportados: MP3, M4A, 3GA, AAC, OGG, OGA, WAV, WMA, AMR, AWB, FLAC, MID, MIDI, XMF, MXMF, IMY, RTTTL, RTX, OTA, DSF, DFF</br>
                            <b>Toques:</b></br>
                            - Polifônicos</br>
                            - MP3</br></br>
                            <b>GPS:</b></br>
                            - GPS</br>
                            - A-GPS</br></br>
                            <b>Memória:</b></br>
                            - Memória Interna total compartilhada: 64 GB*</br>
                            - Suporte a Cartão de Memória</br>
                            - Tipo Cartão de Memória Suportado: Micro SD</br>
                            - Capacidade do Cartão de Memória: até 256 GB</br>
                            - Memória RAM: 4 GB</br>
                            * Memória interna compartilhada com o sistema operacional e aplicativos pré embarcados.</br></br>
                            <b>Bateria:</b></br>
                            - Capacidade da Bateria (mAh): 3500 mAh</br>
                            - Tipo de Bateria: Ions de Lítio</br>
                            - Voltagem: Bivolt</br>
                            - Carregamento Rápido</br>
                            - Carregamento Sem Fio</br></br>
                            <b>Recursos:</b></br>
                            - Reconhecimento de Íris</br>
                            - Display Infinito</br>
                            - Resistente à água e à poeira (IP68)</br>
                            - Câmera Dual Pixel</br>
                            - Memória Expansível</br>
                            - Dual Chip</br>
                            - Multiplas Janelas</br></br>
                            <b>Conteúdo da Embalagem:</b></br>
                            - Smartphone Samsung</br>
                            - Carregador</br>
                            - Cabos de Dados</br>
                            - Fone de ouvido</br>
                            - Extrator de SIM</br>
                            - Adaptador Micro USB para Tipo C</br></br>
                            <b>Garantia:</b></br>
                            - 12 meses de garantia</br></br>
                            <b>Peso:</b></br>
                            380 gramas (bruto com embalagem)</br>
                        </a>
                    </div>
                </div>

                <!-- /.row -->
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

