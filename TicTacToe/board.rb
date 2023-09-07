# frozen_string_literal: true

class Board
  attr_accessor :board_table

  def initialize
    @board_table = Array.new(3) { Array.new(3, ' ') }
  end

  def display
    puts "| #{@board_table[0][0]} | #{@board_table[0][1]} | #{@board_table[0][2]} |"
    puts "| #{@board_table[1][0]} | #{@board_table[1][1]} | #{@board_table[1][2]} |"
    puts "| #{@board_table[2][0]} | #{@board_table[2][1]} | #{@board_table[2][2]} |"
  end

  def board_full?
    @board_table.all? { |row| row.all? { |col| col != ' ' } }
  end
end
