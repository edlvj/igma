require_relative 'form'

module Web::Views::Sessions
  class Create
    include Web::View
    include Form
    template 'sessions/new'
  end
end
