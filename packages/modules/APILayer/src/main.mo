import Text "mo:base/Text";

module APILayer {
  public func greet(name : Text) : Text {
    return (Text.concat("Hello, ", name));
  };
};
