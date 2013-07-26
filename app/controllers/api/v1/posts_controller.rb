require 'rubygems'
require 'readability'
require 'open-uri'

class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.all
    render :json => @posts
  end
  def new

  end
  def create

  end
  def show
    @post = Post.find_by_permalink(params[:id])
    if @post.nil?
      @post = Post.find(params[:id])
    end
    render :json => @post
  end
  def edit

  end
  def update

  end
  def destroy

  end


  def add_article
    url = params[:url]
    if !url.nil? and url != ""
      response = Readability::Document.new(open(url).read)
      if response and response.content
        post = Post.new
        post.content = response.content
        post.author_name = response.author ? response.author : "Undefined"
        render :json => response
      else
        render :json => {
          :error => true,
          :message => "No article found"
        }
      end
    else 
      render :json => {
        :error => true,
        :message => "No url provided"
      }
    end
  end
end
