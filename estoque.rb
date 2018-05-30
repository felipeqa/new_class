require 'pry'
require_relative 'contador'

class Estoque
  attr_reader :livros

  def initialize
    @livros = []
    @vendas = []
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

  # def livro_que_mais_vendeu_por_titulo
  #    @vendas.sort {|v1,v2|
  #       quantidade_de_vendas_por(v1, &:titulo) <=> quantidade_de_vendas_por(v2, &:titulo)
  #    }.last
  # end
  #
  # def livro_que_mais_vendeu_por_ano
  #    @vendas.sort {|v1,v2|
  #       quantidade_de_vendas_por(v1, &:ano_lancamento) <=> quantidade_de_vendas_por(v2, &:ano_lancamento)
  #    }.last
  # end
  #
  # def livro_que_mais_vendeu_por_editora
  #    @vendas.sort {|v1,v2|
  #       quantidade_de_vendas_por(v1, &:editora) <=> quantidade_de_vendas_por(v2, &:editora)
  #    }.last
  # end

  # def livro_que_mais_vendeu_por(&campo)
  #    que_mais_vendeu_por('livro', &campo)
  # end

  # def livro_que_mais_vendeu_por_ano
  #    que_mais_vendeu_por('livro', &:ano)
  # end
  #
  # def livro_que_mais_vendeu_por_editora
  #    que_mais_vendeu_por('livro', &:editora)
  # end

  #revista

  # def revista_que_mais_vendeu_por(&campo)
  #    que_mais_vendeu_por("revista", &campo)
  # end

  def method_missing(name)
    # puts "Não encontrei: #{name}"
    matcher = name.to_s.match "(.+)_que_mais_vendeu_por_(.+)"
    if matcher
      tipo = matcher[1]
      campo = matcher[2].to_sym
      que_mais_vendeu_por(tipo, &campo)
    else
      super
    end
  end

  def respond_to?(name)
    matched = name.to_s.match("(.+)_que_mais_vendeu_por_(.+)")
    #bouble bang !! return true or false
    !!(matched)|| super
  end

  # def ebook_que_mais_vendeu_por(&campo)
  #    que_mais_vendeu_por("ebook", &campo)
  # end

  # def revista_que_mais_vendeu_por_titulo
  #    que_mais_vendeu_por("revista", &:titulo)
  # end

  # def revista_que_mais_vendeu_por_ano
  #    que_mais_vendeu_por('revista', &:ano)
  # end
  #
  # def revista_que_mais_vendeu_por_editora
  #    que_mais_vendeu_por('revista', &:editora)
  # end

  # def revista_que_mais_vendeu_por(&campo)
  #    @vendas.select {|l| l.tipo == "revista"}.sort {|v1,v2|
  #       quantidade_de_vendas_por(v1, &campo) <=> quantidade_de_vendas_por(v2, &campo)
  #    }.last
  # end

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

  def vende(livro)
    @livros.delete livro
    @vendas << livro
  end

  def maximo_necessario
    @livros.maximo_necessario
  end

  private

  def quantidade_de_vendas_por(produto, &campo)
    @vendas.count {|venda| campo.call(venda) == campo.call(produto)}
  end

  def que_mais_vendeu_por(tipo, &campo)
    @vendas.select {|produto| produto.matches?(tipo)}.sort {|v1,v2|
      quantidade_de_vendas_por(v1, &campo) <=> quantidade_de_vendas_por(v2, &campo)
    }.last
  end
end
