class ClientesLicenciasProductosController < ApplicationController
  # GET /clientes_licencias_productos
  # GET /clientes_licencias_productos.json
  def index
    @clientes_licencias_productos = ClientesLicenciasProducto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clientes_licencias_productos }
    end
  end

  # GET /clientes_licencias_productos/1
  # GET /clientes_licencias_productos/1.json
  def show
    @clientes_licencias_producto = ClientesLicenciasProducto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clientes_licencias_producto }
    end
  end

  # GET /clientes_licencias_productos/new
  # GET /clientes_licencias_productos/new.json
  def new
    @clientes_licencias_producto = ClientesLicenciasProducto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clientes_licencias_producto }
    end
  end

  # GET /clientes_licencias_productos/1/edit
  def edit
    @clientes_licencias_producto = ClientesLicenciasProducto.find(params[:id])
  end

  # POST /clientes_licencias_productos
  # POST /clientes_licencias_productos.json
  def create
    @clientes_licencias_producto = ClientesLicenciasProducto.new(params[:clientes_licencias_producto])

    respond_to do |format|
      if @clientes_licencias_producto.save
        format.html { redirect_to @clientes_licencias_producto, notice: 'Clientes licencias producto was successfully created.' }
        format.json { render json: @clientes_licencias_producto, status: :created, location: @clientes_licencias_producto }
      else
        format.html { render action: "new" }
        format.json { render json: @clientes_licencias_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clientes_licencias_productos/1
  # PUT /clientes_licencias_productos/1.json
  def update
    @clientes_licencias_producto = ClientesLicenciasProducto.find(params[:id])

    respond_to do |format|
      if @clientes_licencias_producto.update_attributes(params[:clientes_licencias_producto])
        format.html { redirect_to @clientes_licencias_producto, notice: 'Clientes licencias producto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clientes_licencias_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes_licencias_productos/1
  # DELETE /clientes_licencias_productos/1.json
  def destroy
    @clientes_licencias_producto = ClientesLicenciasProducto.find(params[:id])
    @clientes_licencias_producto.destroy

    respond_to do |format|
      format.html { redirect_to clientes_licencias_productos_url }
      format.json { head :no_content }
    end
  end
end
