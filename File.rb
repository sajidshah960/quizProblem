# frozen_string_literal: true

class File
  def initialize(sajidddd)
    @sajid = sajidddd
  end

  def printIt
    puts 'Hello Ruby!'
  end
end

# Now using above class to create objects
object = File.new('sajid')
object.printIt
