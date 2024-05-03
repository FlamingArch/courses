import { Component } from "@angular/core";

@Component({
  selector: "app-root",
  templateUrl: "./app.component.html",
  styleUrls: ["./app.component.css"],
})
export class AppComponent {
  userName = "";
  isButtonEnabled = !(this.userName.length);
  onChange(event) {
    console.log(event);
  }
  onTextChange(event) {
    this.userName = event
    this.isButtonEnabled = !(this.userName.length);
  }
}
