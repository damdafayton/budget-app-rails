class ExpendituresController < ApplicationController
  before_action :set_expenditure, only: %i[ show edit update destroy ]

  def initialize
    super()
    @page_name = 'TRANSACTIONS'
  end

  # GET /expenditures or /expenditures.json
  def index
    @transactions = Expenditure.where(author_id: current_user.id)
  end

  # GET /expenditures/1 or /expenditures/1.json
  def show
  end

  # GET /expenditures/new
  def new
    @groups = Group.where(author_id: current_user.id)
    @transaction = Expenditure.new
  end

  # GET /expenditures/1/edit
  def edit
  end

  # POST /expenditures or /expenditures.json
  def create
    @transaction = Expenditure.new(expenditure_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to expenditure_url(@transaction), notice: "Expenditure was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenditures/1 or /expenditures/1.json
  def update
    respond_to do |format|
      if @transaction.update(expenditure_params)
        format.html { redirect_to expenditure_url(@transaction), notice: "Expenditure was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenditures/1 or /expenditures/1.json
  def destroy
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to expenditures_url, notice: "Expenditure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expenditure
      @transaction = Expenditure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expenditure_params
      params.require(:expenditure).permit(:author_id, :name, :amount)
    end
end
