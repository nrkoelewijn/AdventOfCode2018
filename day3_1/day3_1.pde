import java.util.regex.Pattern;

int q = 1000000;
int z = 1000;
//int q = 64;
//int z = 8;
String[] input;
String[] fabric = new String[q];

void setup(){
  input = loadStrings("input3_1.txt");
  //Prepare fabric with dots (1000 x 1000).
  for(int i = 0; i < q; i++){
    fabric[i] = ".";
  }
}

void draw(){
  //Read input with regex.
  for(int i = 0; i < input.length; i++){
    String[] m = match(input[i], "#(\\d+)\\s@\\s(\\d+),(\\d+):\\s(\\d+)x(\\d+)");
    //Fill fabric with rectangle.
    for(int y = (Integer.parseInt(m[3])); y < (Integer.parseInt(m[3]))+(Integer.parseInt(m[5])); y++){
      for(int x = (Integer.parseInt(m[2])); x < (Integer.parseInt(m[2]))+(Integer.parseInt(m[4])); x++){
        //Check for overlap.
        if(fabric[x+(y*z)].equals(".")){ 
          fabric[x+(y*z)] = m[1];
        }
        else{
          fabric[x+(y*z)] = "X";
        }
      }
    }
  }
  
  //Count overlapping 'inches'.
  int cnt = 0;
  for(int n = 0; n < fabric.length; n++){
    if(fabric[n].equals("X")){
      cnt++;
    }
  }
  println("counter: " + cnt);
  //printFabric();
  noLoop();
}

void printFabric(){
  for(int y = 0; y < z; y++){
    for(int x = 0; x < z; x++){
      if((x+(y*z)%(z) == 0)){
        println();
      }
      print(fabric[x+(y*z)]);
    }
  }
}
