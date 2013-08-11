class PostsController < ApplicationController
  include PostsHelper
  def index
    @posts = Post.all(:limit => 100, :order => 'created_at DESC')
  end

  def show
    @post = Post.find_by_permalink(params[:id])
    @post = Post.find_by_id(params[:id]) if @post.nil?
    if @post.nil?
      render :file => "public/404.html"
    else
      respond_to do |format|
        format.html
        format.xml { render :xml => @post.to_xml }
        format.json { render :json => @post.to_json }
      end
    end
  end

  def create
    @post = Post.new(params[:post])
    @post.author_id = @current_author.id

    if @post.save
      if params[:toTwitter]
        post_to_twitter @post
      end

      render :json => @post
    else
      render :json => {
        :error => true,
        :message => "Could not save post!"
      }
    end
  end

  def new
    if not @current_author
      redirect_to login_path + "?url=/posts/new"
    else

    end
  end

  def edit
    @post = Post.find_by_permalink(params[:id])
    @post = Post.find_by_id(params[:id]) if @post.nil?
    if @post.nil?
      render :file => "public/404.html"
    end
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update_attributes(params[:post])

    render :json => @post
  end

  def author
    @author = Author.find_by_id(params[:id])
    @posts = Post.find_by_author_id(params[:id])
  end

end
