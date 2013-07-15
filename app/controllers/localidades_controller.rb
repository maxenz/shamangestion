class LocalidadesController < ApplicationController
  before_filter :authenticate_user!
  def get_provincias  
    @pais_id = params[:pais_id]
    @provincias = Provincia.where(["pais_id = ?", @pais_id])
    respond_to do |format|
      format.json { render json: @provincias }
    end
    
  end
  # GET /localidades
  # GET /localidades.json
  def index
    @localidades = Localidad.where("provincia_id = ?", params[:provincia_id])
    @pais = Pais.find(params[:pais_id])
    @provincia = Provincia.find(params[:provincia_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @localidades }
    end
  end

  # GET /localidades/1
  # GET /localidades/1.json
  def show
    @localidad = Localidad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @localidad }
    end
  end

  # GET /localidades/new
  # GET /localidades/new.json
  def new
    @pais = Pais.find(params[:pais_id])
    @provincia = Provincia.find(params[:provincia_id])
    @localidad = Localidad.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @localidad }
    end
  end

  # GET /localidades/1/edit
  def edit
    @localidad = Localidad.find(params[:id])
    @pais = Pais.find(params[:pais_id])
    @provincia = Provincia.find(params[:provincia_id])
  end

  # POST /localidades
  # POST /localidades.json
  def create

    @provincia = Provincia.find(params[:provincia_id])
    @localidad = @provincia.localidades.new(params[:localidad])


    respond_to do |format|
      if @localidad.save
        format.html { redirect_to pais_provincia_localidades_path(@provincia.pais,@provincia) }
        format.json { render json: @localidad, status: :created, location: @localidad }
      else
        format.html { render action: "new" }
        format.json { render json: @localidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /localidades/1
  # PUT /localidades/1.json
  def update
    @localidad = Localidad.find(params[:id])

    respond_to do |format|
      if @localidad.update_attributes(params[:localidad])
        format.html { redirect_to pais_provincia_localidades_path(@localidad.provincia.pais,@localidad.provincia) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @localidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /localidades/1
  # DELETE /localidades/1.json
  def destroy
    
    begin
      @localidad = Localidad.find(params[:id])
      @localidad.destroy
    rescue ActiveRecord::DeleteRestrictionError => e
      @localidad.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to pais_provincia_localidades_path(@localidad.provincia.pais,@localidad.provincia)
    end
  end
end
