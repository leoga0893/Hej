//Fabrikken //<>//
//Vi skal lave en fabrik som producere varer i form af forskellige datatyper.

//Global
String[] Stringlist;
ArrayList<String> foundWords = new ArrayList<String>();
int longWordCount = 0;
String longestWord = "";

void setup() {
  frameRate(1);
  size(800, 800);
  textSize(50);
  fill(0);
  Stringlist = loadStrings("https://raw.githubusercontent.com/dwyl/english-words/refs/heads/master/words.txt");
}

void draw() {
  background(205);
  if (bitMine()) {
    text(1, 350, 50);
  } else {
    text(0, 350, 50);
  }
  byte resultByte = makeByte();
  char resultChar = byteToChar();
  String resultString = generateString();
  int resultIntValue = generateIntValue();

  String generatedWord = generateWord();
  if (generatedWord.length() > 2) {
    text("[Tillykke! :3]", 1, 350);
    longWordCount++;
    foundWords.add(generatedWord);


    if (generatedWord.length() > longestWord.length()) {
      longestWord = generatedWord;
    }
  }
  text(resultByte, 350, 100);
  text(resultChar, 350, 150);
  text(resultString, 350, 200);
  text(resultIntValue, 350, 250);

  text("Bit afdeling:", 1, 50);
  text("Byte afdeling:", 1, 100);
  text("Char afdeling", 1, 150);
  text("String afdeling:", 1, 200);
  text("Int afdeling:", 1, 250);
  
  text(generatedWord, 1, 400);
  text("Længste ord: " + longestWord, 1, 450);
  text("Antal lange ord: " + longWordCount, 1, 500);
}


//Bit afdeling | råstoffer
boolean bitMine() {
  float f = random (0, 2);
  if (f < 1) {
    return true;
  } else {
    return false;
  }
}

//Byte afdeling
byte makeByte() {
  byte b = 0;
  for (int i=0; i<7; i++) { //udelukker 0, fordi vi ikke har brug for den maksimale index værdi, så vi har kun 1 til 7
    if (bitMine()) {
      b += (int)pow(2, i);
    }
  }
  return b;
}

//Char afdeling
char byteToChar() {
  byte b = makeByte();
  //sålænge b er større en 65 og mindre en 90 så det fint, eller lave en ny byte
  while (!((b>65&&b<90||b>97&&b<122))) {
    b = makeByte();
  }
  return (char) (b); //typecaster (byte b) til at give en char datatype
}

String generateString() {
  String str = "";
  for (int i=0; i<3; i++) {
    str = str + byteToChar();
  }
  return str;
}

//Integer afdeling
int generateIntValue() {
  int myInt = 0;
  for (int i=0; i<32; i++) {
    if (bitMine()) {
      myInt += (int)pow(2, i);
    }
  }
  return myInt;
}

//StringArray afdeling
String generateWord() {
  int Word = int(random(Stringlist.length));
  return Stringlist[Word];
}
