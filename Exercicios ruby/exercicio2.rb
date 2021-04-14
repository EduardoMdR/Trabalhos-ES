# Rock Paper Scissors
# [["Kristen", "P"], ["Pam", "S"]]
# => retorna a lista ["Pam", "S"] vitórias, pois S > P

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  # allowed_strategies = ["r", "p", "s"]
  player1 = game[0][1].downcase
  player2 = game[1][1].downcase
  # raise NoSuchStrategyError unless allowed_strategies.include?(player1)
  # raise NoSuchStrategyError unless allowed_strategies.include?(player2)

  if player1 == player2
    return "empate"
  end
  case [player1,player2]
    when ['r', 's'], ['p', 'r'], ['s', 'p'] 
      return game[0]
    else
      return game[1]
  end
end

game = [["Kristen", "R"], ["Pam", "T"]]
puts "#{rps_game_winner(game)}"