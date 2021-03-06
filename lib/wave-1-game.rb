require_relative 'scoring'

module Scrabble
  class Game
    def initialize
      @words = []
    end

    def play
      start

      print_score(get_word) while continue?

      conclude
    end

    private

    def start
      puts 'Welcome to our Scrabble game!'
    end

    def continue?
      return true if @words.empty? # haven't started playing yet

      puts 'Would you like to score another word? (Y/N)'
      continue = gets.chomp
      continue == 'Y' ? true : false
    end

    def get_word
      puts 'Enter a word to score:'
      word = gets.chomp
      @words << word
      word
    end

    def print_score(word)
      result = Scrabble::Scoring.score(word)
      puts "The score of #{word} is #{result}"
    end

    def conclude
      highest_word = Scrabble::Scoring.highest_score_from(@words)
      puts "The final highest scoring word is #{highest_word}"
    end
  end
end

game = Scrabble::Game.new
game.play
