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

    mov = ""
    compare_hor_ver = @pos_origen & @pos_final

    if !compare_hor_ver.empty?

      mov = true
#binding.pry
    else

      mov = false

    end

    return mov

  end

end

module CheckDiagonal

  def check_diagonal

    mov = ""
    @compare_bishop_position = ((@pos_origen[0] - pos_final[0]).abs) - ((@pos_origen[1] - pos_final[1]).abs)
  
    if @compare_bishop_position == 0

      mov = true

    else

      mov = false

    end

    return mov

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

  def check_move

    mov_king = []
    mov_king[0] = (@pos_origen[0] + 1)
    mov_king[1] = (@pos_origen[1] + 1) 
binding.pry
    if (check_hor_ver == true) && ((mov_king[0] == @pos_final[0]) || (mov_king[1] == @pos_final[1]))

    puts "legal"

    else

    puts "ilegal" 

    end  

  end

end


#torre = Rook.new([7, 3], [7, 1]) #LEGAL
#torre.check_move

#alfil = Bishop.new([8, 4], [4, 8]) #LEGAL
#alfil.check_move

#reina = Queen.new([3, 3], [4, 8]) #iLEGAL
#reina.check_move

rey = King.new([1,1], [2,1])
rey.check_move

