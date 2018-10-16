require 'colorize'
require "./player"
require "./board"

class Game

  def initialize

    p "What is the name of Player 1 ?"
    name_player_1 = gets.chomp
    p "#{name_player_1} You got the mark X"
    player_color_1 = "X"
    @player_1 = Player.new(name_player_1, player_color_1)
    p "What is the name of Player 2 ?"
    name_player_2 = gets.chomp
    p "#{name_player_2} You got the mark O"
    player_color_2 = "O"
    @player_2 = Player.new(name_player_2, player_color_2)
    @players = [@player_1, @player_2]
    @object_board = Board.new

  end

  def go

    puts "=======> How to play ? <============="
    puts
    puts "You have to choose one of theses ".green
    puts "numbers to place your mark,for win you
    have to do a vertical,horizontal or
    diagonal line".green


    puts "====================================="
    puts "       Are you Ready ???     ".red
    puts "Let's go for the Tic-Tac-Toe Game !".red
    puts "=====================================\n\n"


    self.turn
  end

  def turn

    turns = 0
    while @object_board.victory? == false do # Ici, on dit que tant que les conditions de la victoire
      @players.each{ |player| # ne sont pas atteintes, on fait une itération sur chaque joueur placé
                              # dans l'array @players
        @object_board.display_board #On affiche le tableau

        p "================= TOUR #{turns + 1} =================" #On affiche le tour
        p "#{player.name} ! Where do you want to insert your mark ?"   #On demande une case à l'utilisateur
        p "Give me a number between 1 and 9 :"
        n = gets.chomp.to_i   #On enregistre la case dans la variable n
         # On lui retire 1 pour qu'elle correspondent à un index
          until n > 0 && n < 10
            puts "Please give a right number"
            puts "Choose a new number:"
            n = gets.chomp.to_i
          end
          n = n - 1
        @info_player = [player.name, player.player_color, n]
        @object_board.play(@info_player)
        if @object_board.victory?
          @object_board.display_board
          puts "\n============================================="
          puts "    Congratulations #{player.name},you win !     "
          puts "============================================="
          puts "Do you want to play again ? (Y or N)"
          answer = gets.chomp
          if answer == "Y"
            Game.new.go
          else
            puts "Bye !"
          end
          break # on sort de la boucle each si c'est le joueur a gagné.
        end
      turns += 1 # On incrémente turns ici
      if turns == 9 # on sort de la boucle each si turns arrive à 9 et on annonce le draw.
        @object_board.display_board
        puts "============================================="
        puts "            It's a draw :(             "
        puts "=============================================\n\n"
        puts "Do you want to play again ? (Y or N)"
        answer = gets.chomp
        if answer == "y"
          Game.new.go
        else
          puts "Bye and hope we will see you again !"
        end
        break
      end
      }
    end #Fin de While loop
  end
end

Game.new.go
