require_relative 'form'

module Web::Views::Trackings
  class Create
    include Web::View
    include Form
    template 'trackings/new'
  end
end
