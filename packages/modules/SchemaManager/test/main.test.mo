import { test; suite } "mo:test";
import Main "../src/main";

suite(
  "Schema Manager Tests",
  func() {
    test(
      "Hello World Succeeds",
      func() {
        assert (Main.greet("World")) == "Hello, World";
      },
    );
  },
);
