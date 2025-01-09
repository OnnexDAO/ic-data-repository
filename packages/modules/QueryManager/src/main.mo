import Text "mo:base/Text";

module QueryManager {
  public func greet(name : Text) : Text {
    return (Text.concat("Hello, ", name));
  };
};
