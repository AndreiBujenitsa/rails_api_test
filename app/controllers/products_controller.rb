class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  after_action only: [:index] { set_pagination_headers(:products) }


  # GET /products
  # GET /products.json
  def index
    @products = Product.formatted.page(params[:page]).per(100)
    render json: @products
  end

  # GET /products/1
  # GET /products/1.json
  def show
    render json: @product
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      head :no_content
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy

    head :no_content
  end

  private

    def set_product
      @product = Product.formatted.find(params[:id])
    end

    def product_params
      ActiveModelSerializers::Deserialization.jsonapi_parse!(params.to_unsafe_h).slice(:name, :description, :price)
    end
end
