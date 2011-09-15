class PagesController < ApplicationController
  before_filter :find_compare , :only => [:index, :new]
  def index

    @pages = @compare.pages

    @readers = []
    @min = @pages.first.content.length if @pages

    @pages.each do |page|
      @reader  =  page.lines.find(:all, :conditions => "parent_id = #{page.id}", :order => 'pos') 
      @readers <<    @reader

      @min = min(@min , @reader.length) 

    end



  end

  def min a , b
    a<b ? a:b
  end

  def show
    @page = Page.find(params[:id])

    @lines = @page.lines.find(:all, :conditions => "parent_id = #{@page.id}", :order => 'pos')
  end

  def new

    @page = @compare.pages.build
    @page.number = @compare.page_number_relative
    #(params[:number] => @compare.page_number_relative)
  end

  def create
    @page = Page.new(params[:page])
    if @page.save

      generate_lines @page
      redirect_to @page, :notice => "Successfully created page."
    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page.content = show_magic(@page.lines)
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])

      generate_lines @page
      redirect_to @page, :notice  => "Successfully updated page."
    else
      render :action => 'edit'
    end
  end

  def destroy

    @page = Page.find(params[:id])

    compare = @page.compare_id
    @page.destroy
    redirect_to pages_url(:compare_id => compare.to_s), :notice => "Successfully destroyed page."
  end

  def generate_lines page

    page.lines.each do |line| 
      line.destroy
    end


    str = page.content
    if string_is_clean_from_equality? str

      str.gsub!(',' , ',=')
      str.gsub!('.' , '.=')

      str.gsub!('!' , '!=')
      str.gsub!(':' , ':=')
    end



    lines  = str.split('=')
    counter = 1



    lines.each do |item|
      new_line  =       page.lines.new(:pos => counter , :page_id => page.id , :parent_id => page.id , :content => item)
      new_line.save
      counter += 1
    end


  end

  def push 

    @page = Page.find(params[:id])

    line = @page.lines.find(params[:line_id])
    #line = Page.lines.find(params[:id])
    pos = line.pos 
    #parent = line.parent_id
    #@page  = Page.find(line.page_id)


    @line = @page.lines.new(:parent_id => line.page_id , :pos => pos , :content => "+")
    @line.save
    #render :controller => 'page' , :action => 'show' , :page_id => parent.to_s

    #show_page_path(:page_id => parent.to_s)

    redirect_to pages_path :compare_id => @page.compare_id
    #lines_url , :page_id => parent.to_s
  end


  private 
  def show_magic lines
    arr = []
    lines.each do |line|
      arr <<  line.content
    end
    str = arr.join('=')
    str
  end
  def find_compare
    @compare = Compare.find(params[:compare_id])
  end
  def string_is_clean_from_equality? str
    if str.split('=').length < 5
      true
    end
  end
end
#for line in lines #.each do |line|
# line.save


