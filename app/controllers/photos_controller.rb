class PhotosController < ApplicationController
	before_action :authenticate_user!

	def index
		if current_user.id == params[:user_id]
			@photos = current_user.photos
		else
			redirect root_path
		end
	end

	def show
		@photo = current_user.photos.build 
	end

	def create
		@photo= current_user.photos.build(photo_params)
		if @photo.save
		else
		end
	end 

	def show_all
		@photos = Photo.where(public: true)
	end

	private

end
