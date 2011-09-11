class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(params[:chapter])
    if @chapter.save
      redirect_to @chapter, :notice => "Successfully created chapter."
    else
      render :action => 'new'
    end
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def update
    @chapter = Chapter.find(params[:id])
    if @chapter.update_attributes(params[:chapter])
      redirect_to @chapter, :notice  => "Successfully updated chapter."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    redirect_to chapters_url, :notice => "Successfully destroyed chapter."
  end
end
