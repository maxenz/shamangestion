class UsuariosClientesController < ApplicationController
  # GET /usuarios_clientes
  # GET /usuarios_clientes.json
  def index

    if params[:usr].present?

      @pNew = "usr=#{params[:usr]}"
      @usuarios_clientes = get_usuarios_clientes params[:usr], 'usuario_id'

    elsif params[:cli].present?

      @pNew = "cli=#{params[:cli]}"
      @usuarios_clientes = get_usuarios_clientes params[:cli], 'cliente_id'

    else

      @usuarios_clientes = UsuariosCliente.all

    end
 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usuarios_clientes }
    end
  end

  def get_usuarios_clientes parametro, filtro

    return UsuariosCliente.where(" #{filtro} = ?", parametro)

  end

  # GET /usuarios_clientes/1
  # GET /usuarios_clientes/1.json
  def show

    @usuarios_cliente = UsuariosCliente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usuarios_cliente }
    end
  end

  # GET /usuarios_clientes/new
  # GET /usuarios_clientes/new.json
  def new
    @usuarios_cliente = UsuariosCliente.new

    if params[:usr].present?

      @usuarios_cliente.usuario_id = params[:usr]

    else params[:cli].present?

      @usuarios_cliente.cliente_id = params[:cli]

    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuarios_cliente }
    end
  end

  # GET /usuarios_clientes/1/edit
  def edit
    @usuarios_cliente = UsuariosCliente.find(params[:id])
  end

  # POST /usuarios_clientes
  # POST /usuarios_clientes.json
  def create

    @usuarios_cliente = UsuariosCliente.new(params[:usuarios_cliente])
    cli = @usuarios_cliente.cliente_id
    respond_to do |format|
      if @usuarios_cliente.save
        format.html { redirect_to :action => "edit", :id => cli, :controller => "clientes" }
      else
        format.html { render action: "new" }
        format.json { render json: @usuarios_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usuarios_clientes/1
  # PUT /usuarios_clientes/1.json
  def update

    @usuarios_cliente = UsuariosCliente.find(params[:id])
    cli = @usuarios_cliente.cliente_id

    respond_to do |format|
      if @usuarios_cliente.update_attributes(params[:usuarios_cliente])
        format.html { redirect_to :action => "edit", :id => cli, :controller => "clientes" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usuarios_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios_clientes/1
  # DELETE /usuarios_clientes/1.json
  def destroy
    @usuarios_cliente = UsuariosCliente.find(params[:id])
    cli = @usuarios_cliente.cliente_id
    @usuarios_cliente.destroy

    respond_to do |format|
      format.html { redirect_to :action => "edit", :id => cli, :controller => "clientes"}
      format.json { head :no_content }
    end
  end
end
