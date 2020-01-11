## Classes should be open for extension but closed for modification.
class User
  def initialize(name:, email:, format:)
    @name = name
    @email = email
    @format = format
  end

  def info
    case @format
    when :simple
      puts "#{@name} <#{@email}>"
    when :fancy
      puts "Name: #{@name}\nEmail: #{@email}"
    else
      raise NotImplementedError
    end
    puts "-" * 70
  end
end

user = User.new(name: "Cezar", email: "cezar@mixandgo.com", format: :simple)
user.info
user = User.new(name: "Cezar", email: "cezar@mixandgo.com", format: :fancy)
user.info

###############################################################################

class Human
  attr_reader :name, :email

  def initialize(name:, email:, formatter:)
    @name = name
    @email = email
    @formatter = formatter
  end

  def info
    @formatter.format(self)
  end
end

class SimpleFormatter
  def format(human)
    puts "#{human.name} <#{human.email}>"
    puts "-" * 70
  end
end

class FancyFormatter
  def initialize
    @meta = "Born in '79"
  end

  def format(human)
    puts "Name: #{human.name}\nEmail: #{human.email}\n#{@meta}"
    puts "-" * 70
  end
end

simple_formatter = SimpleFormatter.new
fancy_formatter = FancyFormatter.new
human = Human.new(name: "Cezar", email: "cezar@mixandgo.com", formatter: simple_formatter)
human.info

human = Human.new(name: "Cezar", email: "cezar@mixandgo.com", formatter: fancy_formatter)
human.info
