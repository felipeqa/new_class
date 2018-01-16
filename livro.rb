require 'pry'
#Modelo que permite getters e setters para todos os atributos

# class Livro
#    attr_accessor :titulo, :preco, :ano_lancamento
# end
#
# livro_rails = Livro.new
# livro_rails.preco = 70.00
# livro_rails.titulo = "Agile Web Development with Rails"
# livro_rails.ano_lancamento = 2011
#
# livro_ruby = Livro.new
# livro_ruby.preco = 60.00
# livro_ruby.titulo = "Programming Ruby 1.9"
# livro_ruby.ano_lancamento = 2010
#
# livros = [livro_rails, livro_ruby]
#
# def imprime_nota_fiscal(livros)
#   livros.each do |livro|
#     livro.preco = 1.00
#     puts "Titulo: #{livro.titulo} - #{livro.preco}"
#   end
# end
#
# imprime_nota_fiscal(livros)



# class Livro
#   attr_reader :titulo, :preco, :ano_lancamento
#   def initialize(titulo, preco, ano_lancamento)
#     @titulo = titulo
#     @preco = preco
#     @ano_lancamento = ano_lancamento
#   end
# end

# class Livro
#     attr_reader :titulo, :ano_lancamento
#     attr_accessor :preco
#     def initialize(titulo, preco, ano_lancamento)
#       @titulo = titulo
#       @preco = preco
#       @ano_lancamento = ano_lancamento
#     end
# end

# livro_rails = Livro.new("Agile Web Development with Rails",70,2011)
# livro_ruby = Livro.new("Programming Ruby 1.9",60,2010)
#
# livros = [livro_rails, livro_ruby]

# def imprime_nota_fiscal(livros)
#   livros.each do |livro|
#     livro.preco = 1.00
#     puts "Titulo: #{livro.titulo} - #{livro.preco}"
#   end
# end

#
# def aplica_promocoes(livro)
#   if livro.ano_lancamento < 2000
#       binding.pry
#      livro.preco *= 0.7
#    end
# end
#
# algoritmos = Livro.new("Algoritmos", 100, 1998)
# aplica_promocoes algoritmos
# livro_para_newsletter algoritmos


# class Livro
# attr_reader :titulo, :ano_lancamento
# attr_accessor :preco
#
#   def initialize(titulo, preco, ano_lancamento)
#     @titulo = titulo
#     @preco = preco
#     @ano_lancamento = ano_lancamento
#     if ano_lancamento < 2000
#       @preco *= 0.7
#     end
#   end
# end

class Livro
   attr_reader :titulo, :ano_lancamento, :preco
   def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
      @titulo = titulo
      @ano_lancamento = ano_lancamento
      @possui_reimpressao = possui_reimpressao
      @preco = calcula_preco(preco)
   end

   def possui_reimpressao?
      @possui_reimpressao
   end

   def to_csv
      "#{@titulo}, #{@ano_lancamento}, #{@preco}"
   end

   private

   def calcula_preco(base)
      if @ano_lancamento < 2006
         if @possui_reimpressao
            return base * 0.9
         else
            return base * 0.95
         end
      elsif @ano_lancamento <=  2010
         return base * 0.96
      else
         return base
      end
   end
end

def livro_para_newsletter(livro)
  if livro.ano_lancamento < 1999
     puts "Newsletter/Liquidacao"
     puts livro.titulo
     puts livro.preco
     puts livro.possui_reimpressao?
  end
end

# class Array
#    attr_reader :maximo_necessario
#
#    def <<(livro)
#       push(livro)
#       if @maximo_necessario.nil? || @maximo_necessario < size
#          @maximo_necessario = size
#       end
#       self
#    end
# end

module Contador
   def <<(livro)
      push(livro)
      if @maximo_necessario.nil? || @maximo_necessario < size
         @maximo_necessario = size
      end
      self
   end

   # def maximo_necessario
   #    @maximo_necessario
   # end

   attr_reader :maximo_necessario
end

class Estoque
   attr_reader :livros

   def initialize
      @livros = []
      @livros.extend Contador
      # def @livros.<<(livro)
      #    push(livro)
      #    if @maximo_necessario.nil? || @maximo_necessario < size
      #       @maximo_necessario = size
      #    end
      #    self
      # end
      #
      # def @livros.maximo_necessario
      #    @maximo_necessario
      # end
   end


   def exporta_csv
      @livros.each do |livro|
         puts livro.to_csv
      end
   end

   def mais_barato_que(valor)
       @livros.select do |livro|
         livro.preco <= valor
      end
   end

   def total
      @livros.size
   end

   # def adiciona(livro)
   #    @livros << livro if livro
   # end

   def <<(livro)
      @livros << livro if livro
   end

   def remove(livro)
      @livros.delete livro
   end

   def maximo_necessario
      @livros.maximo_necessario
   end
end

# def exporta_csv(estoque)
#    estoque.each do |livro|
#       puts "#{livro.titulo}, #{livro.ano_lancamento}"
#    end
# end

# def mais_barato_que(estoque, valor)
#     estoque.select do |livro|
#       livro.preco <= valor
#    end
# end

algoritmos = Livro.new("Algoritmos", 100, 1998, true)
#livro_para_newsletter algoritmos
arquitetura = Livro.new('Introdução a Arquitetura e Design de Software', 70, 2011, true)
#estoque = [algoritmos,arquitetura]
# estoque << Livro.new('THE PRAGMATIC PROGRAMMER', 100, 1999, true)
# estoque << Livro.new('Programming Ruby', 100, 2004, true)
estoque = Estoque.new
# estoque.livros << algoritmos << arquitetura
# estoque.livros << Livro.new('Programming Ruby', 100, 2004, true)


# estoque.adiciona algoritmos
# estoque.adiciona arquitetura
# estoque.adiciona Livro.new('THE PRAGMATIC PROGRAMMER', 100, 1999, true)
# estoque.adiciona Livro.new('Programming Ruby', 100, 2004, true)

programmer = Livro.new('THE PRAGMATIC PROGRAMMER', 100, 1999, true)
ruby =  Livro.new('Programming Ruby', 100, 2004, true)

# estoque.livros << algoritmos
# puts estoque.livros.maximo_necessario
# estoque.livros << arquitetura << programmer
# puts estoque.livros.maximo_necessario
# estoque.livros << ruby
# puts estoque.livros.maximo_necessario


estoque << algoritmos
puts estoque.maximo_necessario
estoque << arquitetura << programmer
puts estoque.maximo_necessario
estoque << ruby
puts estoque.maximo_necessario


# estoque.adiciona nil
# estoque.exporta_csv
#
#
# baratos = estoque.mais_barato_que(80)
# baratos.each do |livro|
#    puts livro.titulo
# end



 estoque.remove algoritmos
 puts estoque.maximo_necessario

 # n = []
 # # n.extend Contador
 # n << 1 << 2 << 5 << 7 << 8 << 45 << 23 << 122
 # puts n.maximo_necessario
