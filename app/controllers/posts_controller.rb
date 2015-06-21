class PostsController < ApplicationController
    before_action :authenticate_with_token!
    def index #this is GET request, it will show all the posts
            @post = Post.order(posted_at: :desc)
                render json: {post: @post.as_json}
    end

    def create #this is POST request. It does not have a view, is just going to save the post in the data base, and it will rederect to a different page
            @post = Post.create(title: params[:title], image_url: params[:image_url], answer: params[:answer])

            if @post.save
                render json: {post: @post.as_json}, status: :created
            end
    end

    def show #this is a GET Request, it will show and individual post
            @post = Post.find(username: params[:username], id: params[:id])
            render json: { post: @post.as_json(only: [:post_id, :username, :title, :image_url])}
    end

    def new #this is GET Request, it will display the form to summit a new post
        @post = Post.new(title: params[:title], image_url: params[:image_url], answer: params[:answer])

        render json: {post: @post.as_json(only: [:title, :image_url, :answer])}
    end

    def edit #this is a GET request, it will display a form for editing a post
        @post = Post.find(id: params[:id])
        render json: {post: @post.as_json}
    end

    def update #this is PATCH request. It will update the post of the database. It does not have a view file, and rederect to a different page
        @post = Post.find(id: params[:id])
        if user_id == current_user
        @post.update(title: params[:title], image_url: params[:image_url], answer: params[:answer])
        else
            render json: { error: "Only the owner of the post can update this post", status: 400}, status: 400
        end
    end

    def delete #this is DELETE request. It does not have a view file, it rederects to a different page.
        @post = Post.find(id: params[:id])
        if user_id == current_user
            @post.destroy!
        else
            render json: { error: "Only the owner of the post can delete this post", status: 400}, status: 400
        end
        render json: @delete
    end

end