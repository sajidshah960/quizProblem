# frozen_string_literal: true

require 'csv'
require 'Time'
# {funcs}
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

  def calc_score(data, question_number, answer, score)
    if data[question_number][1] == answer
      score[0] += 1
    else
      score[1] += 1
    end
    score
  end

  def display_welcome
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n>>>>>Welcome to Blitz Quiz<<<<<<<<<<"
    puts ''
    puts 'Do you want to Start Quiz (y/n) ? '
  end

  def timer
    Time.now.to_i
  end
end

class Quiz
  include Utils
end

quiz = Quiz.new
quiz.display_welcome
if gets.chomp == 'y'
  data = quiz.read_file_csv('problems.csv')
  time_remaining = quiz.timer + 30
  question_number = 0
  score = [0, 0]
  data.length.times do
    break if time_remaining < quiz.timer

    puts "Question#{question_number + 1}: #{data[question_number][0]} ?"
    answer = gets.chomp
    score = quiz.calc_score data, question_number, answer, score
    question_number += 1
  end
  puts "\n\nTime Up!!!!!!!!!!!\n\n\n"
  puts "Total Questions : #{data.length}\n\n"
  puts "Total Left : #{data.length - (score[1] + score[0])}\n\n"
  puts "Total Correct   : #{score[0]}\n\n"
  puts "Total Wrong   : #{score[1]}\n\n"

end
