require 'pry'

class Board

  def initialize

    @board_temp = Array.new(8) { Array.new(8) }

  end

  def add_piece

    @board_temp[[],[]]

  end


end



class Piece

  attr_reader :pos_origen, :pos_final
  # que es comun a todas las piezas??? 
  def initialize(pos_origen, pos_final)

    @pos_origen = pos_origen
    @pos_final = pos_final

  end


end

module CheckHorVer

  def check_hor_ver

    compare_hor_ver = @pos_origen & @pos_final

    if !compare_hor_ver.empty?

      return true
#binding.pry
    else

      return false

    end

  end

end

module CheckDiagonal

  def check_diagonal

    @compare_bishop_position = ((@pos_origen[0] - pos_final[0]).abs) - ((@pos_origen[1] - pos_final[1]).abs)
  
    if @compare_bishop_position == 0

      return true

    else

      return false

    end

  end

end

module CheckOneMove

  def check_one_move

    mov_king = []
    mov_king[0] = (@pos_origen[0] + 1)
    mov_king[1] = (@pos_origen[1] + 1) 

    if (mov_king[0] == @pos_final[0]) || (mov_king[1] == @pos_final[1])

      return true

    else

      return false

    end

  end

end


class Rook < Piece

  include CheckHorVer

  def check_move

    if check_hor_ver == true

      puts "LEGAL"

    elsif check_hor_ver == false

      puts "ILEGAL"

    end

  end

end


class Bishop < Piece

  include CheckDiagonal

  def check_move

    if check_diagonal == true

      puts "LEGAL"

    elsif check_diagonal == false

      puts "ILEGAL"

    end

  end

end

class Queen < Piece

  include CheckHorVer
  include CheckDiagonal

  def check_move

    if (check_hor_ver == true) || (check_diagonal == true) 

      puts "LEGAL"

    else

      puts "ILEGAL"

  end

end

end

class King < Piece

  include CheckHorVer
  include CheckOneMove

  def check_move

    if (check_hor_ver == true) && (check_one_move == true)

    puts "legal"

    else

    puts "ilegal" 

    end  

  end

end

class Horse < Piece

  def check_move

    hyp = Math.hypot(1, 2)

    arr_horse = []
    arr_horse[0] = @pos_final[0] - @pos_origen[0]
    arr_horse[1] = @pos_final[1] - @pos_origen[1]

    hyp_arr_horse = Math.hypot(arr_horse[0], arr_horse[1])

    if hyp == hyp_arr_horse

      puts "LegaL"

    else

      puts "iLEgaL"

  end

end

end

class Pawn < Piece

  include CheckOneMove

  def check_move

  if check_one_move == true

    puts "Leeeeeegal"

  else

    puts "IIIIIIllegal"

  end

  end

end


#torre = Rook.new([7, 3], [7, 1]) #LEGAL
#torre.check_move

#alfil = Bishop.new([8, 4], [4, 8]) #LEGAL
#alfil.check_move

#reina = Queen.new([3, 3], [4, 8]) #iLEGAL
#reina.check_move

rey = King.new([7,1], [2,1])#ilegal
rey.check_move

caballo = Horse.new([4, 4], [5, 2])#legal
caballo.check_move

peon = Pawn.new([1, 1], [2, 1])
peon.check_move