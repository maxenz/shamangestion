class LicenciasController < ApplicationController
  # GET /licencias
  # GET /licencias.json
    before_filter :authenticate_user!
  def index
    @licencias = Licencia.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @licencias }
    end
  end

  # GET /licencias/1
  # GET /licencias/1.json
  def show
    @licencia = Licencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @licencia }
    end
  end

  # GET /licencias/new
  # GET /licencias/new.json
  def new
    @licencia = Licencia.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @licencia}
    end
  end

  # GET /licencias/1/edit
  def edit
    @licencia = Licencia.find(params[:id])
    @licencia_id = params[:id]
    @cliente_licencia = ClientesLicencia.where(["licencia_id = ?", @licencia_id])   
  end

  # POST /licencias
  # POST /licencias.json
  def create
    @licencia = Licencia.new(params[:licencia])

    respond_to do |format|
      if @licencia.save
        format.html { redirect_to licencias_url }
        format.json { render json: @licencia, status: :created, location: @licencia }
      else
        format.html { render action: "new" }
        format.json { render json: @licencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /licencias/1
  # PUT /licencias/1.json
  def update
    @licencia = Licencia.find(params[:id])

    respond_to do |format|
      if @licencia.update_attributes(params[:licencia])
        format.html { redirect_to licencias_url}
        format.json { head :no_content }
      else
        format.html { redirect_to licencias_url  }
        format.json { render json: @licencia.errors, status: :unprocessable_entity }
      end
    end
  end

 def destroy
    
    begin
      @licencia = Licencia.find(params[:id])
      @licencia.destroy
    rescue ActiveRecord::DeleteRestrictionError => e
      @licencia.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to licencias_url
    end
  end

end
