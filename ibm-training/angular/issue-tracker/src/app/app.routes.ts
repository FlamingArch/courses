import { Routes } from '@angular/router';
import { IssuesTableComponent } from './issues-table/issues-table.component';
import { IssueAddComponent } from './issue-add/issue-add.component';

export const routes: Routes = [
  { path: '', component: IssuesTableComponent },
  { path: 'add', component: IssueAddComponent },
];
