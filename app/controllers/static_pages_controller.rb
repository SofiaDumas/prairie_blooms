class StaticPagesController < ApplicationController
  def about
    @about_content = PageContent.find_by(page_name: "about")
  end

  def contact
    @contact_content = PageContent.find_by(page_name: "contact")
  end
end
