

/// We created this separate Counter Class so that
/// we can efficiently write unit tests for our application
/// As Writing unit test becomes very complex if code UI and Logic together in single file or class
class Counter{
  int _counter = 0;

  int get counter => _counter;

  void increment(){
    _counter++;
  }
  void decrement(){
    _counter--;
  }

}