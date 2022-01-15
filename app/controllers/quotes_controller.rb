class QuotesController < Rulers::Controller
  # http://localhost:3001/quotes/a_quote
  def a_quote
    'There is nothing either good or bad but thinking it makes it so.'
    #    + "\n<pre>#{env}</pre>".freeze
  end

  # http://localhost:3001/quotes/exception
  def exception
    raise "It's a bad exception!"
  end
end
