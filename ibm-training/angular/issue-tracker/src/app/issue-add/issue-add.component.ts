import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatInputModule } from '@angular/material/input';
import { MatRadioModule } from '@angular/material/radio';
import { MatSelectModule } from '@angular/material/select';
import { Issue, IssuePriority, IssueType } from '../types';
import { Location } from '@angular/common';
import { v4 as UUID } from 'uuid';
import { IssuesService } from '../issues.service';

@Component({
  selector: 'app-issue-add',
  standalone: true,
  imports: [
    FormsModule,
    MatToolbarModule,
    MatButtonModule,
    MatIconModule,
    MatFormFieldModule,
    MatInputModule,
    MatRadioModule,
    MatSelectModule,
  ],
  templateUrl: './issue-add.component.html',
  styleUrl: './issue-add.component.scss',
})
export class IssueAddComponent {
  issueNo = UUID();
  title: string | null = null;
  description: string | null = null;
  priority: IssuePriority | null = null;
  type: IssueType | null = null;
  issues = [
    { value: IssueType.Feature, viewValue: 'Feature' },
    { value: IssueType.Bug, viewValue: 'Bug' },
    { value: IssueType.Documentation, viewValue: 'Documentation' },
  ];

  constructor(
    private _location: Location,
    private issuesService: IssuesService
  ) {}

  submit() {
    if (this.title == null || this.title.trim() === '') {
      alert('Missing Title');
      return;
    }
    if (this.description == null || this.description.trim() === '') {
      alert('Missing Description');
      return;
    }
    if (this.priority == null) {
      alert('Select a Priority');
      return;
    }
    if (this.type == null) {
      alert('Select a Issue Type');
      return;
    }

    const item = {
      issueNo: this.issueNo,
      title: this.title,
      description: this.description,
      priority: this.priority,
      type: this.type,
    } as Issue;

    console.debug('Adding Item: ', item);
    this.issuesService.addItem(item);
    this.goBack();
  }

  goBack() {
    this._location.back();
  }

  clearFields() {
    this.title = null;
    this.description = null;
    this.type = null;
    this.priority = null;
  }
}
