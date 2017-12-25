module Web::Views::Sessions
  module Form

    def form
      form_for :session, routes.sessions_path, class: 'signin-form' do
        div class: 'form-group' do
          label      :email
          text_field :email, class: 'form-control'
        end
        div class: 'form-group' do
          label      :password
          text_field :password, type: 'password', class: 'form-control'
        end
        div class: 'actions' do
          submit 'Sign in', class: 'btn btn-success'
          a href: routes.new_registration_path, class: 'btn' do
            'Sign up'
          end
        end
      end
    end
  end
end