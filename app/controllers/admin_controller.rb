class AdminController < ApplicationController


  def listavestido
    if params[:id] == nil then
      # params: descripcion estilo talla precio cantidad imagen
      response = consume_api('https://ellasboutique.000webhostapp.com/vestido/viewAll.php', params, "GET")
    else
      #params[:id]
      response = consume_api('https://ellasboutique.000webhostapp.com/vestido/viewOne.php', params, "GET")
    end
    $result = response.body if response.is_a?(Net::HTTPSuccess)
  end

  def idvestido
    #No se requiere
  end

  def borrarv
    response = consume_api('https://ellasboutique.000webhostapp.com/vestido/deleteVestido.php', params, "POST")
    if response.is_a?(Net::HTTPSuccess) then
      redirect_to admin_listavestido_url :notice => "Se elimino correctamente #{params[:id]}"
    else
      redirect_to admin_listavestido_url :notice => "Ocurrio un error"
    end
  end

  def actualizarv
  end

  def guardarv
    descripcion= params[:descripcion]
    estilo= params[:estilo]
    talla= params[:talla]
    precio= params[:precio]
    cantidad= params[:cantidad]
    imagen = params[:imagen]

    response = consume_api('https://ellasboutique.000webhostapp.com/vestido/insertVestido.php', {
      :descripcion => descripcion,
      :estilo => estilo,
      :talla => talla,
      :precio => precio,
      :cantidad => cantidad,
      :imagen => imagen
    }, "POST")

    case response
      when Net::HTTPSuccess, Net::HTTPRedirection
        #Ok
      else
        response.value
    end
  end

  def borrarp
  end

  def listapedido
  end

  def buscarp
  end




   def listar_imagenes
   end

   def borrar_imagenes
   end

  def index
  end
end
