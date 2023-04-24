class AttendancesController < ApplicationController
  def index
    time = Time.now
    @year = time.year
    @month = time.month
    @day = time.day
  end
end
