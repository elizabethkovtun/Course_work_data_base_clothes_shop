class CategoriesController < ApplicationController

	  def index
    @categories = Category.all.paginate(page: params[:page], per_page: 6)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  def show
    @category = Category.find(params[:id])
        @products = Product.where(category_id: params[:id]).paginate(page: params[:page], per_page: 6)
    if params[:sort] == 'lowPrice'
      @products = Product.where(category_id: params[:id]).order(price: :ASC).paginate(page: params[:page], per_page: 6)
    elsif params[:sort] == 'highPrice'
      @products = Product.where(category_id: params[:id]).order(price: :DESC).paginate(page: params[:page], per_page: 6)
    elsif params[:sort] == 'alphabetAsc'
      @products = Product.where(category_id: params[:id]).order(name: :ASC).paginate(page: params[:page], per_page: 6)
    elsif params[:sort] == 'alphabetDesc'
      @products = Product.where(category_id: params[:id]).order(name: :DESC).paginate(page: params[:page], per_page: 6)
    elsif params[:min] || params[:max]
      @products = Product.where(category_id: params[:id], price: [params[:min]].first..[params[:max]].last).paginate(page: params[:page], per_page: 6)
    end
   
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @category = Category.new(:parent_id => params[:parent_id])
  end


private

  def category_params
      params.require(:category).permit(:title, :ancestry)
    end

end
