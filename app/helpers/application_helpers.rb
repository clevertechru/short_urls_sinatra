class App
  module ApplicationHelpers
    include Rack::Utils

    alias :h :escape_html

    def link_url(link)
      url = "http://#{request.host}"
      url << ":#{request.port}" if request.port && request.port != 80
      url << "/#{link.id.base62_encode}"
    end
  end

  helpers ApplicationHelpers
end
