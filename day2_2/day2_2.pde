String[] input;

void setup(){
  input = loadStrings("../day2_1/input2_1.txt"); 
}

void draw(){
  int len = input[0].length();
  int diff = 0;
  
  //For each input line.
  for(int i = 0; i < input.length-1; i++){
    //Compare to all other input lines by characters.
    for(int j = i+1; j < input.length; j++){
      for(int c = 0; c < len; c++){
        if(input[i].charAt(c) != input[j].charAt(c)){
          diff++;
          //According to the problem, the box IDs differ by at most 1 char.
          if(diff > 1){
            break;
          }
        }
      }
      //If IDs differ by exactly 1 char, then output common chars.
      if(diff == 1){
        for(int n = 0; n < len; n++){
          if(input[i].charAt(n) == input[j].charAt(n)){
            print(input[i].charAt(n));
          }
        }
        exit();
      }
      diff = 0;
    }
  }
  
  noLoop();
}
