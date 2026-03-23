import { Component } from '@angular/core';
import { DUMMY_USERS } from '../dummy-users';

// Pick a random user index
const randomIndex = Math.floor(Math.random() * DUMMY_USERS.length);

@Component({
  selector: 'app-user',
  standalone: true,
  templateUrl: './user.component.html',
  styleUrl: './user.component.css',
})
export class UserComponent {
  // Private property is not available for use in the template
  // private selectedUser = DUMMY_USERS[randomIndex] /
  selectedUser = DUMMY_USERS[randomIndex];

  get imagePath() {
    return 'assets/users/' + this.selectedUser.avatar;
  }

  onSelectUser() {
    // Regenerating, as the global one is only ran once and doesnt change
    const randomIndex = Math.floor(Math.random() * DUMMY_USERS.length); 
    this.selectedUser = DUMMY_USERS[randomIndex];
  }
}
