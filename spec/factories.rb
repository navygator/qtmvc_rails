Factory.define :instructor do |instructor|
  instructor.fio "James First"
  instructor.email "james.first@example.org"
end

Factory.define :course do |course|
  course.name "Sample Course"
end

Factory.define :group do |group|
  group.name "Sample Group"
  group.association :instructor
  group.association :course
end

Factory.define :organization do |organization|
  organization.name "RZD"
  organization.inn "1234567890"
  organization.association :instructor
end

Factory.define :employee do |employee|
  employee.fio "Example Employee"
  employee.association :organization
end