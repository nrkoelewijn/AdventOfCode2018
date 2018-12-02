import java.util.Map;

String[] input;
HashMap<String,Integer> hm = new HashMap<String,Integer>(26);

void setup(){
  input = loadStrings("input2_1.txt");
  //Load alphabet as key into hashmap.
  for (char c = 'a'; c <= 'z'; c++) {
    hm.put(Character.toString(c), 0);
  }  
}

void draw(){
  int twoCnt = 0;
  int threeCnt = 0;
  
  //For each input line.
  for(int i = 0; i < input.length; i++){
    //Read each char of line and update counter value in hashmap.
    for(int j = 0; j < input[i].length(); j++){
      hm.put(Character.toString(input[i].charAt(j)), hm.get(Character.toString(input[i].charAt(j)))+1);
    }
    //Check if any score is 2 and/or 3 and update counters.
    if(hm.containsValue(2)){
      twoCnt++;
    }
    if(hm.containsValue(3)){
      threeCnt++;
    }
    //Reset hashmap values
    for (HashMap.Entry<String, Integer> entry : hm.entrySet()) {
      hm.put(entry.getKey(), 0);
    }
  }
  
  //Checksum
  println(twoCnt*threeCnt);
  exit();
}
