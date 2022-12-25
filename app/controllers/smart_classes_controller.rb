class SmartClassesController < ApplicationController
  before_action :set_smart_class, only: [:edit, :update, :show]
  def index
    @smart_classes = SmartClass.all
  end

  def new
    @smart_class = SmartClass.new
  end

  def create
    @smart_class = SmartClass.new(smart_class_params)

    if @smart_class.save
      redirect_to @smart_class, notice: 'Create class successfull'
    else
      flash[:alert] = 'Errors'
      render :new
    end
  end

  def edit
  end

  # PATCH/PUT /smart_classes/1
  def update
    if @smart_class.update(smart_class_params)
      redirect_to @smart_class, notice: 'Update class successfull'
    else
      flash[:alert] = 'Errors'
      render :edit
    end
  end

  # DELETE /smart_classes/1
  def destroy
    @smart_class.destroy
    redirect_to smart_classes_path, notice: 'Destroy class successfull'
  end

  def show
    students_go_out = []
    students_in_side = []
    @smart_class.students.map do |student|
      if student.time_records.last&.end_time.present? || student.time_records.blank?
        students_in_side << student
      else
        students_go_out << student if student.time_records.last.end_time.nil?
      end
    end
    students_go_out_ids = students_go_out.pluck :id
    students_go_out = Student.includes(:time_records).where(id: students_go_out_ids).order("time_records.start_time DESC")
    @students = students_go_out + students_in_side
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_smart_class
    @smart_class = SmartClass.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def smart_class_params
    parameters_list = [
      :class_code,
      :name
    ]

    params.require(:smart_class).permit(parameters_list)
  end
end
