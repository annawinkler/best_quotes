class QuotesController < Rulers::Controller
  # http://localhost:3001/quotes/index
  def index
    quotes = FileModel.all
    render :index, quotes: quotes
  end

  def show
    quote = FileModel.find(params['id'])
    user_agent = request.user_agent
    render :quote, obj: quote, ua: user_agent
  end

  def update
    raise 'Only POST to this route!' unless env['REQUEST_METHOD'] == 'POST'

    body = env['rack.input'].read
    astr = body.split('&')
    params = {}
    astr.each do |a|
      name, val = a.split('=')
      params[name] = val
    end
    quote = FileModel.find(params['id'].to_i)
    quote['submitter'] = params['submitter']
    quote.save

    render :quote, obj: quote
  end

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

  # http://localhost:3001/quotes/new_quote
  def new_quote
    attrs = {
      'submitter' => 'web user',
      'quote' => 'A picture is worth one k pixels',
      'attribution' => 'Me'
    }
    file_model = FileModel.create(attrs)
    render :quote, obj: file_model
  end

  # http:// localhost:3001/quotes/quote_1
  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, obj: quote_1
  end
end
