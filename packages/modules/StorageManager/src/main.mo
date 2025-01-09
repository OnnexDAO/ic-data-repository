import Text "mo:base/Text";

module StorageManager {
  public func greet(name : Text) : Text {
    return (Text.concat("Hello, ", name));
  };
};
