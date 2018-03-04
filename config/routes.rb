Rails.application.routes.draw do

  post '/buyers', to:'buyers#create'
  post '/buyers/:cpf/credit-cards', to:'credit_cards#create'

  post '/payments', to: 'payments#create'
  get '/payments/:hash/status', to: 'payments#status'

  get '/checkout', to:'checkouts#new'
  get '/checkouts', to:'checkouts#new'
  post '/checkouts', to: 'checkouts#create'
end
