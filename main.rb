# frozen_string_literal: true

require 'csv'

# {used to }
module Utils
  def read_file_csv(file_name)
    CSV.parse(File.read(file_name), headers: true)
  end

  def print_data_csv(data, length)
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
data = quiz.read_file_csv('problems.csv')
quiz.print_data_csv(data, data.length)
