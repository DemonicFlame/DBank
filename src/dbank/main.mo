import Debug "mo:base/Debug";

actor DBank {
  stable var currentValue : Nat = 300;
  let id = 2534586153;

  //Debug.print(debug_show(id));

  public func topUp(amount : Nat) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Nat) {
    let tempValue : Int = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amount exceeds current value");
    };
  };

  public query func checkBalance() : async Nat {
    return currentValue;
  };
};
