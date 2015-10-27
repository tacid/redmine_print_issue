# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get '/issues/print/:id.odt', to:'issues#show', as: 'print_template', format: "odt"
