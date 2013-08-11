class ApplicationController < ActionController::Base


  before_filter :get_user


  protect_from_forgery




  def get_user
    @current_author = current_author

    puts "DEBUGGING"
    puts session
    puts "\n"
  end


  def is_logged_in
    if session[:user_id]
      true
    else
      false
    end
  end

  def current_author
    if is_logged_in
      Author.find_by_id(session[:user_id])
    else
      nil
    end
  end


end

