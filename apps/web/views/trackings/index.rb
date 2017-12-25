module Web::Views::Trackings
  class Index
    include Web::View

    def form_destroy(tracking_id)
      form_for :tracking, routes.path(:tracking, tracking_id), method: :delete do
        submit 'Delete', class: 'btn btn-danger'
      end
    end
  end
end
