function Student(firstName, lastName){
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];
};

function Course(courseName, department, credits){
  this.courseName = courseName;
  this.department = department;
  this.credits = credits;
  this.students = [];
}

Student.prototype.name = function() {
  console.log(`${this.firstName} ${this.lastName}`);
};

Student.prototype.enroll = function(course){
  if (!this.courses.includes(course)){
    this.courses.push(course);
    course.students.push(this);
  }
};

Student.prototype.courseLoad = function(){
  let load = {
    
  }

}
