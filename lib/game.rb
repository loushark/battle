class Game

  attr_reader :player1, :player2, :current_player, :previous_player

  def initialize(player1, player2)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @current_player = @player1
    @previous_player = @player2
  end

  def attack(player)
    player.reduce
    switch_turns
    switch_attacked_player
  end

  def switch_turns
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  def switch_attacked_player
    @previous_player == @player2 ? @previous_player = @player1 : @previous_player = @player2
  end

  def hitpoints_zero?(player)
    player.hitpoints == 10
  end

end
