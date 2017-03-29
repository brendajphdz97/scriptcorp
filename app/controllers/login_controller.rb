
class LoginController < ApplicationController

  def create
    email= params[:email]
    password= params[:password]

    response = consume_api('https://ellasboutique.000webhostapp.com/login/validarUsuario.php', {
      :email => email, :contraseña => password
    }, "POST")

    respuesta = response.body if response.is_a?(Net::HTTPSuccess)
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
    
    get_login();
    logout();
       #Redirigir al login
      redirect_to login_index_path 
   
    
   end


    #Detruir la sesion
    #Login.find(session[:email]).destroy
    #Login.find(session[:password]).destroy
    #session[:email] = nil
    #session[:password] = nil
  end


  def index
  end



