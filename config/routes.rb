Rails.application.routes.draw do
  get 'admin/listavestido'

  get 'admin/idvestido'

  get 'admin/borrarv'

  get 'admin/actualizarv'

  get 'admin/guardarv'

  get 'admin/borrarp'

  get 'admin/listapedido'

  get 'admin/mostrarp'

  get 'admin/index'

  post 'admin/guardarv'

  post 'admin/idvestido'

  post 'admin/actualizarv'

  post 'login/create'

  post 'login/destroy'

  get 'login/index'

  get 'login/destroy'


  root :to => 'login#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
