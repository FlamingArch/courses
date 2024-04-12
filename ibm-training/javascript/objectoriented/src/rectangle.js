import Shape from "./shape.js";

export default class Rectangle extends Shape {
  constructor(width, height) {
    super(width, height);
  }
  calculateArea() {
    return this.width * this.height;
  }
}
