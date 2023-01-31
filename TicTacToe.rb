$board = {
    :index => "", #
    :top_left => "1",
    :top_centre => "2",
    :top_right => "3",
    :mid_left => "4",
    :mid_centre => "5",
    :mid_right => "6",
    :botton_left => "7",
    :bottom_centre => "8",
    :bottom_right => "9",
    :pipe => "|",
    :underscore => "_",
    :overscore => "‾",

}

$remaining_tiles = 0

$board.each do |key, value|
    unless value.to_f.nan?
        $remaining_tiles += 1
    end
end

def show_board(arg)
    #Top of the board
    print "\n"
    7.times do print arg[:underscore] end
    print "\n"

    #Top row
    print arg[:pipe], arg[:top_left], arg[:pipe], arg[:top_centre], arg[:pipe], arg[:top_right], arg[:pipe], "\n"
    #Mid row
    print arg[:pipe], arg[:mid_left], arg[:pipe], arg[:mid_centre], arg[:pipe], arg[:mid_right], arg[:pipe], "\n"
    #Bottom Row
    print arg[:pipe], arg[:botton_left], arg[:pipe], arg[:bottom_centre], arg[:pipe], arg[:bottom_right],  arg[:pipe], "\n"
    #bottom of the board
    7.times do print arg[:overscore] end
        print "\n"

end

class Player
    def initialize(name)
        @name = name
        @marker = name[0]
        tiles = []
    end
    def display_attributes()
        puts name
        puts marker
        puts "tiles claimed #{tiles}"
    end
    def name
        @name
    end
    def marker()
        @marker
    end
end


def greeting()
    send(:puts, "Welcome to TicTacToe, please enter the name of player 1...") 
    @player_one_name = gets.chomp
    @player_one = Player.new(@player_one_name)
    send(:puts, "Welcome #{@player_one.name}.")
    
    send(:puts, "Please enter the name of player 2.")
    send(:puts, "In the event that both players have the same first marker, defaults markers O and X will be assigned") ## This doesn't currently work 31st Jan 2023

    @player_two_name = gets.chomp
    @player_two = Player.new(@player_two_name)

    send(:puts, "Welcome #{@player_two.name}.")

    if @player_one.marker == @player_two.marker
        @player_one.marker = "X"
        @player_two.marker = "O"
        puts "As both players share the same first initial, #{@player_one.name} will use #{@player_one.marker}, and #{@player_two.name} will use #{@player_two.marker}"
    end

    send(:puts, "Randomly decinding who goes first...")
    @first_turn = rand().round()
    if @first_turn == 0
        send(:puts, "#{@player_one.name} will make the first move!")
        $next_turn_selector = @player_one
    else
        send(:puts, "#{@player_two.name} will make the first move!")

    end
end

def make_move(player)
    puts "#{player.name}, please enter the number of the tile you wish to claim"
    $player_move = gets.chomp
    $board.each do |key, value|
        if $player_move == value
            $board[key] = player.marker            
        end
    end
end





greeting()
show_board($board)

#until win condition met, or no space left available
win_condition_met = false # No win conditions are currently set 31st Jan 2023


while win_condition_met == false || $remaining_tiles > 0
    make_move(@player_one)
    show_board($board)
    make_move(@player_two)
    show_board($board)
end





