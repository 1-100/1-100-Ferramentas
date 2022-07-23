import com.hamoid.*;
VideoExport videoExport;

String nome_forma = "025";
String nome_pessoa = "Rodrigo Junqueira";
int paleta_selecionada = 7;
boolean paleta_aleatoria = false;
boolean gravando = true;
int frameR = 10;

String nome = "1-100-Contribuicao-" + nome_forma + "-" + nome_pessoa;
String caminho_imagens = "D:/Github/1-100-Site/content/formas/" + nome_forma;

PFont font;
PImage[] forma_imagens =  new PImage[100];

color[] paleta = {
  #7FFFD4, 
  #FF7F50, 
  #D2691E, 
  #BDB76B, 
  #8FBC8F, 
  #E9967A, 
  #FF8C00, 
  #00CED1, 
  #FFD700, 
  #CD5C5C, 
  #F08080, 
  #FFB6C1, 
  #FFA07A, 
  #48D1CC, 
  #CD853F, 
  #FA8072, 
  #F4A460, 
  #D2B48C, 
  #FF6347
};

color cor_fundo;
int forma_contador = 0;

void setup() {
  size(1000, 1000);
  imageMode(CENTER);
  rectMode(CENTER);
  font = createFont("NectoMono-Regular.otf", 40);
  textFont(font);

  if (gravando) {
    videoExport = new VideoExport(this, nome + ".mp4");
    videoExport.setQuality(90, 0);
    videoExport.setFrameRate(frameR);
    videoExport.startMovie();
  }
  frameRate(frameR);

  if( paleta_aleatoria ) {
  cor_fundo_troca();
  }
  int forma_imagens_indice = 0;

  for (int i = 0; i < 100; i++) {
    String numero = str(i + 1);
    String caminho = caminho_imagens + "/" + numero + ".jpg";
    forma_imagens[forma_imagens_indice] = loadImage(caminho);
    println("Carregando " + caminho);
    forma_imagens_indice++;
  }

  blendMode(MULTIPLY);
  fill(0);
}

void draw() {
  
  if( paleta_aleatoria ) {
    background(cor_fundo);
  } else {
    background(paleta[paleta_selecionada]);
  }
  
  noFill();
  rect(width/2, height/2, 500, 500);
  image(forma_imagens[forma_contador], width/2, height/2, 500, 500);
  forma_contador++;

  if (gravando) {
    videoExport.saveFrame();
  }

  if ( forma_contador >= forma_imagens.length ) {
    if (gravando) {
      println("acabou");
      videoExport.endMovie();
    }
    exit();
  }
}


void cor_fundo_troca() {
  int i = floor(random(paleta.length));
  cor_fundo = paleta[i];
}
