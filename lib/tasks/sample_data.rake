namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    create_instructors
    create_organizations
    create_employees
    Course.create!(:name => "Sample Course")
  end
end

def create_instructors
  instructor = Instructor.create!(:fio => "James First", :email => "james.first@example.org")
  5.times do |n|
    fio = Faker::Name.name
    email = "user-#{n+1}@example.org"
    Instructor.create!(:fio => fio, :email => email)
  end
end

def create_organizations
  organization = Organization.create!(:name => "LUKOIL", :inn => "1234567890")
  5.times do
    name = Faker::Company.name
    inn = (0..9).to_a.shuffle.join
    Organization.create!(:name => name, :inn => inn)
  end
end

def create_employees
  @organizations = Organization.all
  @organizations[1..4].each do |organization|
    4.times do
      organization.employees.create!(:fio => Faker::Name.name)
    end
  end
end

