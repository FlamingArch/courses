import Shape from "./shape.js";

export default class Triangle extends Shape {
  constructor(base, height) {
    super(base, height);
  }
  calculateArea() {
    return (this.width * this.height) / 2;
  }
}
