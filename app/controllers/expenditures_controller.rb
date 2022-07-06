class ExpendituresController < ApplicationController
  before_action :set_expenditure, only: %i[show edit update destroy]

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
    @transaction = Expenditure.find(params[:id])
  end

  # GET /expenditures/new
  def new
    @groups = Group.where(author_id: current_user.id)
    @transaction = Expenditure.new
  end

  # GET /expenditures/1/edit
  def edit
    @transaction = Expenditure.find(params[:id])
  end

  # POST /expenditures or /expenditures.json
  def create
    group_id = params[:expenditure][:group]
    p expenditure_params
    _params = expenditure_params.except(:group)
    @transaction = Expenditure.new(_params)
    @transaction.author_id = current_user.id

    respond_to do |format|
      if @transaction.save
        group_expenditure = GroupExpenditure.new({ group_id:, expenditure_id: @transaction.id })
        group_expenditure.save
        format.html { redirect_to expenditure_url(@transaction), notice: 'Expenditure was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenditures/1 or /expenditures/1.json
  def update
    group_id_new = params[:expenditure][:group]
    expenditure_id = params[:expenditure][:id]
    group_expenditure = GroupExpenditure.where({ expenditure_id: })
    respond_to do |format|
      if @transaction.update(expenditure_params.except(:group))
        group_expenditure.update({ group_id: group_id_new, expenditure_id: })
        format.html { redirect_to expenditure_url(@transaction), notice: 'Expenditure was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenditures/1 or /expenditures/1.json
  def destroy
    group_expenditure = GroupExpenditure.where({ expenditure_id: @transaction.id })
    group_expenditure[0]&.destroy

    @transaction.destroy
    # rescue StandardError
    #   nil
    respond_to do |format|
      format.html { redirect_to expenditures_url, notice: 'Expenditure was successfully destroyed.' }
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
    p params
    params.require(:expenditure).permit(:name, :amount, :group).tap do |expenditure_params|
      expenditure_params.require(:name)
      expenditure_params.require(:amount)
    end
  end
end
