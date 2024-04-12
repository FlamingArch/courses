import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { MatToolbar } from '@angular/material/toolbar';
import { IssuesTableComponent } from './issues-table/issues-table.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, IssuesTableComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
})
export class AppComponent {
  title = 'issue-tracker';
}
