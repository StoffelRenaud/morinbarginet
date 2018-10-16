class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @answers = @reservation.answers.order(id: :desc)
    @answer = Answer.new(answer_params)
    @answer.reservation = @reservation
    @answer.owner = current_user

    if @answer.save
      respond_to do |format|
        format.html { redirect_to reservation_path(@reservation) }
        format.js {}
      end
    else
      respond_to do |format|
        format.html { render 'reservations/show' }
        format.js {}
      end
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
