import { Component } from "@angular/core";

@Component({
  selector: "app-root",
  templateUrl: "./app.component.html",
  styleUrls: ["./app.component.css"],
})
export class AppComponent {
  visible = false;
  count = [];
  value = 0;
  colorText = "red";
  onToggle() {
    this.visible = !this.visible;
    this.count.push(this.value++);
    this.colorText = this.value > 5 ? "blue" : "black";
  }
}
