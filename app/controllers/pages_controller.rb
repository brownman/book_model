class PagesController < ApplicationController
  before_filter :find_compare , :only => [:index, :new]
  def index

    @pages = @compare.pages


  end

  def show
    @page = Page.find(params[:id])
@lines =  @page.lines
  end

  def new
    @page = @compare.pages.build
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to @page, :notice => "Successfully created page."
    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to @page, :notice  => "Successfully updated page."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_url, :notice => "Successfully destroyed page."
  end
private 
def find_compare
 @compare = Compare.find(params[:compare_id])
end
end
