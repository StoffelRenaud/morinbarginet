class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_reservation, only: [:new, :create]
  before_action :set_answers, only: [:new]

  def new
    @answer = Answer.new
    @nbr_answer = @answers.count
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.reservation = set_reservation
    @answer.owner = current_user
    if @answer.save
      redirect_to new_reservation_answer_path(set_reservation)
    end
  end

  private

  def set_answers
    @answers = Answer.where(reservation_id: params[:reservation_id]).order(id: :desc)
  end

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

  def answer_params
    params.require(:answer).permit(:content)
  end
end
