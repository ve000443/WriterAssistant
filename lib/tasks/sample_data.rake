namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_chapters
    make_characters
    make_scenes
    make_relationships
  end

  def make_chapters
    Chapter.create!(number: 1,
                 title: "The first Chapter")
    10.times do |n|
      number  = n+2
      title = "Chapter-#{n+2}"
      Chapter.create!(number: number,
                   title: title)
    end
  end

  def make_characters
    20.times do |n|
      name = Faker::Name.name
      Character.create!(name: name)
    end
  end

  def make_scenes
    Faker::Config.locale = :en
    10.times do |n|
      location = "Paris"
      period = 1999 + n
      content = Faker::Lorem.paragraph
      Scene.create!(location: location, period: period, content: content)
    end
  end

  def make_relationships
    characters = Character.all
    appearing_characters = characters[0..2]
    appearing_characters.each { |char| char.appear!(Scene.find(1)) }
    appearing_characters = characters[0..2]
    appearing_characters.each { |char| char.appear!(Scene.find(3)) }
    appearing_characters = characters[11..20]
    appearing_characters.each { |char| char.appear!(Scene.find(2)) }
  end
end