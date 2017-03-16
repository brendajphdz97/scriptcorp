class AdminController < ApplicationController
  
 
  def listavestido

    uri = URI.parse('https://ellasboutique.000webhostapp.com/vestido/viewAll.php')

    descripcion= params[:descripcion]
    estilo= params[:estilo]
    talla= params[:talla]
    precio= params[:precio]
    cantidad= params[:cantidad]
    imagen= params[:imagen]

    params= {:descripcion => descripcion, :estilo => estilo,:talla => talla,:precio => precio,:cantidad => cantidad,:imagen => imagen}
    uri.query = URI.encode_www_form(params)

    
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE  
    res = http.request(request)

   
    respuesta = res.body if res.is_a?(Net::HTTPSuccess) 

    $result = JSON.parse(respuesta)

     if $result then
    
     
   
      
    else 
       
     
    end

  
  end

  

  def idvestido
  end

  def borrarv
  end

  def actualizarv
  end

  def guardarv
     uri = URI.parse('https://ellasboutique.000webhostapp.com/vestido/insertVestido.php')

    descripcion= params[:des]
    estilo= params[:estilo]
    talla= params[:talla]
    precio= params[:precio]
    cantidad= params[:cantidad]
    imagen = params[:imagen]
    
    params= {:des => descripcion, :estilo => estilo,:talla => talla,:precio => precio,:cantidad => cantidad,:imagen => imagen}
    uri.query = URI.encode_www_form(params)

    
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE  
    res = http.request(request)

   
    object = res.body if res.is_a?(Net::HTTPSuccess) 

     

   if object.length >= 0 then
     
            succes = "";
         else
            error = "";
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

