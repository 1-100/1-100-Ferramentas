import com.hamoid.*;
VideoExport videoExport;
boolean gravando = true;

PFont font;

String[][] formas = {
  {"001", "Guilherme Vieira"},
  {"002", "Guilherme Vieira"},
  {"003", "Guilherme Vieira"},
  {"004", "Guilherme Vieira"},
  {"005", "John Cartan"},
  {"006", "Vitor Carvalho"},
  {"007", "Marina Cardoso"},
  {"008", "Eduardo Zmievski (a.k.a. CurlyBoy)"},
  {"009", "Thiago Correia"},
  {"010", "Vitor Carvalho"},
  {"011", "André Burnier"},
  {"012", "André Burnier"},
  {"013", "John Cartan"},
  {"014", "Fátima Finizola"},
  {"015", "Júnior Morimoto"},
  {"016", "César Ganimi Machado"},
  {"017", "Monica Rizzolli"},
  {"018", "Henrique Eira"},
  {"019", "Henrique Eira"},
  {"020", "Luiz Jales"},
  {"021", "Advan Shumiski"},
  {"022", "Mandu"},
  {"023", "John Cartan"},
  {"024", "Advan Shumiski"},
  {"025", "Rodrigo Junqueira"},
  {"026", "John Cartan"},
  {"027", "Caluã Pataca e Preface"},
  {"028", "Marlon Amorim Tenório"},
  {"029", "Tiago Fernandes Tavares"},
  {"030", "Felipe Turcheti"},
  {"031", "Mariana Leal"},
  {"032", "Alexandre B A Villares"}
};

String nome_video = "1-100-Compilado-001-032";
int tempo_intro = 50;
int taxa_quadros = 25;

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

PImage forma_imagem;
int forma_contador = 0;
int formas_contador = 0;

void setup() {
  size(1000, 1000);
  imageMode(CENTER);
  rectMode(CENTER);
  blendMode(MULTIPLY);
  fill(0);
  frameRate(taxa_quadros);

  font = createFont("NectoMono-Regular.otf", 40);
  textFont(font);

  if (gravando) {
    videoExport = new VideoExport(this, nome_video + ".mp4");
    videoExport.setQuality(90, 0);
    videoExport.setFrameRate(taxa_quadros);
    videoExport.startMovie();
  }

  cor_fundo_troca();
}

void draw() {
  background(cor_fundo);

  if ( frameCount <= tempo_intro) {

    textAlign(CENTER);
    text("100 FORMAS DE CONTAR DE 1 A 100", width/2, height/2 - 100);
    text("Compilado 001 - 032", width/2, height/2 + 80);

    if (frameCount == tempo_intro) {
      cor_fundo_troca();
    }
  } else {

    // Textos
    fill(0);
    textAlign(CENTER);
    text(formas[formas_contador][0], width/2, 100);
    text(formas[formas_contador][1], width/2, height-80);

    // Moldura
    noFill();
    rect(width/2, height/2, 500, 500);

    // Atualiza a contagem
    forma_contador++;
    if (forma_contador > 100) {
      forma_contador = 1;
      formas_contador++;
      cor_fundo_troca();

      if ( formas_contador >= formas.length ) {
        if (gravando) {
          println("acabou");
          videoExport.endMovie();
        }
        exit();
      }
    }

    // Carrega imagem da forma e desenha
    String numero = str(forma_contador);
    String caminho = formas[formas_contador][0] + "/" + numero + ".jpg";
    forma_imagem = loadImage(caminho);
    image(forma_imagem, width/2, height/2);
    println(formas_contador + " - " + forma_contador);
    
  }

  if (gravando) {
    videoExport.saveFrame();
  }
}


void cor_fundo_troca() {
  int i = floor(random(paleta.length));
  cor_fundo = paleta[i];
}
