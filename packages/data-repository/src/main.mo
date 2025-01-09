import TextX "mo:xtended-text/TextX";
import Debug "mo:base/Debug";

actor {
  public query func greet(name : Text) : async Text {
    Debug.print(TextX.slice(name, 7, 5));
    return TextX.toUpper(name);
  };
};
