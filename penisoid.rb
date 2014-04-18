class Penisoid
  def initialize
    @open_q = ["where","when","who","why"]
    @closed_q = ["is","are","am","do","does","will","can","could","should","shall"]
    @closed_a = ["Yes","No","Absolutely","Not really.."]

    @where = ["in the garden","home","at school"]
    @when = []
    @who = []
    @why = []

  end

  def where
    
    @closed_q.each do |item|
 index = @split.index(item)
 if index
   return "#{@split[index + 1].capitalize} #{@split[index]} #{@where.sample}.".capitalize
 end
end
    
   return "#{@split[@split.index("is")]}"
    

  end

  def generate_open
    
    if @split.include? "you" or @split.include? "i"
      return "That's not why we are here, is it?"
    end
    
    if @split.include? "where"
      return where
    end
  end

  def generate_closed
    if @split.include?("dan") and @split.include?("gay")
      return "You are kidding me, right?"
    else
    return @closed_a.sample
    end

  end

  def read

    if !@input.include? "?"
      return "This is not a question. Ok this is awkward.. Ugh I have to tell you.. You are stupid."
    end

    got = @input.slice!(0..-2)

    @split = got.split(' ')

    if !@split[1]
      return "This isn't even a sentence. Who's your teacher? (Don't answer please)"
    end

    if !@split[2]
      return "Actually, this is not a sentence. Contacting your teacher."
    end

    if @split.detect{ |e| @split.count(e) > 1 }
      return "This doesn't really make any sense to me.."
    end

    if @open_q.include? @split[0]
      return generate_open
    end

    if @closed_q.include? @split[0]
      generate_closed
    end

  end

  def run
    puts "Welcome to Penisoid Alpha!"
    while true
      puts "Type any question to start..."
      @input = gets.chomp.downcase
      case @input
      when "exit"
        break
      else

      puts read

      end
    end
  end
end

penisoid = Penisoid.new
penisoid.run
