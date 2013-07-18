class LicenciasLogsController < ApplicationController

before_filter :authenticate_user!

def index
    @licencias_logs = LicenciasLog.order("created_at DESC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @licencias_logs }
    end
  end

end
