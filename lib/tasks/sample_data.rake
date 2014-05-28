namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_chapters
    make_characters
    make_scenes
    make_scenes_links
    make_anecdotes
    make_anecdotes_links
    make_relationships
    make_tags
    make_tag_relationships
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

  def make_scenes_links
    scenes = Scene.all
    scenes[0..10].each do |scene|
      scene.chapter_id = 1+rand(10)
      scene.save
    end
  end

  def make_anecdotes
    20.times do |n|
      subject = Faker::Lorem.word
      content = Faker::Lorem.sentence
      Anecdote.create!(subject: subject, content: content)
    end
  end

  def make_anecdotes_links
    anecdotes = Anecdote.all
    anecdotes.each do |anecdote| 
      anecdote.chapter_id = 1 + rand(3)
      anecdote.save
    end
  end

  def make_relationships
    characters = Character.all
    appearing_characters = characters[0..15]
    appearing_characters.each { |char| char.appear!(Scene.find(1+rand(10))) }
    appearing_characters = characters[0..6]
    appearing_characters.each { |char| char.appear!(Scene.find(1+rand(10))) }
    appearing_characters = characters[3..10]
    appearing_characters.each { |char| char.appear!(Scene.find(1+rand(10))) }
  end

  def make_tags
    3.times do |n|
      name = Faker::Lorem.word
      Tag.create!(name: name)
    end
  end

  def make_tag_relationships
    Anecdote.all.each do |anecdote|
      anecdote.tag!(Tag.find(1+rand(2)))
    end
    Anecdote.all.limit(6).each do |anecdote|
      anecdote.tag!(Tag.find(2))
    end
  end
end