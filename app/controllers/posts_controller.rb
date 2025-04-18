class PostsController < ApplicationController
   
   def index 
      @posts = Post.all 
      render json: {
         data: PostSerializer.new(@posts).serializable_hash[:data]
      }
   end 

   def show 
      @post = Post.find_by(id: params[:id])
      if @post
         render json: @post 
      else  
         render json: {message: "Post not found"}, status: :not_found 
      end 
   end

   def create 
      @post = Post.new(post_params)
      if @post.save 
         render json: {
            status: {code: 200, message: "Post was created successfully!"},
            data: PostSerializer.new(@post).serializable_hash[:data]
         }
      else   
         render json: {
            message: "Something went wrong..",
            data: @post.errors
         }
      end 
   end 

   def destroy 
      @post = Post.find(params[:id])
      if @post.destroy 
         render json: {message: "Post was deleted successfully"}, status: 200
      else 
         render json: {message: "something went wrong", data: @post.errors}, status: 300
      end 
   end

   private 

   def post_params 
      params.permit(:title, :description, :user_id)
   end

end
