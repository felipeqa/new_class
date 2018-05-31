require 'pry'
require_relative 'produto'

class Ebook < Produto

  include Impresso

  def matches?(query)
    ['ebook', 'digital'].include?(query)
  end
end
