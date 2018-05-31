module Produto

  attr_reader :titulo, :preco, :ano_lancamento, :editora

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
