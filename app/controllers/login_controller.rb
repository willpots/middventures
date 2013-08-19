class LoginController < ApplicationController


  def index
    if @current_author
      redirect_to root_path
    end
  end

  def login
    if not session[:user_id]
      password_digest = Digest::SHA1.hexdigest(ENV["PASSWORD_SALT"] + params[:password])
      @author = Author.where(:email => params[:email], :password => password_digest).first
      if @author.nil?
        @message = "Could not find username/password combination"
        render "index"
      else
        session[:user_id] = @author.id
        redirect_path = params[:url] || root_path;
        redirect_to redirect_path
      end
    else
      redirect_to root_path
    end
  end

  def change_password

  end

  def register

  end

  def process_register

  end

end
