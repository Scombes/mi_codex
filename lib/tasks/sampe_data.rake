namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_books
    
  end
end

def make_users
  admin = User.create!(name: "Example User",
                       email: "example@scooterdesignstudio.com",
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
end

def make_books

      users = User.all(limit: 6)
        50.times do |n|
        title = "Sample Book-#{n+1}"
        author = "Bland Name#{n+1}"
        publisher = "Penguin"
        copyright = "2012"
        isbn= "123BN45623456"
        users.each { |user| user.books.create!( title: title,
                                                author: author,
                                                publisher: publisher,
                                                copyright: copyright,
                                                isbn: isbn)}
  end
end