FactoryGirl.define do
  factory :user do
    username "username"
    password "password"
  end

  factory :question do
    title "some title"
    body "some body content"
  end

  factory :answer do
    text "some answer text"
  end

  factory :category do
    text "some category text"
  end

  factory :comment do
    text "some comment text"
  end
end
