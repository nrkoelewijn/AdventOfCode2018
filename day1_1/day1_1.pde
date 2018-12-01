String[] lines;

void setup() {
    lines = loadStrings("input1_1.txt");
}

void draw(){
  int current = 0;
  
  for (int i = 0 ; i < lines.length; i++) {
    current += parseInt(lines[i]);
  }
  println(current);
  exit();
}
