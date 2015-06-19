class PostsController < ApplicationController
    before_action :authenticate_with_token!, only: [:create, :update, :delete]

    def index #this is GET request, it will show all the posts
            @post = Post.all
            if current_user
                render json: {post: @post.to_json([:id, :title, :image_url, :gusses, :guess_id])}
            else
                render json: {post: @post.to_json(only: [:title, :image_url])}
            end
    end

    def create #this is POST request. It does not have a view, is just going to save the post in the data base, and it will rederect to a different page
           answer = nil
            image_url = nil
            title = nil
            @action = posts_path
            @post = Post.create(title: params[:title], image_url: params[:image_url], answer: params[:answer])
                while answer.blank? || image_url.blank? || title.blank?
                    flash[:alert] = "You need to fill every box"
                end

                if @post.save
                    render json: @post
                end
                flash[:notice] = "Your post has been successfully created"
    end

    def show #this is a GET Request, it will show and individual post
        if current_user
            @post = Post.find(id: params[:id])
            render json: { post: @post.as_json(only: [:post_id, :username, :title, :image_url])}
        else
            render json:{post: @post.as_json(only: [:username, :title, :image_url])}
        end
    end

    def new #this is GET Request, it will display the form to summit a new post
        @action = posts_path
        @method = :post
        @post = Post.new(title: params[:title], image_url: params[:image_url], answer: params[:answer])

        render json: {post: @post.as_json(only: [:title, :image_url, :answer])}
    end

    def edit #this is a GET request, it will display a form for editing a post
        @post = Post.find(id: params[:id])
        @action = posts_path(@post)
        @methd = :patch

        render json: @post

    end

    def update #this is PATCH request. It will update the post of the database. It does not have a view file, and rederect to a different page
        @post = Post.find(id: params[:id])
        if user_id == current_user
        @post.update(title: params[:title], image_url: params[:image_url], answer: params[:answer])
        else
            flash[:alert] = "You need to be logged in."
        end
        rederect_to user_register_path
        rendert json: @update
    end

    def destroy #this is DELETE request. It does not have a view file, it rederects to a different page.
        @post = Post.find(id: params[:id])
        if user_id == current_user
            @post.destroy!
        else
            flash[:alert] = "You need to be logged in."
        end
        rederect_to user_register_path
        render json: @delete
    end

end