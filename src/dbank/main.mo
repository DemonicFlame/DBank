import Debug "mo:base/Debug";

actor DBank {
  var currentVlaue = 300;
  let id = 2534586153;

  //Debug.print(debug_show(id));

  public func topUp(amount : Nat) {
    currentVlaue += amount;
    Debug.print(debug_show (currentVlaue));
  };

  public func withdraw(amount : Nat) {
    currentVlaue -= amount;
    Debug.print(debug_show (currentVlaue));
  };
};
