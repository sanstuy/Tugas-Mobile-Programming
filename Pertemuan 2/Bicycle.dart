class Bicycle {
  int cadence;
  int _speed = 0;
  int gear;
  int get speed => _speed;

  Bicycle(this.cadence, this.gear);
  
  void applyBreak(int decrement){
    _speed -= decrement;
  }
  
  void speedUp(int increment){
    _speed += increment;
  }
  
  @override
  String toString()=> 'Bicycle: $_speed mph';
}

void main() {
  var bike = Bicycle(2, 1);
  bike.speedUp(5);
  print(bike);
  bike.applyBreak(2);
  print(bike);
}