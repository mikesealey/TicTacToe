require 'colorize'

$board = {
    :index => "",
    :top_left => "1",
    :top_centre => "2",
    :top_right => "3",
    :mid_left => "4",
    :mid_centre => "5",
    :mid_right => "6",
    :bottom_left => "7",
    :bottom_centre => "8",
    :bottom_right => "9",
    :pipe => "|",
    :underscore => "_",
    :overscore => "‾",
}



def check_remaining_tiles(arg)
    $remaining_tiles = 0
    possible_tiles = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    arg.each do |key, value|
        if possible_tiles.include? value
            $remaining_tiles += 1
        end
    end
    puts "check_remaining_tiles(arg) called"
    puts "#{$remaining_tiles} tiles remain."
    return $remaining_tiles
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
    print arg[:pipe], arg[:bottom_left], arg[:pipe], arg[:bottom_centre], arg[:pipe], arg[:bottom_right],  arg[:pipe], "\n"
    #bottom of the board
    7.times do print arg[:overscore] end
        print "\n"

end

def win_condition_met(arg)
    # Top Row Wins
    if arg[:top_left] == arg[:top_centre] && arg[:top_centre] == arg[:top_right]
        puts "Win Condition Met! Top Row Matches"
        puts "#{arg[:top_left]}|#{arg[:top_centre]}|#{arg[:top_right]}".green

        if arg[:top_left] == $player_one.marker
            puts "#{$player_one.name} Wins!".green
        elsif arg[:top_left] == $player_two.marker
            puts "#{$player_two.name} Wins!".green
        end
        return true

    # Mid Row Wins    
    elsif arg[:mid_left] == arg[:mid_centre] && arg[:mid_centre] == arg[:mid_right]
        $win_condition_met = true
        puts "Win Condition Met! Middle Row Matches"
        puts "#{arg[:mid_left]}|#{arg[:mid_centre]}|#{arg[:mid_right]}".green

        if arg[:mid_left] == $player_one.marker
            puts "#{$player_one.name} Wins!".green
        elsif arg[:mid_left] == $player_two.marker
            puts "#{$player_two.name} Wins!".green
        end
        return true

    # Bottom Row Wins
    elsif arg[:bottom_left] == arg[:bottom_centre] && arg[:bottom_centre] == arg[:bottom_right]
        $win_condition_met = true
        puts "Win Condition Met! Bottom Row Matches"
        puts "#{arg[:bottom_left]}|#{arg[:bottom_centre]}|#{arg[:bottom_right]}".green

        if arg[:bottom_left] == $player_one.marker
            puts "#{$player_one.name} Wins!".green
        elsif arg[:bottom_left] == $player_two.marker
            puts "#{$player_two.name} Wins!".green
        end
        return true
        
    # Left Column Wins
    elsif arg[:top_left] == arg[:mid_left] && arg[:mid_left] == arg[:bottom_left]
        $win_condition_met = true
        puts "Win Condition Met! Left Column Matches"
        puts "#{arg[:top_left]}|#{arg[:mid_left]}|#{arg[:bottom_left]}".green

        if arg[:top_left] == $player_one.marker
            puts "#{$player_one.name} Wins!".green
        elsif arg[:top_left] == $player_two.marker
            puts "#{$player_two.name} Wins!".green
        end
        return true
        
    # Centre Column Wins
    elsif arg[:top_centre] == arg[:mid_centre] && arg[:mid_centre] == arg[:bottom_centre]
        $win_condition_met = true
        puts "Win Condition Met! Middle Column Matches"
        puts "#{arg[:top_centre]}|#{arg[:mid_centre]}|#{arg[:bottom_centre]}".green

        if arg[:top_centre] == $player_one.marker
            puts "#{$player_one.name} Wins!".green
        elsif arg[:top_centre] == $player_two.marker
            puts "#{$player_two.name} Wins!".green
        end
        return true


    # Right Column Wins
    elsif arg[:top_right] == arg[:mid_right] && arg[:mid_right] == arg[:bottom_right]
        $win_condition_met = true
        puts "Win Condition Met! Right Column Matches"
        puts "#{arg[:top_right]}|#{arg[:mid_right]}|#{arg[:bottom_right]}".green
        
        if arg[:top_right] == $player_one.marker
            puts "#{$player_one.name} Wins!".green
        elsif arg[:top_right] == $player_two.marker
            puts "#{$player_two.name} Wins!".green
        end
        return true
    # Diagonal from Top Left to Bottom Right Wins
    elsif arg[:top_left] == arg[:mid_centre] && arg[:mid_centre] == arg[:bottom_right]
        $win_condition_met = true
        puts "Win Condition Met! Diagonal From Top Left to Bottom Right Matches!"
        puts "#{arg[:top_left]}|#{arg[:mid_centre]}|#{arg[:bottom_right]}".green
        
        if arg[:top_left] == $player_one.marker
            puts "#{$player_one.name} Wins!".green
        elsif arg[:top_left] == $player_two.marker
            puts "#{$player_two.name} Wins!".green
        end
        return true

    # Diagonal from Botom Left to Top Right Wins
    elsif arg[:bottom_left] == arg[:mid_centre] && arg[:mid_centre] == arg[:top_right]
        $win_condition_met = true
        puts "Win Condition Met! Diagonal from Bottom Left to Top Right Matches"
        puts "#{arg[:bottom_left]}|#{arg[:mid_centre]}|#{arg[:top_right]}".green
        
        if arg[:bottom_left] == $player_one.marker
            puts "#{$player_one.name} Wins!".green
        elsif arg[:bottom_left] == $player_two.marker
            puts "#{$player_two.name} Wins!".green
        end
        return true

    else
        $win_condition_met = false
    end
    
    
