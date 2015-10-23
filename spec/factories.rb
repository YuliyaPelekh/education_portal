FactoryGirl.define do 
  factory :user do |f|
    f.first_name "John"
    f.last_name "Dou"
    f.email 'john.dou@email.com'
    f.password 'kukuku'
    f.role nil
  end 

  factory :invalid_user, parent: :user do |f|
    f.email nil 
  end
   
  factory :admin, parent: :user do |f|
    f.role 'admin'
  end 

  factory :editor, parent: :user do |f|
    f.role 'editor'
  end 

  factory :news do |f|
    f.title 'Rainbow'
    f.text 'Huguguguguguguugugugug'
  end 

  factory :invalid_news, parent: :news do |f|
    f.text nil 
  end
end 