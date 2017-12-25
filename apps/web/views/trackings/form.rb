module Web::Views::Trackings
  module Form

    def search_form
      form_for :search, routes.search_trackings_path, class: 'search-form' do
        div class: 'form-group' do
          label      :username
          text_field :username, class: 'form-control'
        end
        div class: 'actions' do
          submit 'Search', class: 'btn btn-success'
        end
      end
    end

    def form(user)
      form_for :ig_user, '/trackings', class: 'tracking-form' do
        hidden_field :profile_id, value: user.id
        hidden_field :username, value: user.username
        hidden_field :image, value: user.profile_picture
        submit 'Add', class: "btn btn-success"
      end
    end
  end  
end
