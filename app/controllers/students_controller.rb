class StudentsController < ApplicationController

    def index
        students = Student.all 
        render json: students
    end

    def grades
        students = Student.all.order(grade: :desc)
        render json: students
    end
    def highest_grade
        student = Student.where(grade: Student.maximum(:grade)).first
        render json: student.as_json(only: [:first_name, :last_name, :grade])
    end
end
