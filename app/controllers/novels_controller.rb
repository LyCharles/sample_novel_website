class NovelsController < ApplicationController
  def index
    @novels = Novel.order(created_at: :desc)
  end

  def show
    @novel = Novel.find(params[:id])
    @chapters = @novel.chapters.order(:chapter_number)
  end

  def new
    @novel = Novel.new
    I18n.available_locales.each do |locale|
      @novel.translations.build(locale: locale)
    end
  end

  def create
    @novel = Novel.new(novel_params)
    if @novel.save
      redirect_to @novel, notice: t('novels.create.success')
    else
      render :new
    end
  end

  def rankings
    @latest_novels = Novel.order(created_at: :desc).limit(10)  # 最新上传
    @most_viewed = Novel.order(views: :desc).limit(10)         # 最多阅读
    @most_favorited = Novel.order(favorites_count: :desc).limit(10)  # 最多收藏
    
    Rails.logger.debug "Latest novels: #{@latest_novels.inspect}"
    Rails.logger.debug "Most viewed: #{@most_viewed.inspect}"
    Rails.logger.debug "Most favorited: #{@most_favorited.inspect}"
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :author, :description, :category_id)
  end
end
