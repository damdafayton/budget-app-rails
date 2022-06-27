class GroupExpendituresController < ApplicationController
  before_action :set_group_expenditure, only: %i[ show edit update destroy ]

  # GET /group_expenditures or /group_expenditures.json
  def index
    @group_expenditures = GroupExpenditure.all
  end

  # GET /group_expenditures/1 or /group_expenditures/1.json
  def show
  end

  # GET /group_expenditures/new
  def new
    @group_expenditure = GroupExpenditure.new
  end

  # GET /group_expenditures/1/edit
  def edit
  end

  # POST /group_expenditures or /group_expenditures.json
  def create
    @group_expenditure = GroupExpenditure.new(group_expenditure_params)

    respond_to do |format|
      if @group_expenditure.save
        format.html { redirect_to group_expenditure_url(@group_expenditure), notice: "Group expenditure was successfully created." }
        format.json { render :show, status: :created, location: @group_expenditure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_expenditures/1 or /group_expenditures/1.json
  def update
    respond_to do |format|
      if @group_expenditure.update(group_expenditure_params)
        format.html { redirect_to group_expenditure_url(@group_expenditure), notice: "Group expenditure was successfully updated." }
        format.json { render :show, status: :ok, location: @group_expenditure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_expenditures/1 or /group_expenditures/1.json
  def destroy
    @group_expenditure.destroy

    respond_to do |format|
      format.html { redirect_to group_expenditures_url, notice: "Group expenditure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_expenditure
      @group_expenditure = GroupExpenditure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_expenditure_params
      params.require(:group_expenditure).permit(:group_id, :expenditure_id)
    end
end
