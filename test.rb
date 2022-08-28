# 3) Write a function that takes in an array of numbers and returns a new array with the numbers in reverse order.
# input = [1, 2, 3]
# output = [3, 2, 1]

def reverse_array(array)
  index = array.length - 1
  new_array = []
  while index >= 0
    new_array << array[index]
    index -= 1
  end
  return new_array
end

# p reverse_array([1, 2, 3])

# 6) Write a function that takes in an array of numbers and returns the product of all the numbers (each number multiplied by each other).
input = [3, 7, 4, 2]
output = 168

def product(array)
  index = 0
  answer = 1
  while index < array.length
    answer = array[index] * answer
    index += 1
  end
  answer
end

# p product([3, 7, 4, 2])

# 8) Write a function that takes in an array of numbers and returns a count of how many zeros are in the array.
input = [0, 1, 2, 0]
output = 2

def zeros(array)
  count = 0
  index = 0
  while index < array.length
    if array[index] == 0
      count = count + 1
    end
    index += 1
  end
  return count
end

# p zeros([0, 1, 2, 0])

# Write a function that accepts a string and returns whether it’s a palindrome.
input = "racecar"
output = true

input = "onomatopeia"
output = false

def palindrome(string)
  array = string.split("")
  backwards_array = reverse_array(array)
  if array == backwards_array
    return true
  else
    return false
  end
end

# p palindrome("onomatopeia")

class Tictactoe
  def initialize
    @board = [
      ["-", "-", "-"],
      ["-", "-", "-"],
      ["-", "-", "-"],
    ]
  end

  def print_board
    index = 0
    while index < @board.length
      p_board = ""
      index2 = 0
      while index2 < @board[index].length
        p_board = p_board + @board[index][index2]
        index2 += 1
      end
      puts p_board
      index += 1
    end
  end

  def x_turn
    turn_done = false
    while turn_done == false
      puts "Player 1's turn. Enter which row you want to place your X (1, 2, or 3):"
      row = gets.chomp
      puts "Player 1, now enter which column you want to place your X (1, 2, or 3):"
      column = gets.chomp
      if @board[row.to_i - 1][column.to_i - 1] == "-"
        @board[row.to_i - 1][column.to_i - 1] = "X"
        turn_done = true
      else
        puts "Invalid space. Try again."
      end
    end
    print_board
  end

  def o_turn
    turn_done = false
    while turn_done == false
      puts "Player 2's turn. Enter which row you want to place your O (1, 2, or 3):"
      row = gets.chomp
      puts "Player 2, now enter which column you want to place your O (1, 2, or 3):"
      column = gets.chomp
      if @board[row.to_i - 1][column.to_i - 1] == "-"
        @board[row.to_i - 1][column.to_i - 1] = "O"
        turn_done = true
      else
        puts "Invalid space. Try again."
      end
    end
    print_board
  end

  def check_for_x_victory
    if (@board[0][0] == "X" && @board[0][1] == "X" && @board[0][2] == "X") || (@board[1][0] == "X" && @board[1][1] == "X" && @board[1][2] == "X") || (@board[2][0] == "X" && @board[2][1] == "X" && @board[2][2] == "X") || (@board[0][0] == "X" && @board[1][0] == "X" && @board[2][0] == "X") || (@board[0][1] == "X" && @board[1][1] == "X" && @board[2][1] == "X") || (@board[0][2] == "X" && @board[1][2] == "X" && @board[2][2] == "X") || (@board[0][0] == "X" && @board[1][1] == "X" && @board[2][2] == "X") || (@board[2][0] == "X" && @board[1][1] == "X" && @board[0][2] == "X")
      return true
    else
      return false
    end
  end

  def check_for_o_victory
    if (@board[0][0] == "O" && @board[0][1] == "O" && @board[0][2] == "O") || (@board[1][0] == "O" && @board[1][1] == "O" && @board[1][2] == "O") || (@board[2][0] == "O" && @board[2][1] == "O" && @board[2][2] == "O") || (@board[0][0] == "O" && @board[1][0] == "O" && @board[2][0] == "O") || (@board[0][1] == "O" && @board[1][1] == "O" && @board[2][1] == "O") || (@board[0][2] == "O" && @board[1][2] == "O" && @board[2][2] == "O") || (@board[0][0] == "O" && @board[1][1] == "O" && @board[2][2] == "O") || (@board[2][0] == "O" && @board[1][1] == "O" && @board[0][2] == "O")
      return true
    else
      return false
    end
  end

  def check_for_tie
    index = 0
    tie = true
    while index < @board.length
      index2 = 0
      while index2 < @board[index].length
        if @board[index][index2] == "-"
          tie = false
          break
        end
        index2 += 1
      end
      index += 1
    end
    return tie
  end

  def play
    while check_for_x_victory == false && check_for_o_victory == false && check_for_tie == false
      x_turn
      if check_for_tie == true || check_for_x_victory == true || check_for_o_victory == true
        break
      end

      o_turn
      if check_for_tie == true || check_for_x_victory == true || check_for_o_victory == true
        break
      end
    end

    if check_for_x_victory == true
      puts "Player 1 Wins!"
    elsif check_for_o_victory == true
      puts "Player 2 Wins!"
    elsif check_for_tie == true
      puts "It's a tie game."
    end
  end
end

# game = Tictactoe.new
# game.print_board
# game.play

# 8.  Write a function that takes in an array of numbers, where every number shows up twice except for one, and returns the number that only shows up once.
input = [1, 1, 2, 2, 3, 4, 4]
output = 3
# first sort the array

def one_number(array)
  array.sort!
  index = 0
  while index < array.length
    if array[index] != array[index + 1]
      return array[index]
    end
    index += 2
  end
end

# p one_number([3, 1, 5, 5, 3, 1, 2])
