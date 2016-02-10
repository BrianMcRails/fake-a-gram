class PostsController < ApplicationController
before_action :authenticate_user!
before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts=Post.all
	end
    
    def show
    end
	
	def new
		@post = Post.new
	end
    
    def edit
    end
    
    def update
 		if @post.update(post_params)
 			flash[:success] = "Your post has been updated!"
   		 redirect_to posts_path
 		else
 			flash.now[:alert] = "Your post could not be updated."
  		 render :edit
  		end
	end

	def create
		if @post = Post.create(post_params)
			flash[:success] = "Your post has been created!"
		redirect_to posts_path
		else
			flash.now[:alert] = "Your post could not be created."
			render :new
		end
	end
    
    def destroy
       if @post.destroy
       	flash[:success] = “Your personalised message here”  
        redirect_to root_path
    	else
    	  flash[:alert] = “Oh god something is wrong” 
    	  render :show
    	end
    end

	private
	def post_params
		params.require(:post).permit(:image, :caption)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
