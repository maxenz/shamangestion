class LicenciasController < ApplicationController
  # GET /licencias
  # GET /licencias.json
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
    3.times { @licencia.productos.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @licencia }
    end
  end

  # GET /licencias/1/edit
  def edit
    @licencia = Licencia.find(params[:id])
  end

  # POST /licencias
  # POST /licencias.json
  def create
    @licencia = Licencia.new(params[:licencia])

    respond_to do |format|
      if @licencia.save
        format.html { redirect_to @licencia, notice: 'Licencia was successfully created.' }
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
        format.html { redirect_to @licencia, notice: 'Licencia was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @licencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /licencias/1
  # DELETE /licencias/1.json
  def destroy
    @licencia = Licencia.find(params[:id])
    @licencia.destroy

    respond_to do |format|
      format.html { redirect_to licencias_url }
      format.json { head :no_content }
    end
  end
end
