class Timer {   //with the aid of: (Shiffman-pg:201 && 213)

  int savedTime; 
  int passedTime;
  int totalTime;

  Timer(int tempTotalTime) {
    totalTime=tempTotalTime;
  }

  void start() {
    savedTime=millis();
  }

  boolean isFinished(int nn) {
    passedTime=millis()-savedTime;
    if (passedTime>(nn*totalTime)) {
      return true;
    } else {
      return false;
    }
  }
}
