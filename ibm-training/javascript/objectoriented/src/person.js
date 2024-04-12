let Person = {
  firstName: "",
  lastName: "",
  age: 0,
  fullName() {
    return `${this.firstName} ${this.lastName}`;
  },
};

let Student = {
  enrolledCourse: [],
  enroll(course) {
    this.enrolledCourse.push(course);
  },
  get enrolledCourses() {
    return this.enrolledCourse.map((course) => course.courseName).join(", ");
  },
};

Object.setPrototypeOf(Student, Person);

let john = { firstName: "John", lastName: "Doe", age: 25 };
Object.setPrototypeOf(john, Student);

john.enroll({ courseName: "Math" });
john.enroll({ courseName: "Science" });

console.log(
  `Student: ${john.fullName()} is enrolled in ${john.enrolledCourses} courses.`
);
