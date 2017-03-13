
class LoginController < ApplicationController
 


  def create

    uri = URI('https://ellasboutique.000webhostapp.com/login/validarUsuario.php')

    email= params[:email]
    password= params[:password]

    params= {:email => email, :contraseña => password}
    uri.query = URI.encode_www_form(params)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl=true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(uri.request_uri)
    res = http.request(request)

    respuesta = res.body if res.is_a?(Net::HTTPSuccess) 

    object = JSON.parse(respuesta)

    if object.length <= 0 then
      #Redirigir al login
      redirect_to login_index_url, notice: ""
   
      
    else 
      #Redigiri al panel
      redirect_to admin_index_url
      #Guardar la sesion
     
    end
   end


   def logout
      #Desloguea al usuario.
      session[:logueado] = false;
      session[:email] = nil;
      session[:password] = nil;
   end


    def get_login
      #Verifica si el usuario está logueado. Primero pregunta si existe la session[:logueado] 
      #y además que este sea true, si existe devuelve la sesión sino existe devuelve false.
      if defined?(session[:logueado]) and session[:logueado]
         #Está logueado.
         return session;
      else
         #No está logueado.
         return false;
      end
   end


  def destroy

     @sesion = get_login();
   if @sesion
      logout();
       #Redirigir al login        
       redirect_to login_index_url
   else
     #Devuelve al panel
      redirect_to admin_index_url
   end
    

    #Detruir la sesion
    #Login.find(session[:email]).destroy  
    #Login.find(session[:password]).destroy     
    #session[:email] = nil 
    #session[:password] = nil  
  end


  def index
  end


end