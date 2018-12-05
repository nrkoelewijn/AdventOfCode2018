StringBuilder input;

void setup(){
  String[] i = loadStrings("input5_1.txt");
  input = new StringBuilder(i[0]);
}

void draw(){
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
  
  //Check length of polymer left.
  println(input.length());
  noLoop();
}
