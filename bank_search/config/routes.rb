Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :searches
  root to: "searches#new"

  # <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBAnEpGMdG4aeb-chrxedvGa74BYhpY2DI&callback=initMap" type="text/javascript"></script>
end
