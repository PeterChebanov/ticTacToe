# frozen_string_literal: true

require_relative 'board'
require_relative 'game_dealler'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @game_dealer = GameDealler.new
    @player_1 = Player.new('x')
    @player_2 = Player.new('y')
  end

  def play
    current_player = @player_1
    puts "Let's the competition begin!\n"
    loop do
       if @board.board_full?
        puts 'No winner in this game detected'
        break

      else
        @board.display
        puts "PLAYER '#{current_player.player_symbol}' turn!"
        player_choice = current_player.choose_cell
        if @game_dealer.check_cell_is_empty?(@board, @game_dealer, player_choice)
          @game_dealer.make_move(@board, player_choice, current_player)
          result = @game_dealer.check_winner(current_player, @board.board_table)
          if result
            @board.display
            break
          end

          current_player = current_player == @player_1 ? @player_2 : @player_1
        else
          puts 'The cell is already used, please choose another cell'
        end
      end
    end
  end
end

game = Game.new
game.play
