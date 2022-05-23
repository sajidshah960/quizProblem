# frozen_string_literal: true

require 'csv'
require 'Time'

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

  def calc_score(data, question_number, answer, current_score)
    current_score += 1 if data[question_number][1] == answer
    current_score
  end

  def display_welcome
    puts ">>>>>Welcome to Blitz Quiz<<<<<<<<<<"
    puts ""
    puts "Do you want to Start Quiz (Y/N) ? "
    puts ""
  end

  def timer
    Time.now.to_i
  end

  def start_quiz

    data =  Utils.read_file_csv("problems.csv")
    question_number = 0
    score = 0
    time_remaining = Utils.timer + 59
    data.length times do
      break if time_remaining != 0
      puts "Question # #{question_number } : #{data[question_number][0]}"
      answer = gets
      #{}score = calc_score (data, question_number, answer, score)
      question_number += 1
      time_remaining = time_remaining - time_now
    end
    puts "Time Up!!!!!!!!!!!"
    puts "Total Questions : #{data.length}"
    puts "Total Correct   : #{score}"
  end
end


class Quiz
  include Utils
  def quiz_init
    Utils.start_quiz
  end
end

quiz = Quiz.new
quiz.quiz_init
# quiz.print_data_csv(data, data.length)

# puts quiz.calc_score(data, 1, '2', 0)


