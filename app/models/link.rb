class Link
  include DataMapper::Resource

  property :id, Serial
  property :url, String, length: 255, required: true, index: true
  timestamps :at

  validates_format_of :url, as: :url

end