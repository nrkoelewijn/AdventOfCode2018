StringBuilder input;
String[] inp;

void setup(){
  inp = loadStrings("../day5_1/input5_1.txt");
}

void draw(){
  int min = inp[0].length();

  //For all types.
  for(int i  = 10; i < 35; i++){ 
    //Restore input string.
    input = new StringBuilder(inp[0]);
    //Remove all instances of an unit type (i).
    removeType(i);
    //Collapse polymer by reaction.
    collapse();
    //Check leftover length of polymer.
    if(input.length() < min){
      min = input.length();
    }
  }
  println("minimum is: " + min);
  
  noLoop();
}

void removeType(int type){
  for(int i = 0; i < input.length(); i++){
    //No matter capitalization, delete if equal chars.
    if(Character.getNumericValue(input.charAt(i)) == type){
      input.deleteCharAt(i);
      i--;
    }
  }
}

void collapse(){
  //Keep checking for couples (aA, Bb, etc.) until a full round has gone by without finding anything.
  boolean found = false;
  do {
    found = false;
    for(int i = 0; i < input.length() - 1; i++){
      int one = Character.getNumericValue(input.charAt(i));
      int two = Character.getNumericValue(input.charAt(i+1));
      
      //Check the two adjacent chars by numerical values to see if they are their capital-opposites (same numerical values and not same chars).
      if((one - two == 0) && (input.charAt(i) != input.charAt(i+1))){
        input.deleteCharAt(i);
        //Everything shifts to the left, so again, delete at i.
        input.deleteCharAt(i);
        found = true;
        break;
      } 
    }
  } while(found);
}
