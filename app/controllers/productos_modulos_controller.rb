class ProductosModulosController < ApplicationController

  before_filter :authenticate_user!

  def index

    @productos_modulos = ProductosModulo.where( ["producto_id = ?", params[:producto_id] ])
    @producto = Producto.find(params[:producto_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productos_modulos }
    end
  end

  # GET /productos_modulos/1
  # GET /productos_modulos/1.json
  def show

    @productos_modulo = ProductosModulo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @productos_modulo }
    end
  end

  # GET /productos_modulos/new
  # GET /productos_modulos/new.json
  def new

    @producto = Producto.find(params[:producto_id])
    @productos_modulo = @producto.productos_modulos.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @productos_modulo }
    end
  end

  # GET /productos_modulos/1/edit
  def edit
    @producto = Producto.find(params[:producto_id])
    @productos_modulo = ProductosModulo.find(params[:id])
  end

  # POST /productos_modulos
  # POST /productos_modulos.json
  def create

    producto = Producto.find(params[:producto_id])
    @productos_modulo = ProductosModulo.new(params[:productos_modulo])

    respond_to do |format|
      if @productos_modulo.save
        format.html { redirect_to "/productos/#{producto.id}/productos_modulos" }
        format.json { render json: @productos_modulo, status: :created, location: @productos_modulo }
      else
        format.html { render action: "new" }
        format.json { render json: @productos_modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /productos_modulos/1
  # PUT /productos_modulos/1.json
  def update

    producto = Producto.find(params[:producto_id])
    @productos_modulo = ProductosModulo.find(params[:id])

    respond_to do |format|
      if @productos_modulo.update_attributes(params[:productos_modulo])
        format.html { redirect_to "/productos/#{producto.id}/productos_modulos" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @productos_modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos_modulos/1
  # DELETE /productos_modulos/1.json
  def destroy

    @productos_modulo = ProductosModulo.find(params[:id])
    producto = @productos_modulo.producto
    @productos_modulo.destroy

    respond_to do |format|
      format.html { redirect_to "/productos/#{producto.id}/productos_modulos" }
      format.json { head :no_content }
    end
  end
end
