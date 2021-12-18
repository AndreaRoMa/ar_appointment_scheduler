class AvailableCoachesController < ApplicationController
  before_action :set_available_coach, only: %i[ show edit update destroy ]

  # GET /available_coaches or /available_coaches.json
  def index
    @available_coaches = AvailableCoach.all
  end

  # GET /available_coaches/1 or /available_coaches/1.json
  def show
  end

  # GET /available_coaches/new
  def new
    @available_coach = AvailableCoach.new
  end

  # GET /available_coaches/1/edit
  def edit
  end

  # POST /available_coaches or /available_coaches.json
  def create
    @available_coach = AvailableCoach.new(available_coach_params)

    respond_to do |format|
      if @available_coach.save
        format.html { redirect_to available_coach_url(@available_coach), notice: "Available coach was successfully created." }
        format.json { render :show, status: :created, location: @available_coach }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @available_coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /available_coaches/1 or /available_coaches/1.json
  def update
    respond_to do |format|
      if @available_coach.update(available_coach_params)
        format.html { redirect_to available_coach_url(@available_coach), notice: "Available coach was successfully updated." }
        format.json { render :show, status: :ok, location: @available_coach }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @available_coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /available_coaches/1 or /available_coaches/1.json
  def destroy
    @available_coach.destroy

    respond_to do |format|
      format.html { redirect_to available_coaches_url, notice: "Available coach was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_available_coach
      @available_coach = AvailableCoach.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def available_coach_params
      params.require(:available_coach).permit(:name, :day_of_week, :available_at, :available_until, :schedule_id)
    end
end
