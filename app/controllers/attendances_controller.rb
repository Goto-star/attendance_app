class AttendancesController < ApplicationController
  before_action :current_user, only: [:create, :destroy, :update, :edit]

  def index
    time = Time.now
    @year = time.year
    @month = time.month
    @day = time.day
    @attendance = current_user.attendances.build
    @attendances = Attendance.includes(:user)
  end

  def create
    @attendance = current_user.today_attendance
    is_start_work = start_work?(@attendance)
    is_end_work = end_work?(@attendance)

    if (!is_start_work && !is_end_work)
      @attendance = current_user.attendances.build(work_start_time: Time.zone.now)
      flash[:success] = "おはようございます！"
    elsif is_start_work && !is_end_work
      @attendance.work_end_time = Time.zone.now
      flash[:success] = "おつかれさまです！"
    end
    if @attendance.save
      redirect_to attendances_path
    else
      render attendances_path
    end
  end

  def edit
    @attendance = Attendance.find(params[:id])
  end

  def update
    @attendance = Attendance.find(params[:id])
    if @attendance.update(attendance_params)
      flash[:success] = "勤怠を更新しました。"
      redirect_to attendances_path
    else
      render 'edit'
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
    flash[:success] = "削除しました。"
    redirect_to attendances_path
  end

  private

  def attendance_params
    params.require(:attendance).permit(:work_start_time, :work_end_time)
  end
end
