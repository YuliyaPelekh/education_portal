include ActionDispatch::TestProcess

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

  factory :image do |f|
    f.name 'Adventure'
    f.avatar { fixture_file_upload(File.new(Rails.root + 'spec/fixtures/images/images.jpeg')) }
    f.news_id 1
  end 

  factory :invalid_image, parent: :image do |f|
    f.avatar nil
  end 

  factory :album do |f|
    f.title 'Rainbow'
    f.description nil
  end 

  factory :invalid_album, parent: :album do |f|
    f.title nil 
  end

  factory :picture do |f|
    f.avatar { fixture_file_upload(File.new(Rails.root + 'spec/fixtures/images/images.jpeg')) }
    f.album_id 1
  end 

  factory :invalid_picture, parent: :picture do |f|
    f.avatar nil
  end

  factory :schedule do |f|
    f.timetable_id 1
    f.hours Time.new(2000,1,1,20,30,0).strftime("%H:%M")
    f.group 'group 1'
    f.lesson 'painting'
  end 

  factory :invalid_schedule, parent: :schedule do |f|
    f.group nil
  end 

  factory :timetable do |f|
    f.day 'monday'
  end
end 