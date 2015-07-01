class CommentsController < ApplicationController
	def create
		@photo = Photo.find params[:photo_id]
		@comment = @photo.comments.new(comment_params)
		@comment.user = current_user
		@comment.save
		redirect_to user_photo_path(current_user, @photo)
	end
 
	def destroy
		@photo = Photo.find params[:photo_id]
		@comment = @photo.comments.find params[:id]
		@comment.destroy
		redirect_to user_photo_path(current_user, @photo)
	end

	def edit
		@photo = Photo.find params[:photo_id]
		@new_comment = @photo.comments.find params[:id]		
	end

	def update
		@photo = Photo.find params[:photo_id]
		@comment = @photo.comments.find params[:id]
		if @comment.update(comment_params)
			redirect_to user_photo_path(current_user, @photo)
		else
			render 'edit'
		end
	end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end