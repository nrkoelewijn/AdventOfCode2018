class Guard { 
  int ID, totalSleep = 0 ; 
  int[] sleepMoments = new int[60];
  
  Guard (int id) {  
    ID = id;
  }
  
  //Store when guard was asleep and for how long.
  void sleep(String d1, String d2){    
    //Get minutes.
    String[] regex = match(d1, "\\W\\d+\\W\\d+\\W\\d+\\s\\d+:(\\d+)\\W");
    int start = Integer.parseInt(regex[1]);
    regex = match(d2, "\\W\\d+\\W\\d+\\W\\d+\\s\\d+:(\\d+)\\W");
    int end = Integer.parseInt(regex[1]);
    
    //Update amount slept.
    totalSleep += (end - start);
    
    //Store sleeping moments.
    for(int i = start; i < end; i++){
      sleepMoments[i]++;
    }
  }
  
  //Return the total sleep.
  int total(){
    return totalSleep;
  }
  
  //Return the moment when guard slept most.
  int mostAsleep(){
    int max = 0;
    int j = 0;
    for(int i = 0; i < sleepMoments.length; i++){
      if(sleepMoments[i] > max){
        max = sleepMoments[i];
        j = i;
      }
    }
    return j;
  }
  
}
