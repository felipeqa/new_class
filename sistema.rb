require_relative 'livro'
require_relative 'estoque'

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

algoritmos = Livro.new("Algoritmos", 100, 1998, true, "", "livro")
arquitetura = Livro.new('Introdução a Arquitetura e Design de Software', 70, 2011, true, "", "livro")
programmer = Livro.new('THE PRAGMATIC PROGRAMMER', 100, 1999, true, "", "livro")
ruby =  Livro.new('Programming Ruby', 100, 2004, true, "", "livro")
revistona = Livro.new('Revista de Ruby', 100, 2004, true, "", "revista")

#livro_para_newsletter algoritmos
#estoque = [algoritmos,arquitetura]
# estoque << Livro.new('THE PRAGMATIC PROGRAMMER', 100, 1999, true)
# estoque << Livro.new('Programming Ruby', 100, 2004, true)
# estoque.livros << algoritmos << arquitetura
# estoque.livros << Livro.new('Programming Ruby', 100, 2004, true)

estoque = Estoque.new

estoque << algoritmos << algoritmos << ruby << programmer << arquitetura << ruby << ruby << arquitetura << arquitetura << arquitetura << revistona << revistona

estoque.vende ruby
estoque.vende algoritmos
estoque.vende algoritmos
estoque.vende ruby
estoque.vende ruby
estoque.vende algoritmos
estoque.vende arquitetura
estoque.vende arquitetura
estoque.vende arquitetura
estoque.vende revistona

puts estoque.livro_que_mais_vendeu_por_titulo.titulo
puts estoque.revista_que_mais_vendeu_por_titulo.titulo

# estoque.adiciona algoritmos
# estoque.adiciona arquitetura
# estoque.adiciona Livro.new('THE PRAGMATIC PROGRAMMER', 100, 1999, true)
# estoque.adiciona Livro.new('Programming Ruby', 100, 2004, true)



# estoque.livros << algoritmos
# puts estoque.livros.maximo_necessario
# estoque.livros << arquitetura << programmer
# puts estoque.livros.maximo_necessario
# estoque.livros << ruby
# puts estoque.livros.maximo_necessario


# estoque << algoritmos
# puts estoque.maximo_necessario
# estoque << arquitetura << programmer
# puts estoque.maximo_necessario
# estoque << ruby
# puts estoque.maximo_necessario
#
#
# # estoque.adiciona nil
# # estoque.exporta_csv
# #
# #
# # baratos = estoque.mais_barato_que(80)
# # baratos.each do |livro|
# #    puts livro.titulo
# # end
#
#
#
#  estoque.remove algoritmos
#  puts estoque.maximo_necessario

 # n = []
 # # n.extend Contador
 # n << 1 << 2 << 5 << 7 << 8 << 45 << 23 << 122
 # puts n.maximo_necessario
