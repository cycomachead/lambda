class SubmissionsController < ApplicationController

  def submit_grade
    puts 'OLD SUBMIT GRADE'
    puts 'Params: ', params
    puts 'SESSION:  ', session
    redirect_to '/', flash[:success] => 'Posted a grade...sorta'
    debugger
  end
end