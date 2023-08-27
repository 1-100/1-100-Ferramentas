import com.hamoid.*;
VideoExport videoExport;
boolean gravando = true;

PFont font;

PImage[] formas_imagens =  new PImage[1000];
String caminho_imagens = "D:/Github/1-100-Site/content/formas/";

String[] formas = {
  "061",
  "062",
  "063",
  "064",
  "065",
  "066",
  "067",
  "068",
  "069",
  "070"
};

String[] formas_autorias = {
  "Lucas Gabriel Lima",
  "Guilherme Vieira",
  "Guilherme Vieira",
  "Guilherme Vieira",
  "Guilherme Vieira",
  "Guilherme Vieira",
  "Guilherme Vieira",
  "Gabriela Momberg e Guilherme Vieira",
  "Guilherme Vieira",
  "Guilherme Vieira"
};

String titulo = "Compilado " + formas[0] + " — " + formas[9];

String arquivo = "1-100-Compilado-" + formas[0] + "-" + formas[9] + ".mp4";

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

int formas_contador = 0;
int forma_contador = 0;
int tempo_intro = 50;
int frameR = 25;

void setup() {
  size(1000, 1000);
  imageMode(CENTER);
  rectMode(CENTER);
  font = createFont("NectoMono-Regular.otf", 40);
  textFont(font);

  if (gravando) {
    videoExport = new VideoExport(this, arquivo);
    videoExport.setQuality(90, 0);
    videoExport.setFrameRate(frameR);
    videoExport.startMovie();
  }
  frameRate(frameR);

  cor_fundo_troca();

  int forma_imagens_indice = 0;

  for (int j = 0; j < 10; j++) {
    for (int i = 0; i < 100; i++) {
      String numero = str(i + 1);
      String caminho = caminho_imagens + formas[j] + "/" + numero + ".jpg";
      formas_imagens[forma_imagens_indice] = loadImage(caminho);
      println("Carregando " + caminho);
      forma_imagens_indice++;
    }
  }

  blendMode(MULTIPLY);
  fill(0);
}

void draw() {
  background(cor_fundo);

  if ( frameCount <= tempo_intro) {
    textAlign(CENTER);
    text("100 FORMAS DE CONTAR DE 1 A 100", width/2, height/2 - 100);
    text(titulo, width/2, height/2 + 80);

    if (frameCount == tempo_intro) {
      cor_fundo_troca();
    }
  } else {


    fill(0);
    textAlign(CENTER);
    text(formas[forma_contador], width/2, 100);
    text(formas_autorias[forma_contador], width/2, height-80);

    noFill();
    rect(width/2, height/2, 500, 500);
    image(formas_imagens[formas_contador], width/2, height/2);

    if ( frameCount % 1 == 0 ) {
      formas_contador++;

      if ( formas_contador % 100 == 0) {
        forma_contador++;
        cor_fundo_troca();
      }
    }

    if ( formas_contador >= formas_imagens.length ) {
      if (gravando) {
        println("acabou");
        videoExport.endMovie();
      }
      exit();
    }
  }

  if (gravando) {
    videoExport.saveFrame();
  }
}


void cor_fundo_troca() {
  int i = floor(random(paleta.length));
  cor_fundo = paleta[i];
}
