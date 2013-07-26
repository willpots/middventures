class LoginController < ApplicationController


  def index

  end

  def login
    password_digest = Digest::SHA1.hexdigest(SECRET_CONFIG["password_salt"] + params[:password])
    @author = Author.where(:email => params[:email], :password => password_digest)

    render :json => {
      :author => @author,
      :params => params
    }
  end

  def change_password


  end

  def register

  end

  def process_register

  end

end
