import { Injectable } from '@angular/core';
import { Issue } from './types';

@Injectable({
  providedIn: 'root',
})
export class IssuesService {
  issues: Issue[] = [];

  constructor() {
    this.issues = JSON.parse(localStorage.getItem('issues') ?? '[]') as Issue[];
  }

  addItem(issue: Issue) {
    this.issues.push(issue);
    localStorage.setItem('issues', JSON.stringify(this.issues));
  }
}
