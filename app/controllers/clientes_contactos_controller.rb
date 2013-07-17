class ClientesContactosController < ApplicationController
  # GET /clientes_contactos
  # GET /clientes_contactos.json
  before_filter :authenticate_user!
  def index
    @clientes_contactos = ClientesContacto.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clientes_contactos }
    end
  end

  def get_contactos
    @cliente_id = params[:cliente_id]
    @contactos = ClientesContacto.where(["cliente_id = ?", @cliente_id])
    respond_to do |format|
      format.json { render json: @contactos }
    end
  end

  # GET /clientes_contactos/1
  # GET /clientes_contactos/1.json
  def show
    @clientes_contacto = ClientesContacto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clientes_contacto }
    end
  end

  # GET /clientes_contactos/new
  # GET /clientes_contactos/new.json
  def new
    @cliente = Cliente.find(params[:cliente_id])
    @clientes_contacto = @cliente.clientes_contactos.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clientes_contacto }
    end
  end

  # GET /clientes_contactos/1/edit
  def edit
    @cliente = Cliente.find(params[:cliente_id])
    @clientes_contacto = @cliente.clientes_contactos.find(params[:id])
  end

  # POST /clientes_contactos
  # POST /clientes_contactos.json
  def create


    paramsContacto = params[:clientes_contacto]
    @cliente = Cliente.find(params[:cliente_id])
    @clientes_contacto = @cliente.clientes_contactos.new(paramsContacto)
    @contactos = @cliente.clientes_contactos

    respond_to do |format|

      if @clientes_contacto.save
        if params['flgPrincipal'] = 1
          @contactos.each do |cont|
            if cont != @clientes_contacto
              cont.flgPrincipal = 0
              cont.save
            end
          end
        end

        format.html { redirect_to edit_cliente_path(@cliente) }
        format.json { render json: @clientes_contacto, status: :created, location: @clientes_contacto }
      else
        format.html { render action: "new" }
        format.json { render json: @clientes_contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clientes_contactos/1
  # PUT /clientes_contactos/1.json
  def update

    @cliente = Cliente.find(params[:cliente_id])
    @clientes_contacto = @cliente.clientes_contactos.find(params[:id])
    @contactos = @cliente.clientes_contactos
    if tiene_un_solo_contacto @cliente
      respond_to do |format|
        @clientes_contacto.update_attributes(params[:clientes_contacto])
        @clientes_contacto.flgPrincipal = 1
        @clientes_contacto.save
        format.html { redirect_to edit_cliente_path(@cliente) }

      end

    else
      respond_to do |format|
      if @clientes_contacto.update_attributes(params[:clientes_contacto])
        if params['flgPrincipal'] == 1
          @contactos.each do |cont|
            if cont != @clientes_contacto
              cont.flgPrincipal = 0
              cont.save
            end
          end
        end
        format.html { redirect_to edit_cliente_path(@cliente) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clientes_contacto.errors, status: :unprocessable_entity }
      end
    end
    end
    
  end

  # DELETE /clientes_contactos/1
  # DELETE /clientes_contactos/1.json
  def destroy

    @cliente = Cliente.find(params[:cliente_id])
    @contactos = @cliente.clientes_contactos
    @clientes_contacto = ClientesContacto.find(params[:id])

    if tiene_un_solo_contacto @cliente
      respond_to do |format|
        format.html {redirect_to edit_cliente_path(@clientes_contacto.cliente), notice: 'El cliente debe tener al menos un contacto principal.'}
      end
    else
      if params["flgPrincipal"] = 1
        @nuevo_cont_principal = @contactos.where("id <> ?",params[:id]).first
        @nuevo_cont_principal.flgPrincipal = 1
        @nuevo_cont_principal.save
      end
      @clientes_contacto.destroy
      respond_to do |format|
        format.html {redirect_to edit_cliente_path(@clientes_contacto.cliente) }
        format.json { head :no_content }
      end
    end

  end

  def tiene_un_solo_contacto(cliente)

    contactos = cliente.clientes_contactos
    cant_contactos = contactos.size
    if cant_contactos == 1
      return true
    else
      return false
    end

  end
end
