
class article::AttachmentsController < ApplicationController
    def destroy
      image = ActiveStorage::Attachment.find(params[:id])
      image.purge
      redirect_to new_article_path
    end
  end