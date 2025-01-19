class ChaptersController < ApplicationController
  def show
    @novel = Novel.find(params[:novel_id])
    @chapter = @novel.chapters.find(params[:id])
    
    # 获取前一章和后一章，用于导航
    @prev_chapter = @novel.chapters.where('chapter_number < ?', @chapter.chapter_number).last
    @next_chapter = @novel.chapters.where('chapter_number > ?', @chapter.chapter_number).first
  end
end
