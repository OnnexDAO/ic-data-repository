import Debug "mo:base/Debug";
import { test; suite } "mo:test";
import Main "../src/main";

suite(
  "Hello World Tests",
  func() {
    test(
      "testHelloWorld",
      func() {
        assert Main.greet("world") == "Hello, World!";
      },
    );
  },
);
