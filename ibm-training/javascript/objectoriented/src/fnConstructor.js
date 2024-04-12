function Person(firstName, lastName, age) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.age = age;
  this.adultAge = 18;

  let isAdult = () => this.age >= this.adultAge;

  this.isEligibleforVoting = () => this.isAdult();

  this.fullName = function () {
    return `${this.firstName} ${this.lastName}`;
  };
}

const personExample = new Person("John", "Doe", 25);

console.log(personExample.fullName(), personExample.isEligibleforVoting());

function Student() {

  this.enrolledCourse = [];
  this.enroll = (course) => this.enrolledCourse.push(course);
  this.enrolledCourses = () =>
    this.enrolledCourse.map((course) => course.courseName).join(", ");

}
