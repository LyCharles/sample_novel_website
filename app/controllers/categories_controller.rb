class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @novels = @category.novels.order(created_at: :desc)
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = t('categories.errors.not_found')
    redirect_to categories_path
  end
end 