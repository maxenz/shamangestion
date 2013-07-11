class ClientesLicenciasController < ApplicationController
  # GET /clientes_licencias
  # GET /clientes_licencias.json
  def index
    @clientes_licencias = ClientesLicencia.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clientes_licencias }
    end
  end

  # GET /clientes_licencias/1
  # GET /clientes_licencias/1.json
  def show
    @clientes_licencia = ClientesLicencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clientes_licencia }
    end
  end

  # GET /clientes_licencias/new
  # GET /clientes_licencias/new.json
  def new

    @cliente = Cliente.find(params[:cliente_id])
    @clientes_licencia = @cliente.clientes_licencias.new
    @lic_disponibles = Licencia.all.select {|licencia| licencia.cliente.nil?}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clientes_licencia }
    end
  end

  # GET /clientes_licencias/1/edit
  def edit
    @cliente = Cliente.find(params[:cliente_id])
    @clientes_licencia = @cliente.clientes_licencias.find(params[:id])
  end

  # POST /clientes_licencias
  # POST /clientes_licencias.json
  def create

    @cliente = Cliente.find(params[:cliente_id])
    @clientes_licencia = @cliente.clientes_licencias.new(params[:clientes_licencia])

    respond_to do |format|
      if @clientes_licencia.save
        format.html { redirect_to edit_cliente_path(@cliente) }
        format.json { render json: @clientes_licencia, status: :created, location: @clientes_licencia }
      else
        format.html { render action: "new" }
        format.json { render json: @clientes_licencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clientes_licencias/1
  # PUT /clientes_licencias/1.json
  def update
    
    @cliente = Cliente.find(params[:cliente_id])
    @clientes_licencia = @cliente.clientes_licencias.find(params[:id])

    respond_to do |format|
      if @clientes_licencia.update_attributes(params[:clientes_licencia])
        format.html { redirect_to edit_cliente_path(@cliente) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clientes_licencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes_licencias/1
  # DELETE /clientes_licencias/1.json
  def destroy
    @clientes_licencia = ClientesLicencia.find(params[:id])
    @clientes_licencia.destroy

    respond_to do |format|
      format.html { redirect_to edit_cliente_path(@clientes_licencia.cliente) }
      format.json { head :no_content }
    end
  end
end
