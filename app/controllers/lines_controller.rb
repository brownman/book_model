class LinesController < ApplicationController

  before_filter :find_page , :only => [ :index, :new]
#response_with :html
  def index
@lines = @page.lines.find(:all, :conditions => "parent_id = #{@page.id}", :order => 'pos')
  end

  def show
    @line = Line.find(params[:id])
  end
  


  def new
  @line = @page.lines.build

#(:parent_id =>)
@line.parent_id = @page.id
@line.pos = @page.lines.length
  #(:parent_id => 20 , :pos =>  params[:pos].to_i + 1 )
  end

  def sign

line = Line.find(params[:id])
pos = line.pos 
#parent = line.parent_id
@page  = Page.find(line.page_id)

  @line = @page.lines.new(:parent_id => line.page_id , :pos => pos , :content => "+")
@line.save
#render :controller => 'page' , :action => 'show' , :page_id => parent.to_s

#show_page_path(:page_id => parent.to_s)

redirect_to page_path :id => @page.id
#lines_url , :page_id => parent.to_s
  end

  def create
    @line = Line.new(params[:line])

@line.content = '?' if @line.content.empty?
    if @line.save
      redirect_to @line, :notice => "Successfully created line."
    else
      render :action => 'new'
    end
  end

  def edit
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    if @line.update_attributes(params[:line])
      redirect_to @line, :notice  => "Successfully updated line."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    redirect_to lines_url, :notice => "Successfully destroyed line."
  end
private 
def find_page
@page = Page.find(params[:page_id])
end
end
 # def new1
 # @line = Line.new(:parent_id => 20 , :pos =>  params[:pos].to_i + 1 )
 # end


