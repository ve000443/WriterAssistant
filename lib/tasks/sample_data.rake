namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Chapter.create!(number: 1,
                 title: "The first Chapter")
    10.times do |n|
      number  = n+2
      title = "Chapter-#{n+2}"
      Chapter.create!(number: number,
                   title: title)
    end
  end
end