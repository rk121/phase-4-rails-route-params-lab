class StudentsController < ApplicationController

  def index
    if params[:name]
      student = Student.where("first_name LIKE ?", "%" + params[:name] + "%" ).or(Student.where("last_name LIKE ?", "%" + params[:name] + "%" ))
      render json: student
    else 
      students = Student.all
      render json: students
    end
  end

  def show
    student = Student.find_by(id: params[:id])
    render json: student
  end
end
