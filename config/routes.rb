Rails.application.routes.draw do
  get 'admin/listavestido'

  get 'admin/idvestido'

  get 'admin/borrarv'

  get 'admin/actualizarv'

  get 'admin/guardarv'

  get 'admin/borrarp'

  get 'admin/listapedido'

  get 'admin/buscarp'

  get 'admin/index'

  get 'listavestido/idvestido'

  get 'listavestido/borrarv'

  get 'listavestido/actualizarv'



  get 'listavestido/borrarp'

  get 'listavestido/listapedido'

  get 'listavestido/buscarp'

  get 'listavestido/index'

  post 'login/create'

  post 'login/destroy'

  get 'login/index'


  resources :admin, only: [:index, :guardarv] do
    collection do
         get 'listavestido/guardarv'
    end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
