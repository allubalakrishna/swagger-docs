module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]
      swagger_controller :posts, 'Post Controller'
      swagger_api :create do
        summary 'Creating posts'
        param :header, :Authoraization, :string, :required, 'To authorize the requests.'
        param :form, 'post[name]', :string, :required, 'name'
        param :form, 'post[publish]', :boolean, :required, 'publish'
        param :form, 'post[fghdfghdf]', :string, :required, 'pubfghdfghdflish', enum: [:aa, :bb, :cc]
      end
      swagger_api :index do
        summary 'Get all the posts'
        param :header, :Authoraization, :string, :required, 'Authoraization'
        response :unauthorized
        response :ok, "Success"
      end
      swagger_api :show do
        summary 'Get all the posts'
        param :path, :id, :string, :id
        response :unauthorized
        response :ok, "Success"
      end
      swagger_api :destroy do
        summary 'Destroy the post'
        param :path, :id, :string, :id
        response :unauthorized
        response :ok, "Success"
      end
     
      # GET /posts
      def index
        @posts = Post.all

        render json: @posts
      end

      # GET /posts/1
      def show
        render json: @post
      end

      # POST /posts
      def create
        @post = Post.new(post_params)

        if @post.save
          render json: @post, status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /posts/1
      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # DELETE /posts/1
      def destroy
        @post.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_params
        params.require(:post).permit(:name, :publish)
      end
    end
  end
end