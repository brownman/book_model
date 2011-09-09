class LinesController < ApplicationController
  def index
    @lines = Line.find(:all, :conditions => "parent_id = 20", :order => 'pos')
  end

  def show
    @line = Line.find(params[:id])
  end
  


  def new
  @line = Line.new
  #(:parent_id => 20 , :pos =>  params[:pos].to_i + 1 )
  end
  def new1
  @line = Line.new(:parent_id => 20 , :pos =>  params[:pos].to_i + 1 )
  end

  def sign
line = Line.find(params[:id])
pos = line.pos + 1
  @line = Line.new(:parent_id => 20 , :pos => pos , :content => "=")
@line.save
redirect_to lines_url
  end

  def create
    @line = Line.new(params[:line])
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
end
