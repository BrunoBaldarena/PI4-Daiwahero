package br.com.senac.pi4.daiwahero.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import javax.imageio.ImageIO;

public class ImagemTeste {
    
    
    public void criarDiretorioImagem(){
        
        File diretorio = new File("C:\\Daiwahero\\Imagem"); 
       
        if (!diretorio.exists()) {
            diretorio.mkdirs();
            
        }
    }
    
    public void ReadWriteImage() {   
    
       BufferedImage image = null;
        try {
           
            URL url = new URL("https://images.tcdn.com.br/img/img_prod/101201/luminaria_illusion_3d_acrilico_led_caveira_327714248_1_20160311104744.jpg");
            image = ImageIO.read(url);
             
            ImageIO.write(image, "jpg",new File("C:\\out.jpg"));
            ImageIO.write(image, "gif",new File("C:\\out.gif"));
            ImageIO.write(image, "png",new File("C:\\out.png"));
             
        } catch (IOException e) {
            e.printStackTrace();
        }
       
    }
}
