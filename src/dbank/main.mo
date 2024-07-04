import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue : Float = 300;
  let id = 2534586153;

  stable var startTime = Time.now();

  //Debug.print(debug_show(id));

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amount exceeds current value");
    };
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsed = (currentTime - startTime) / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsed));
    startTime := currentTime;
  };

  public query func checkBalance() : async Float {
    return currentValue;
  };
};
