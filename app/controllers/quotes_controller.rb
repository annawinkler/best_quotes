class QuotesController < Rulers::Controller
  # http://localhost:3001/quotes/a_quote
  def a_quote
    render :a_quote, noun: :winking
  end

  # http://localhost:3001/quotes/exception
  def exception
    raise "It's a bad exception!"
  end

  def another_method
    'Another method'
  end

  # http:// localhost:3001/quotes/quote_1
  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, obj: quote_1
  end
end
