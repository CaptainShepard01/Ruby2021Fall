require 'date'

# Variant 1

class Publication
  attr_accessor :id, :topic, :author, :date, :links, :type

  def initialize(id, topic, author, date, links, type)
    @id = id
    @topic = topic
    @author = author
    @date = date
    @links = links
    @type = type
  end

  def to_s
    "Id: #{@id}, Topic: #{@topic}, Author: #{@author}, Date: #{@date}, Links: #{@links}, Type: #{@type}"
  end
end

class ScientificPublication < Publication
  attr_accessor :science_sphere

  def initialize(id, topic, author, date, links, science_sphere)
    super(id, topic, author, date, links, "Science")
    @science_sphere = science_sphere
  end

  def to_s
    super + ", Science sphere: #{@science_sphere}"
  end
end

class GeneralPublication < Publication
  attr_accessor :general_sphere

  def initialize(id, topic, author, date, links, general_sphere)
    super(id, topic, author, date, links, "General")
    @general_sphere = general_sphere
  end

  def to_s
    super + ", General sphere: #{@general_sphere}"
  end
end

class PublicationsArray
  attr_accessor :publications

  def initialize
    @publications = Array.new
  end

  def add_publication(publication)
    @publications.push(publication)
  end

  def alphabet_order
    sorted = publications.sort { |a, b| a.topic <=> b.topic }
    (0..sorted.size).each { |i|
      print "#{sorted[i]}", "\n"
    }
  end

  def find_by_id(id)
    array = Array.new
    @publications.each do |publication|
      array.push(publication) if publication.id == id
    end
    array
  end

  def find_by_topic(topic)
    array = Array.new
    @publications.each do |publication|
      array.push(publication) if publication.topic == topic
    end
    array
  end

  def find_by_author(author)
    array = Array.new
    @publications.each do |publication|
      array.push(publication) if publication.author == author
    end
    array
  end

  def find_by_date(date_from, date_to)
    array = Array.new
    @publications.each do |publication|
      array.push(publication) if date_from <= publication.date && publication.date <= date_to
    end
    array
  end

  def find_by_links(links)
    array = Array.new
    @publications.each do |publication|
      array.push(publication) if (links & publication.links) == links
    end
    array
  end
end

publications = PublicationsArray.new

publications.add_publication(Publication.new(14, "Ruby on Rails", "David Heinemeier Hansson", Date.new(2001, 2, 3), ["Ruby", "Java", "C++"], "Studying"))
publications.add_publication(Publication.new(23, "Physics", "Kant", Date.new(2020, 5, 1), ["Aristotrl", "Berlin"], "History"))
publications.add_publication(ScientificPublication.new(25, "Interpolation", "Merzlyak", Date.new(1999, 6, 2), ["Ariphmetic", "Algebra", "Geometry"], "Math"))
publications.add_publication(GeneralPublication.new(30, "Birds", "Merzlyak", Date.new(2002, 7, 7), ["Animals", "Flying", "Feathers"], "Nature"))
publications.add_publication(ScientificPublication.new(41, "Nature", "Kant", Date.new(2007, 11, 12), ["Airplane", "Moscow", "Java"], "Computer"))

name = "Ruby on Rails"
print("Publications with name #{name}:\n")
publications.find_by_topic(name).each do
|publication|
  print(publication)
  print("\n")
end

author = "Kant"
print("\nPublications with author #{author}:\n")
publications.find_by_author(author).each do
|publication|
  print(publication)
  print("\n")
end

date_from = Date.new(2002, 6, 6)
date_to = Date.new(2007, 12, 12)
print("\nPublications with date between #{date_from} and #{date_to}:\n")
publications.find_by_date(date_from, date_to).each do
|publication|
  print(publication)
  print("\n")
end

links = ["Java"]
print("\nPublications with links #{links}:\n")
publications.find_by_links(links).each do
|publication|
  print(publication)
  print("\n")
end

puts("\nAlphabet order (by topic):")
publications.alphabet_order
