export enum IssueType {
  Feature = 'Feature',
  Bug = 'Bug',
  Documentation = 'Documentation',
}

export enum IssuePriority {
  Low = 1,
  High = 2,
}

export interface Issue {
  issueNo: number | string;
  type: IssueType;
  title: string;
  description: string;
  priority: IssuePriority;
}
