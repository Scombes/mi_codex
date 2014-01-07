namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    

  admin = User.create!(name: "Scott Combes",
                       email: "scott.combes@gmail.com",
                       password: "foobar",
                       password_confirmation: "foobar",
                       admin: true)
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@rscooterdesignstudio.com"
    password = "foobar"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
    end


      users = User.all(limit: 6)
    50.times do |n|
      title = Faker::Name.name
      author = Faker::Name.name
      publisher= "Penguin"
      copyright= "2012"
      genre = "Test"
      isbn =  "123456789bnfg"
      users.each { |user| user.books.create!(title: title,
                                             author: author,
                                             publisher: publisher,
                                             copyright: copyright,
                                             genre: genre,
                                             isbn: isbn ) }

    end
  end
end
