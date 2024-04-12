import { MatTableModule } from '@angular/material/table';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { Component } from '@angular/core';
import { Issue, IssueType, IssuePriority } from '../types';
import { RouterLink, RouterOutlet } from '@angular/router';
import { MatToolbar } from '@angular/material/toolbar';
import { IssuesService } from '../issues.service';

@Component({
  selector: 'app-issues-table',
  standalone: true,
  imports: [
    MatTableModule,
    MatIconModule,
    MatButtonModule,
    RouterLink,
    RouterOutlet,
    MatToolbar,
  ],
  templateUrl: './issues-table.component.html',
  styleUrl: './issues-table.component.scss',
})
export class IssuesTableComponent {
  displayedColumns: string[] = [
    'issueNo',
    'type',
    'title',
    'description',
    'priority',
  ];
  issues = [] as Issue[];

  constructor(private issuesService: IssuesService) {}

  getIssues() {
    this.issues = this.issuesService.issues;
  }

  ngOnInit() {
    this.getIssues();
  }
}