end

class Player
    def initialize(name)
        @name = name
        @marker = name[0]
        @tiles = []
    end
    def display_attributes()
        puts name
        puts marker
        puts "tiles claimed #{tiles}"
    end
    attr_reader :marker
    attr_writer :marker
    def name()
        @name
    end
    def tiles()
        @tiles
        @tiles.push
    end
end


def greeting()
    send(:puts, "Welcome to TicTacToe, please enter the name of player 1...") 
    $player_one_name = gets.chomp
    $player_one = Player.new($player_one_name)
    send(:puts, "Welcome #{$player_one.name}.")
    send(:puts, $player_one.display_attributes())
    
    send(:puts, "Please enter the name of player 2.")
    send(:puts, "In the event that both players have the same first initial, default markers O and X will be assigned") ## This doesn't currently work 31st Jan 2023

    $player_two_name = gets.chomp
    $player_two = Player.new($player_two_name)
    send(:puts, $player_two.display_attributes())

    send(:puts, "Welcome #{$player_two.name}.")

    # Not currently working
    # And I don't know why
    if $player_one.marker == $player_two.marker
        $player_one.marker = "X"
        $player_two.marker = "O"
        puts "As both players share the same first initial, #{$player_one.name} will use #{$player_one.marker}, and #{$player_two.name} will use #{$player_two.marker}"
    end

    send(:puts, "Randomly decinding who goes first...")
    $first_turn = rand(2)
    if $first_turn.even?
        send(:puts, "#{$player_one.name} will make the first move!")
        $next_turn_selector = $player_one
    elsif $first_turn.odd?
        send(:puts, "#{$player_two.name} will make the first move!")
        $next_turn_selector = $player_one
    else
        puts "$first_turn was neither odd nor even, someone done goof'd up."
    end
end



def player_one_move()
    puts "#{$player_one.name}, please enter the number of the tile you wish to claim"
    $player_move = gets.chomp
    puts "#{$player_one.name} chose #{$player_move}"
    $board.each do |key, value|
        if $player_move == value
            $board[key] = $player_one.marker   
            $player_one.tiles.push($player_move)
            puts "#{$player_one.name} now owns #{$player_one.tiles}"
        end
    end
end

def player_two_move()
    puts "#{$player_two.name}, please enter the number of the tile you wish to claim"
    $player_move = gets.chomp
    puts "#{$player_two.name} chose #{$player_move}"
    $board.each do |key, value|
        if $player_move == value
            $board[key] = $player_two.marker   
            $player_two.tiles.push($player_move)
            puts "#{$player_two.name} now owns #{$player_two.tiles}"
        end
    end
end

greeting()
show_board($board)





while check_remaining_tiles($board) > 0 && win_condition_met($board) == false
    if $first_turn.even?
        player_one_move()
        $first_turn += 1
    else
        player_two_move()
        $first_turn += 1
    end
    show_board($board)
    check_remaining_tiles($board)
    win_condition_met($board)
end
if check_remaining_tiles($board) == 0 && win_condition_met($board) == false
    puts "Looks like it's a draw..."
end




