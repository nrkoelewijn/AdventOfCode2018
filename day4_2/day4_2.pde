import java.util.Arrays;
import java.util.Map;

String[] input;

void setup(){
  input = loadStrings("../day4_1/input4_1.txt");
  //Sort array chronologically by default method, since input is given in ISO-format 8601 (with the 'T' omitted).
  Arrays.sort(input);
}

void draw(){
  HashMap<Integer, Guard> guards = new HashMap<Integer, Guard>();
  //Find the guard with the most minutes asleep, since they only sleep after midnight, only the minutes from sleep to awake count.
  
  int id = 0;
  
  //For each input line.
  for(int i = 0; i < input.length; i++){
    String[] m = match(input[i],"(\\W\\d+\\W\\d+\\W\\d+\\s\\d+\\W\\d+\\W)\\s\\w+\\s\\W?(\\d+)?\\s?\\w+?\\s?\\w+");
    //Regex check text if guard begins shift.
    if(m[2] != null){
      id = Integer.parseInt(m[2]);
      //Check if guard exists already.
      if(!(guards.containsKey(id))){
        Guard g = new Guard(id);
        guards.put(id, g);
      }
    }
    else{
      //Process sleep.
      String[] end = match(input[i+1],"(\\W\\d+\\W\\d+\\W\\d+\\s\\d+\\W\\d+\\W)\\s\\w+\\s\\w+");
      guards.get(id).sleep(m[1], end[1]);
      //Skip the input line "wakes up" since we already processed it.
      i++;
    }
    
  }
  
  //Get guard who sleeps the most during the same minute.
  int max = 0;
  for (HashMap.Entry<Integer, Guard> entry : guards.entrySet()) {
    if(entry.getValue().mostAsleep() > max){
      max = entry.getValue().mostAsleep();
      id = entry.getKey();
    }
  }
  
  println("product = id*moment = " + id*guards.get(id).maxMoment());
  noLoop();
}
