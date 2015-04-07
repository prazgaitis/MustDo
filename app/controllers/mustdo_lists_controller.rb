class MustdoListsController < ApplicationController
  before_action :set_mustdo_list, only: [:show, :edit, :update, :destroy]

  # GET /mustdo_lists
  # GET /mustdo_lists.json
  def index
    @mustdo_lists = MustdoList.all
  end

  # GET /mustdo_lists/1
  # GET /mustdo_lists/1.json
  def show
  end

  # GET /mustdo_lists/new
  def new
    @mustdo_list = MustdoList.new
  end

  # GET /mustdo_lists/1/edit
  def edit
  end

  # POST /mustdo_lists
  # POST /mustdo_lists.json
  def create
    @mustdo_list = MustdoList.new(mustdo_list_params)

    respond_to do |format|
      if @mustdo_list.save
        format.html { redirect_to @mustdo_list, notice: 'Mustdo list was successfully created.' }
        format.json { render :show, status: :created, location: @mustdo_list }
      else
        format.html { render :new }
        format.json { render json: @mustdo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mustdo_lists/1
  # PATCH/PUT /mustdo_lists/1.json
  def update
    respond_to do |format|
      if @mustdo_list.update(mustdo_list_params)
        format.html { redirect_to @mustdo_list, notice: 'Mustdo list was successfully updated.' }
        format.json { render :show, status: :ok, location: @mustdo_list }
      else
        format.html { render :edit }
        format.json { render json: @mustdo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mustdo_lists/1
  # DELETE /mustdo_lists/1.json
  def destroy
    @mustdo_list.destroy
    respond_to do |format|
      format.html { redirect_to mustdo_lists_url, notice: 'Mustdo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mustdo_list
      @mustdo_list = MustdoList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mustdo_list_params
      params.require(:mustdo_list).permit(:title, :category, :description)
    end
end
