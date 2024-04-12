import Rectangle from "./rectangle.js";
import Triangle from "./triangle.js";

class Main {
  static display(shape) {
    console.log(`Area of ${shape} is ${shape.calculateArea()}`);
  }
}

const rectangle = new Rectangle(23.4, 34, 5);
const triangle = new Triangle(23.4, 34, 5);

Main.display(rectangle);
Main.display(triangle);
