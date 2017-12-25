module Web::Controllers::Sessions
  class New
    include Web::Action
    before :require_no_authenticate!

    def call(params)
    end
  end
end
