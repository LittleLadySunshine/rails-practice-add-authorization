class ClubsController < ApplicationController

  rescue_from AccessDenied, with: :record_not_found

  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
    if @club.students.include? current_student
    else
      raise AccessDenied
    end
  end



end
