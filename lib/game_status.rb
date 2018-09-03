# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Top row
  [0,3,6],  # Middle row
  [1,4,7], # Top row
  [2,5,8],  # Middle row
  [0,4,8], # Top row
  [2,4,6]  # Middle row
  # ETC, an array for each win combination
]


def won?(board)
  WIN_COMBINATIONS.detect{|case_set| case_set.all?{|case_i| position_taken?(board, case_i) && board[case_i] == "X"} or case_set.all?{|case_i| position_taken?(board, case_i) && board[case_i] == "O"}}
end

def full?(board)
  board.all?{|case_i| case_i != " " && case_i != nil}
end

def draw?(board)
  full?(board) && !WIN_COMBINATIONS.include?(won?(board))
end

def over?(board)
  WIN_COMBINATIONS.include?(won?(board)) || draw?(board)
end

def winner(board)
  winner = over?(board) ? board[won?(board)[0]] : nil
end
