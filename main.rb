# frozen_string_literal: true

require 'csv'

module Utils
  def readFileCSV(fileName)
    CSV.parse(File.read(fileName), headers: true)
  end

  def printDataCSV(data, length)
    i = 0
    length.times do
      puts "#{data[i][0]},#{data[i][1]}"
      i += 1
    end
  end
end

class QuizInit
  include Utils
end

quiz = QuizInit.new
data = quiz.readFileCSV('problems.csv')
quiz.printDataCSV(data, data.length)
