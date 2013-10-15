class ClientesLicenciasProductosProductosModulosController < ApplicationController
  # GET /clientes_licencias_productos_productos_modulos
  # GET /clientes_licencias_productos_productos_modulos.json
  def index
    @clientes_licencias_productos_productos_modulos = ClientesLicenciasProductosProductosModulo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clientes_licencias_productos_productos_modulos }
    end
  end

  # GET /clientes_licencias_productos_productos_modulos/1
  # GET /clientes_licencias_productos_productos_modulos/1.json
  def show
    @clientes_licencias_productos_productos_modulo = ClientesLicenciasProductosProductosModulo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clientes_licencias_productos_productos_modulo }
    end
  end

  # GET /clientes_licencias_productos_productos_modulos/new
  # GET /clientes_licencias_productos_productos_modulos/new.json
  def new
    @clientes_licencias_productos_productos_modulo = ClientesLicenciasProductosProductosModulo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clientes_licencias_productos_productos_modulo }
    end
  end

  # GET /clientes_licencias_productos_productos_modulos/1/edit
  def edit
    @clientes_licencias_productos_productos_modulo = ClientesLicenciasProductosProductosModulo.find(params[:id])
  end

  # POST /clientes_licencias_productos_productos_modulos
  # POST /clientes_licencias_productos_productos_modulos.json
  def create
    @clientes_licencias_productos_productos_modulo = ClientesLicenciasProductosProductosModulo.new(params[:clientes_licencias_productos_productos_modulo])

    respond_to do |format|
      if @clientes_licencias_productos_productos_modulo.save
        format.html { redirect_to @clientes_licencias_productos_productos_modulo, notice: 'Clientes licencias productos productos modulo was successfully created.' }
        format.json { render json: @clientes_licencias_productos_productos_modulo, status: :created, location: @clientes_licencias_productos_productos_modulo }
      else
        format.html { render action: "new" }
        format.json { render json: @clientes_licencias_productos_productos_modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clientes_licencias_productos_productos_modulos/1
  # PUT /clientes_licencias_productos_productos_modulos/1.json
  def update
    @clientes_licencias_productos_productos_modulo = ClientesLicenciasProductosProductosModulo.find(params[:id])

    respond_to do |format|
      if @clientes_licencias_productos_productos_modulo.update_attributes(params[:clientes_licencias_productos_productos_modulo])
        format.html { redirect_to @clientes_licencias_productos_productos_modulo, notice: 'Clientes licencias productos productos modulo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clientes_licencias_productos_productos_modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes_licencias_productos_productos_modulos/1
  # DELETE /clientes_licencias_productos_productos_modulos/1.json
  def destroy
    @clientes_licencias_productos_productos_modulo = ClientesLicenciasProductosProductosModulo.find(params[:id])
    @clientes_licencias_productos_productos_modulo.destroy

    respond_to do |format|
      format.html { redirect_to clientes_licencias_productos_productos_modulos_url }
      format.json { head :no_content }
    end
  end
end
