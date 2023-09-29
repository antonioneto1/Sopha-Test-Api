class Api::V1::StoresController < ApplicationController
  include Paginable

  before_action :authenticate_api_user!
  before_action :set_store, only: [:show, :update, :destroy]

  # GET /stores
  def index
    @stores = current_api_user.store.all
                              .sorted(params[:sort], params[:dir])
                              .page(current_page)
                              .per(per_page)

    render json: @stores, meta: meta_attributes(@stores), adapter: :json
  end

  # GET /stores/1
  def show
    render json: @store
  end

  # POST /stores
  def create
    @store = Store.new(store_params)

    if @store.save
      render json: @store, status: :created, location: api_store_url(@store)
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stores/1
  def update
    if @store.update(store_params)
      render json: @store
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stores/1
  def destroy
    @store.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = current_api_user.store.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def store_params
      params.require(:store).permit(:name, :user_id)
    end
end