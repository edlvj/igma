require_relative 'form'

module Web::Views::Registrations
  class Create
    include Web::View
    include Form
    template 'registrations/new'
  end
end
