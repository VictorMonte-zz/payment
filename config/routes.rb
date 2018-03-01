Rails.application.routes.draw do

  post '/buyers', to:'buyers#create'

  post '/payments', to: 'payments#create'
end
