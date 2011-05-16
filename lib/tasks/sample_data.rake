require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:first_name => "Foo",
                         :last_name => "Bar",
                         :email => "foo@mail.com",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      first_name = Faker::Name.name.split[0]
      last_name = Faker::Name.name.split[1]
      email = "example-#{n + 1}@mail.com"
      password = "password"
      User.create!(:first_name => first_name,
                   :last_name => last_name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end

