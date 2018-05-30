require 'pry'

class Livro
  attr_reader :titulo, :preco, :ano_lancamento, :editora
  def initialize(titulo, preco, ano_lancamento, possui_reimpressao, editora, possui_sobrecapa)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @possui_reimpressao = possui_reimpressao
    @possui_sobrecapa = possui_sobrecapa
    @preco = calcula_preco(preco)
    @editora = editora
  end

  def matches?(query)
    ['livro', 'impresso'].include?(query)
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
