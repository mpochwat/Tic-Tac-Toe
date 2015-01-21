# Class - Player(2) - human players(instances of class)
# Class - Board
# Check for victory <- method (if horizontal, vertical, diagonal)
# Class - Chips (can be X or O)
# Loop

class Player
	def initialize(name, type)
		@name = name
		@type = type
	end
end

class Board
	attr_accessor :player1, :player2

	def initialize(player1, player2)
		@player1 = Player.new(player1, 'X')
		@player2 = Player.new(player2, 'O')
		@board = [[0,1,2],[3,4,5],[6,7,8]]
	end

	def show_board
		@board.each { |row| p row }
	end

	def go(player, token)
		puts "#{player} choose a spot on the board by typing in its number:"
		ans = gets.chomp.to_i
		@board.each do |row|
			row.include?(ans)
			row.map! { |x| x == ans ? token : x }
		end
	end

	def victory?
		check_rows || check_columns || check_diagonals
	end

	def check_columns
		col1_x = @board.all? { |row| row[0] == 'X' }
		col2_x = @board.all? { |row| row[1] == 'X' }
		col3_x = @board.all? { |row| row[2] == 'X' }
		col1_o = @board.all? { |row| row[0] == 'O' }
		col2_o = @board.all? { |row| row[1] == 'O' }
		col3_o = @board.all? { |row| row[2] == 'O' }		
		col1_x || col2_x || col3_x || col1_o || col2_o || col3_o
	end

	def check_rows
		@board.any? do |row|
			(row == ['X','X','X']) || (row == ['O','O','O'])
		end
	end

	def check_diagonals
		diag1_x = @board[0][0] == 'X' && @board[1][1] == 'X' && @board[2][2] == 'X'
		diag1_o = @board[0][0] == 'O' && @board[1][1] == 'O' && @board[2][2] == 'O'
		diag2_x = @board[0][2] == 'X' && @board[1][1] == 'X' && @board[2][0] == 'X'
		diag2_o = @board[0][2] == 'O' && @board[1][1] == 'O' && @board[2][0] == 'O'		
		diag1_x || diag1_o || diag2_x || diag2_o
	end
end

victory = false

puts "Enter name of player 1:"
player1 = gets.chomp.to_s
puts "Enter name of player 2:"
player2 = gets.chomp.to_s

player = ['player2','player1','player2','player1','player2','player1','player2','player1','player2','player1']
token = ['O','X','O','X','O','X','O','X','O','X']

game = Board.new(player1, player2)

while !victory
	game.show_board
	game.go(player.pop, token.pop)
	game.show_board
	victory = game.victory?	
end

puts "Good game!"