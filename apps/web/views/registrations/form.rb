module Web::Views::Registrations
  module Form
    
    def form
      form_for :user, routes.registrations_path, class: 'signup-form' do
        div class: 'form-group' do
          label      :name
          text_field :name, class: 'form-control'
        end
        div class: 'form-group' do
          label      :email
          text_field :email, class: 'form-control'
        end
        div class: 'form-group' do
          label      :password
          text_field :password, type: 'password', class: 'form-control'
        end
        div class: 'actions' do
          submit 'Sign up', class: 'btn btn-success'
          a href: routes.new_session_path, class: 'btn' do
            'Sign in'
          end
        end
      end
    end
  end
end