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
        student = Student.where(grade: Student.maximum(:grade)).pluck(:first_name, :last_name, :grade).first
        render json: {first_name: student[0], last_name: student[1], grade: student[2]}
    end
end
