var perStudentPetCount = [0, 1, 0, 2, 1, 1, 4, 0, 0, 0, 3, 2, 1, 3, 0, 2, 2, 4]
var noOfStudents = perStudentPetCount.count

var sum = 0

for individualPerCount in perStudentPetCount {
  sum = sum + individualPerCount
}

print(sum / noOfStudents)
