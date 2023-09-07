# frozen_string_literal: true

class GameDealler
  def check_winner(player, board_table)
    # Horizontal check
    horizontal_check = board_table.any? { |row| row.all? { |col| col == player.player_symbol } }
    if horizontal_check
      declar_winner(player)
      return horizontal_check
    end

    # vertical check
    vertical_check = (0..2).any? { |col| (0..2).all? { |row| board_table[row][col] == player.player_symbol } }
    if vertical_check
      declar_winner(player)
      return vertical_check
    end

    # top left to bottom right check
    top_left_check = (0..2).all? { |i| board_table[i][i] == player.player_symbol }
    if top_left_check
      declar_winner(player)
      return top_left_check
    end

    # top right to bottom left check
    top_right_check = (0..2).all? { |i| board_table[i][2 - i] == player.player_symbol }
    if top_right_check
      declar_winner(player)
      return top_right_check
    end
    false
  end

  def declar_winner(current_player)
    puts 'We have a winner!!'
    puts "It is player who played with #{current_player.player_symbol}"
  end

  def cell_mapping(board, player_choice)
    case player_choice
    when '1'
      board.board_table[0][0]
    when '2'
      board.board_table[0][1]
    when '3'
      board.board_table[0][2]
    when '4'
      board.board_table[1][0]
    when '5'
      board.board_table[1][1]
    when '6'
      board.board_table[1][2]
    when '7'
      board.board_table[2][0]
    when '8'
      board.board_table[2][1]
    when '9'
      board.board_table[2][2]
    else
      puts 'You can not use numbers less then 1 and more then 9'
    end
  end

  def check_cell_is_empty?(board, diller, player_choice)
    diller.cell_mapping(board, player_choice) == ' '
  end

  def make_move(board, player_choice, player)
    case player_choice
    when '1'
      board.board_table[0][0] = player.player_symbol
    when '2'
      board.board_table[0][1] = player.player_symbol
    when '3'
      board.board_table[0][2] = player.player_symbol
    when '4'
      board.board_table[1][0] = player.player_symbol
    when '5'
      board.board_table[1][1] = player.player_symbol
    when '6'
      board.board_table[1][2] = player.player_symbol
    when '7'
      board.board_table[2][0] = player.player_symbol
    when '8'
      board.board_table[2][1] = player.player_symbol
    when '9'
      board.board_table[2][2] = player.player_symbol
    else
      puts 'Something unusual happened'
    end
  end
end
