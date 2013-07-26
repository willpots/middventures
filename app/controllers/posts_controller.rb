class PostsController < ApplicationController
  def index
    @posts = Post.all(:limit => 100, :order => 'created_at DESC')
  end
  def show
    @post = Post.find_by_permalink(params[:id])
    @post = Post.find_by_id(params[:id]) if @post.nil?
    if @post.nil?
      render :file => "public/404.html"
    end
    respond_to do |format|
      format.html
      format.xml { render :xml => @post.to_xml }
      format.json { render :json => @post.to_json }
    end
  end
  def create
    @post = Post.new(params[:post])
    if @post.save
      render :json => @post
    else
      render :json => {
        :error => true,
        :message => "Could not save post!"
      }
    end
  end
  def new

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
