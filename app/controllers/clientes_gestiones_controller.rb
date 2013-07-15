class ClientesGestionesController < ApplicationController

  def new
    @cliente = Cliente.find(params[:cliente_id])
    @clientes_gestion = @cliente.clientes_gestiones.new
  end

  def destroy
    @clientes_gestion = ClientesGestion.find(params[:id])
    @clientes_gestion.destroy

    respond_to do |format|
      format.html { redirect_to edit_cliente_path(@clientes_gestion.cliente) }
      format.json { head :no_content }
    end
  end

  def index
  end

  def update
    
    @cliente = Cliente.find(params[:cliente_id])
    @clientes_gestion = @cliente.clientes_gestiones.find(params[:id])

    respond_to do |format|
      if @clientes_gestion.update_attributes(params[:clientes_gestion])
        format.html { redirect_to edit_cliente_path(@cliente) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clientes_licencia.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

    @cliente = Cliente.find(params[:cliente_id])
    @clientes_gestion = @cliente.clientes_gestiones.find(params[:id])

  end

def create

    @cliente = Cliente.find(params[:cliente_id])
    @clientes_gestion = @cliente.clientes_gestiones.new(params[:clientes_gestion])

    respond_to do |format|
      if @clientes_gestion.save
        format.html { redirect_to edit_cliente_path(@cliente) }
        format.json { render json: @clientes_licencia, status: :created, location: @clientes_licencia }
      else
        format.html { render action: "new" }
        format.json { render json: @clientes_licencia.errors, status: :unprocessable_entity }
      end
    end
  end

end
