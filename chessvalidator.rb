require 'pry'

class Board

  def initialize

    @board_temp = Array.new(8) { Array.new(8) }

  end

  def add_piece

    @board_temp[[],[]]

  end


end





class CheckMove



end





class Piece

  attr_reader :pos_origen, :pos_final
  # que es comun a todas las piezas??? 
  def initialize(pos_origen, pos_final)

    @pos_origen = pos_origen
    @pos_final = pos_final

  end


end

class Rook < Piece

  #la torre se mueve como sea jsoijcsidjcci
  def check

    mov = ""
    compare = @pos_origen & @pos_final

    if !compare.empty?

      mov = "LEGAL"
#binding.pry
    else

      mov = "ILEGAL"

    end

    puts mov

  end

end

class Bishop < Piece

  def check 

    mov = ""
    compare = ((@pos_origen[0] - pos_final[0]).abs) - ((@pos_origen[1] - pos_final[1]).abs)
  
    if compare == 0

      mov = "LEGAL"

    else

      mov = "ILEGAL"

    end

    puts mov

  end

end


torre = Rook.new([7, 3], [7, 1])
torre.check


