class AdminController < ApplicationController


  def listavestido

    if params[:id] == nil then
      uri = URI.parse('https://ellasboutique.000webhostapp.com/vestido/viewAll.php')
      #Como los parametros que se pasaron desde html se llaman igual que los que hay
      #que mandar al api entonces se manda el objeto params directo
      #descripcion= params[:descripcion]
      #estilo= params[:estilo]
      #talla= params[:talla]
      #precio= params[:precio]
      #cantidad= params[:cantidad]
      #imagen= params[:imagen]
      #params= {:descripcion => descripcion, :estilo => estilo,:talla => talla,:precio => precio,:cantidad => cantidad,:imagen => imagen}
    else
      uri = URI.parse('https://ellasboutique.000webhostapp.com/vestido/viewOne.php')
      #id = params[:id]
      #params= {:id => id}
    end
    uri.query = URI.encode_www_form(params)

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.request(request)

    object = res.body if res.is_a?(Net::HTTPSuccess)
    $result = object

  end



  def idvestido
    #No se requiere
  end

  def borrarv
     uri = URI.parse('https://ellasboutique.000webhostapp.com/vestido/deleteVestido.php')

    id= params[:id]


    params= {:id => id}
    uri.query = URI.encode_www_form(params)


    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.request(request)

    if res.is_a?(Net::HTTPSuccess) then
      redirect_to admin_listavestido_url :notice => "Se elimino correctamente #{id}"
    else
      redirect_to admin_listavestido_url :notice => "Ocurrio un error"
    end
  end

  def actualizarv
  end

  def guardarv
    uri = URI.parse('https://ellasboutique.000webhostapp.com/vestido/insertVestido.php')

    descripcion= params[:descripcion]
    estilo= params[:estilo]
    talla= params[:talla]
    precio= params[:precio]
    cantidad= params[:cantidad]
    imagen = params[:imagen]

    params= {:descripcion => descripcion, :estilo => estilo,:talla => talla,:precio => precio,:cantidad => cantidad,:imagen => imagen}

    uri.query = URI.encode_www_form(params)

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    res = http.request(request)

    case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        #Ok
      else
        res.value
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
