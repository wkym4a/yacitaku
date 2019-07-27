class OwnersController < ApplicationController

  require 'csv'

  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  # GET /owners
  # GET /owners.json
  def index

    if params[:conditions].blank?
      @owners = Owner.all.order(:id)
    else
      @owners = Owner.search_by_name_partial(params[:conditions][:name]).
                      search_by_name_kana_forward(params[:conditions][:name_kana]).
                      search_by_property_name_partial(params[:conditions][:property_name]).
                      search_by_property_name_kana_forward(params[:conditions][:property_name_kana]).
                      order(:id)
    end

    respond_to do |format|
      format.html { render :index }
      format.js { render :index }
    end

  end

  # GET /owners/1
  # GET /owners/1.json
  def show
  end

  # GET /owners/new
  def new
    @owner = Owner.new
  end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners
  # POST /owners.json
  def create
    @owner = Owner.new(owner_params)

    respond_to do |format|
      if @owner.save
        format.html { redirect_to new_owner_path, notice: 'オーナー情報の作成に成功しました。' }
        # format.html { redirect_to @owner, notice: 'Owner was successfully created.' }
        # format.json { render :show, status: :created, location: @owner }
      else
        format.html { render :new }
        # format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /owners/1
  # PATCH/PUT /owners/1.json
  def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to edit_owner_path, notice: 'Owner was successfully updated.' }
        # format.html { redirect_to @owner, notice: 'Owner was successfully updated.' }
        # format.json { render :show, status: :ok, location: @owner }
      else
        format.html { render :edit }
        # format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url, notice: 'Owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # 在庫情報ダウンロードボタン押下時に呼び出される
  def download
    @owners = Owner.all


    header = ['オーナー名称', '（カナ）', '〒', '住所']
    generated_csv = CSV.generate(row_sep: "\r\n") do |csv|
      csv << header
      @owners.each do |owner|
        csv << [owner.name, owner.name_kana, owner.post_code, owner.address]
      end
    end

    send_data generated_csv.encode(Encoding::CP932, invalid: :replace, undef: :replace),
      filename: 'owner.csv',
      type: 'text/csv; charset=shift_jis'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @owner = Owner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owner_params
      params.require(:owner).permit(:name, :name_kana, :post_code, :address, :tel, :tel2, :fax, :property_name, :property_name_kana, :property_post_code, :property_address, :property_type, :bank, :branch, :account_type, :account_num, :account_name, :memo)
    end
end
