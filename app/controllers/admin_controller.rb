class AdminController < ApplicationController
  
 
  def listavestido

    uri = URI.parse('https://ellasboutique.000webhostapp.com/venta/viewAll.php')

    descripcion= params[:des]
    estilo= params[:estilo]
    talla= params[:talla]
    precio= params[:precio]
    cantidad= params[:cantidad]
    imagen= params[:img]

    params= {:des => descripcion, :estilo => estilo,:talla => talla,:precio => precio,:cantidad => cantidad,:img => imagen}
    uri.query = URI.encode_www_form(params)

    
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE  
    res = http.request(request)

   
    object = res.body if res.is_a?(Net::HTTPSuccess) 

    object = JSON.parse(respuesta)

    #if object.length >= 0 then
    
     
   
      
    #else 
       
     
    #end
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

