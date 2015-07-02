class PhotosController < ApplicationController
	before_action :authenticate_user!, except: [:show_all]
	def index
		@photos = current_user.photos
	end

	def show
		@photo = Photo.find params[:id]
		@new_comment = Comment.new(:photo => @photo)
	end

	def new
		@photo = current_user.photos.build
	end

	def edit
		@photo = current_user.photos.find(params[:id])
	end

	def create
		@photo= current_user.photos.build(photo_params)
		if @photo.save
			redirect_to user_photo_path(current_user, @photo)
		else
			render 'new'
		end
	end 

	def update
		@photo = Photo.find params[:id]
			if @photo.update(photo_params)
				redirect_to user_photo_path(current_user, @photo)
			else
				render 'edit'
			end
	end

	def destroy
		@photo = Photo.find params[:id]
		@photo.destroy

		redirect_to user_photos_path(current_user)
	end


	def show_all
		@photos = Photo.where(public: true)
	end

	private
		def photo_params
			params.require(:photo).permit(:public, :image, :caption)
		end

end


