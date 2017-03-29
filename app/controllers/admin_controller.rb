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
    response = consume_api('https://ellasboutique.000webhostapp.com/vestido/viewOne.php', params, "GET")
    string = response.body if response.is_a?(Net::HTTPSuccess)
    JSON.parse(string)
    $result = JSON.parse(string)
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

    if( params[:isUpdate] == 'Y') then

      id= params[:id]
      descripcion= params[:descripcion]
      estilo= params[:estilo]
      talla= params[:talla]
      precio= params[:precio]
      cantidad= params[:cantidad]
      imagen = params[:imagen]

      response = consume_api('https://ellasboutique.000webhostapp.com/vestido/updateVestido.php', {
        :id => id,
        :descripcion => descripcion,
        :estilo => estilo,
        :talla => talla,
        :precio => precio,
        :cantidad => cantidad,
        :imagen => imagen
      }, "POST")

      case response
        when Net::HTTPSuccess, Net::HTTPRedirection
          #ok
          redirect_to admin_listavestido_url :notice => "Se actualizo correctamente #{id}"
        else
          #error
        end

    else
      response = consume_api('https://ellasboutique.000webhostapp.com/vestido/viewOne.php', params, "GET")
      string = response.body if response.is_a?(Net::HTTPSuccess)
      $result = JSON.parse(string)
      $id = params[:id];
    end
  end

  def guardarv
    if params[:descripcion] != nil then
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
           redirect_to admin_listavestido_url :notice => "Se registro correctamente #{id}"
        else
           #error
      end
    end
  end

  def borrarp
     response = consume_api('https://ellasboutique.000webhostapp.com/vestido/deleteVestido.php', params, "POST")
    if response.is_a?(Net::HTTPSuccess) then
      redirect_to admin_listavestido_url :notice => "Se elimino correctamente #{params[:id]}"
    else
      redirect_to admin_listavestido_url :notice => "Ocurrio un error"
    end
  end

  def listapedido

     if params[:id] == nil then
      # params: descripcion estilo talla precio cantidad imagen
      response = consume_api('https://ellasboutique.000webhostapp.com/pedido/viewAll.php', params, "GET")
    else
      #params[:id]
      response = consume_api('https://ellasboutique.000webhostapp.com/pedido/viewOne.php', params, "GET")
    end
    $result = response.body if response.is_a?(Net::HTTPSuccess)
  end

  def mostrarp

    response = consume_api('https://ellasboutique.000webhostapp.com/pedido/viewOne.php', params, "GET")
    string = response.body if response.is_a?(Net::HTTPSuccess)
    $result = JSON.parse(string)

  end



   def listar_imagenes
   end

   def borrar_imagenes
   end

  def index
  end
end
