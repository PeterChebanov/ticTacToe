# frozen_string_literal: true

class Player
  attr_accessor :player_symbol

  def initialize(player_symbol)
    @player_symbol = player_symbol
  end

  def choose_cell
    loop do
      puts 'Please enter number from 1 to 9'
      player_choice = gets.chomp.to_s
      return player_choice if (1..9).any? { |figure| figure.to_s == player_choice }
    end
  end
end
