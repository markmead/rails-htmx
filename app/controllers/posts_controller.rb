class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_posts, only: %i[index live draft]
  skip_before_action :verify_authenticity_token, only: %i[live draft]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
      else
        format.html { render partial: "posts/form", locals: { post: @post } }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
    end
  end

  def live
    update_multiple_posts(true)

    respond_to do |format|
      format.html { render partial: "posts/post", collection: @posts }
    end
  end

  def draft
    update_multiple_posts(false)

    respond_to do |format|
      format.html { render partial: "posts/post", collection: @posts }
    end
  end

private

  def update_multiple_posts(status)
    post_ids = params[:post_ids]&.uniq&.map(&:to_i)

    Post.where(id: post_ids).each { |post| post.update(live: status) }
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_posts
    @posts = Post.all
  end

  def post_params
    params.require(:post).permit(:title, :body, :live, post_ids: [])
  end
end
