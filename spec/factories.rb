FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
    	admin true
    end
  end

  factory :book do
  	title	"Test Book"
  	author	"Scott Combes"
  	publisher	"Peneguin"
  	copyright	"2012"
  	genre	"Sci-Fi"
  	isbn	"123BN1223ddxd"
  	user
  end
end
