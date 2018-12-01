String[] lines;
IntList freq = new IntList();
int current = 0;

void setup() {
    lines = loadStrings("../day1_1/input1_1.txt");
}

void draw(){
  for (int i = 0 ; i < lines.length; i++) {
    // Parse the string input value to an integer and calculate the new frequency.
    // Check if that frequency has already been found before.
    if(freq.hasValue(current += parseInt(lines[i]))){
      println(current);
      exit();
    }
    else{
      // If not, then add it to the list.
      freq.append(current);
    }
  }
}
