class TimeRecordsController < ApplicationController
  before_action :set_time_record, only: %i[ show edit update destroy ]

  def index
    @time_records = TimeRecord.all
  end

  def show
  end

  def new
    student = Student.find(params[:student_id])

    current_time_records = student.time_records
    if current_time_records.present?
      recently_time_record = current_time_records.order(created_at: :desc).first
      redirect_to edit_time_record_path(recently_time_record) if recently_time_record.end_time.nil?
    end

    @time_record = TimeRecord.new
    @time_record.start_time = Time.current
    @time_record.student = student
  end

  def edit
    @time_record.end_time = Time.current
  end

  def create
    @time_record = TimeRecord.new(time_record_params)

    respond_to do |format|
      if @time_record.save
        format.html { redirect_to smart_class_path(@time_record.student.smart_class_id), notice: "Create time_record successfully" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @time_record.update(time_record_params)
        format.html { redirect_to smart_class_path(@time_record.student.smart_class_id), notice: "Time record was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_time_record
    @time_record = TimeRecord.find(params[:id])
  end

  def time_record_params
    params.require(:time_record).permit(:title, :description, :start_time, :end_time, :student_id)
  end
end
