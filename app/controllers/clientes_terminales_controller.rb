class ClientesTerminalesController < ApplicationController
  # GET /clientes_terminales
  # GET /clientes_terminales.json
  def index
    @clientes_terminales = ClientesTerminal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clientes_terminales }
    end
  end

  # GET /clientes_terminales/1
  # GET /clientes_terminales/1.json
  def show
    @clientes_terminal = ClientesTerminal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clientes_terminal }
    end
  end

  # GET /clientes_terminales/new
  # GET /clientes_terminales/new.json
  def new

    @cliente = Cliente.find(params[:cliente_id])
    @clientes_terminal = @cliente.clientes_terminales.new

  end

  # GET /clientes_terminales/1/edit
  def edit
    @cliente = Cliente.find(params[:cliente_id])
    @clientes_terminal = @cliente.clientes_terminales.find(params[:id])
  end

  # POST /clientes_terminales
  # POST /clientes_terminales.json
  def create

    @cliente = Cliente.find(params[:cliente_id])
    @clientes_terminal = @cliente.clientes_terminales.new(params[:clientes_terminal])

    respond_to do |format|
      if @clientes_terminal.save
        format.html { redirect_to edit_cliente_path(@cliente) }
        format.json { render json: @clientes_terminal, status: :created, location: @clientes_terminal }
      else
        format.html { render action: "new" }
        format.json { render json: @clientes_terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clientes_terminales/1
  # PUT /clientes_terminales/1.json
  def update
    @cliente = Cliente.find(params[:cliente_id])
    @clientes_terminal = @cliente.clientes_terminales.find(params[:id])

    respond_to do |format|
      if @clientes_terminal.update_attributes(params[:clientes_terminal])
        format.html { redirect_to edit_cliente_path(@cliente) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clientes_terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes_terminales/1
  # DELETE /clientes_terminales/1.json
  def destroy
    @clientes_terminal = ClientesTerminal.find(params[:id])
    @clientes_terminal.destroy

    respond_to do |format|
      format.html { redirect_to edit_cliente_path(@clientes_terminal.cliente) }
      format.json { head :no_content }
    end
  end
end
