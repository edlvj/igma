require_relative 'form'

module Web::Views::Trackings
  class Search
    include Web::View
    include Form
    template 'trackings/new'
  end
end
