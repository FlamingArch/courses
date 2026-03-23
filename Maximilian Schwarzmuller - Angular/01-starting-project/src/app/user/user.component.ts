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
  // private selectedUser = DUMMY_USERS[randomIndex] // Private property is not available for use in the template
  selectedUser = DUMMY_USERS[randomIndex];

  get imagePath() {
    return 'assets/users/' + this.selectedUser.avatar;
  }

  onSelectUser() {
    console.log('Clicked!');
  }
}
