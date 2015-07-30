class ArticlesController < ApplicationController
  def create
    @articles = current_user.articles
    current_user.keywords.each do |keyword|
      if keyword.articles.empty?
        keyword.get_all_recent_abstracts
      end
    end
    respond_to do |format|
      format.js
    end
  end
  def index
    @user = current_user
    @articles = @user.articles
    render "user_mailer/daily_result_email"
  end
end
