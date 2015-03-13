class BallsController < ApplicationController
  before_action :set_ball, only: [:show, :edit, :update, :destroy]

  # GET /balls
  # GET /balls.json
  def index
    @ball = Ball.new
    @balls = Ball.all
  end

  # GET /balls/1
  # GET /balls/1.json
  def show
  end

  # GET /balls/new
  def new
    @ball = Ball.new
  end

  # GET /balls/1/edit
  def edit
  end

  # POST /balls
  # POST /balls.json
  def create
    @balls = Ball.all.order("created_at desc")
    history_nums = @balls.pluck(:num)
    condidate_nums = (1..75).to_a - history_nums
    num = condidate_nums.sample

    redirect_to balls_path and return if num.blank?

    @new_ball = Ball.new(num: num)

    if @new_ball.save
      @ball = Ball.new
      render :index
    else
      render :new
    end

  end

  def reset
    Ball.destroy_all
    redirect_to balls_path
  end

  # PATCH/PUT /balls/1
  # PATCH/PUT /balls/1.json
  def update
    respond_to do |format|
      if @ball.update(ball_params)
        format.html { redirect_to @ball, notice: 'Ball was successfully updated.' }
        format.json { render :show, status: :ok, location: @ball }
      else
        format.html { render :edit }
        format.json { render json: @ball.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /balls/1
  # DELETE /balls/1.json
  def destroy
    @ball.destroy
    respond_to do |format|
      format.html { redirect_to balls_url, notice: 'Ball was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ball
      @ball = Ball.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ball_params
      params.(:ball)
    end
end
