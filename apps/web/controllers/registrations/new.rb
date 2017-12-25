module Web::Controllers::Registrations
  class New
    include Web::Action
    before :require_no_authenticate!

    def call(params)
    end
  end
end
