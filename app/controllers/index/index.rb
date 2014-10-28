module Sinatra
  module Index
    def self.registered(app)
      app.get '/' do
        @link = Link.new
        haml :'index/index'
      end

      app.post '/' do
        puts params.inspect
        @link = Link.first_or_create(url: params[:url])
        haml :'index/index'
      end

      app.get %r{/(\w+)} do
        @link = Link.get(params[:captures].first.base62_decode)
        throw :halt, [404, "Not found"] unless @link
        redirect @link.url
      end
    end
  end
  register Index
end