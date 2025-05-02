module Admin
  class PagesController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin

    def edit_about
      @about_content = PageContent.find_by(page_name: "about")
    end

    def update_about
      @about_content = PageContent.find_by(page_name: "about")
      if @about_content.update(content: params[:content])
        redirect_to about_path, notice: "About page updated."
      else
        render :edit_about
      end
    end

    def edit_contact
      @contact_content = PageContent.find_by(page_name: "contact")
    end

    def update_contact
      @contact_content = PageContent.find_by(page_name: "contact")
      if @contact_content.update(content: params[:content])
        redirect_to contact_path, notice: "Contact page updated."
      else
        render :edit_contact
      end
    end

    private

    def check_admin
      redirect_to root_path unless current_user.admin?
    end
  end
end
