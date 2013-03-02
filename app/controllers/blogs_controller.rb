class BlogsController < ApplicationController

	before_filter :require_admin, except: [:index,:show,:feed]

	def feed
		# this will be the name of the feed displayed on the feed reader
		@title = "S.D. Odonnell Atom Feed"

		# the news items
		@posts = Blog.all.desc(:updated_at).to_a[0..10]

		# this will be our Feed's update timestamp
		@updated = @posts.first.updated_at if @posts.first
		@updated ||= Date.today

		respond_to do |format|
			format.atom { render :layout => false }

			# we want the RSS feed to redirect permanently to the ATOM feed
			format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
		end	
	end
	
  def index
		@blogs = Blog.all
  end

  def show
		@blog = Blog.find(params[:id])
  end

  def new
		@blog = Blog.new
		@blogs = Blog.all
		render layout: "admin"
  end

  def create
		@blog = Blog.new( params[:blog] )
		if @blog.save
			SocialHelper::post(params,@blog)
			redirect_to new_blog_path, notice: "Blog was created and shared!"
		else
			@blogs = Blog.all
			render layout: "new"
		end
  end

  def edit
		@blogs = Blog.all
		@blog = Blog.find( params[:id] )
		render layout: "admin"
  end

  def update
		@blog = Blog.find( params[:id] )
		if @blog.update_attributes( params[:blog] )
			redirect_to new_blog_path, notice: "Blog update complete"
		else
			@blogs = Blog.all
			render "edit", layout: "admin"
		end
  end

  def destroy
		Blog.find( params[:id] ).destroy
		redirect_to new_blog_path, notice: "Blog has been eliminated"
  end

end
