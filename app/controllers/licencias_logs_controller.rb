class LicenciasLogsController < ApplicationController

	before_filter :authenticate_user!

	def index

	    @licencias_logs = LicenciasLog.find(:all, :order => "created_at DESC")

	    respond_to do |format|
	      format.html
	      format.json { render json: @licencias_logs }
	    end

	end

end
