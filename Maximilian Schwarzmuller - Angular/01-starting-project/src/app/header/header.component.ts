import { Component } from '@angular/core';

@Component({
  selector: 'app-header',
  // template: '<h1>Hello, World</h1>', Not Recommended
  templateUrl: './header.component.html',
  standalone: true, // Set 'false' for module based component
  // styles: ['h1 { color: red}'], Not Recommended
  // styleUrls: ["./header.component.css"] // In case you want to import more than one files
  styleUrl: "./header.component.css"
})
export class HeaderComponent {}
