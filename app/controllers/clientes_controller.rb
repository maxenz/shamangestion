class ClientesController < ApplicationController
  # GET /clientes
  # GET /clientes.json
    before_filter :authenticate_user!
  def index
    #@clientes = Cliente.all
    @clientes = Cliente.all(:joins => :clientes_contactos, :select => "clientes.*, clientes_contactos.telefono, clientes_contactos.email ",:conditions => ["clientes_contactos.flgPrincipal = ?", 1])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clientes }
    end
  end

  # GET /clientes/new
  # GET /clientes/new.json
  def new
    
    @cliente = Cliente.new
    @cliente.clientes_contactos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cliente }
    end
  end

  # GET /clientes/1/edit
  def edit

    @cliente = Cliente.find(params[:id])
    @cliente_contactos = ClientesContacto.where(["cliente_id = ?", @cliente])
    @cliente_licencias = ClientesLicencia.where(["cliente_id = ?", @cliente])
    @cliente_gestiones = ClientesGestion.where("cliente_id = ?", @cliente).order('created_at DESC')
    @cliente_terminales = ClientesTerminal.where(["cliente_id = ?", @cliente])
    @usuarios_clientes = UsuariosCliente.where(["cliente_id = ?", @cliente])
    
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(params[:cliente])

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to clientes_url }
        format.json { render json: @cliente, status: :created, location: @cliente }
      else
        format.html { render action: "new" }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clientes/1
  # PUT /clientes/1.json
  def update
    cliente = Cliente.find(params[:id])

    respond_to do |format|
      if cliente.update_attributes(params[:cliente])
        format.html { redirect_to clientes_url }
        format.json { head :no_content }
      else
      e = 'Error en el cliente y/o su contacto principal.'
      cliente.errors.add(:base, e)
      flash[:error] = "#{e}"
        format.html { redirect_to action: :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy

    respond_to do |format|
      format.html {redirect_to clientes_url}
      format.json { head :no_content }
    end
  end

def get_clientes_todos

  clientes = Cliente.all(:joins => :clientes_contactos,:select => 'clientes.*,clientes_contactos.telefono, clientes_contactos.email',:conditions => 'clientes_contactos.flgPrincipal = 1')
  return clientes

end

def get_clientes_vendidos

  clientes = Cliente.all(:joins => :clientes_contactos,:select => 'clientes.*,clientes_contactos.telefono, clientes_contactos.email',:conditions => 'clientes.id IN (SELECT cliente_id FROM clientes_licencias) AND clientes_contactos.flgPrincipal = 1')
  return clientes

end

def get_clientes_en_gestion

  clientes = Cliente.all(:joins => :clientes_contactos,:select => 'clientes.*,clientes_contactos.telefono,clientes_contactos.email',:conditions => 'clientes.id NOT IN (SELECT cliente_id FROM clientes_licencias) AND clientes_contactos.flgPrincipal = 1')  
  return clientes

end

def update_clientes

  pId = params[:pId].to_i

  case pId
  when 1
    clientes = get_clientes_vendidos
  when 2
    clientes = get_clientes_en_gestion
  else
    clientes = get_clientes_todos
  end

  @clientes = clientes.to_json(
    :include => {
      :clientes_gestiones => {
        :include => :estado
        },
      :localidad => {
        :include => { 
          :provincia => {
            :include => :pais
          },
        },
      },
    }
  )

  respond_to do |format|
    format.html  # index.html.erb 
    format.json { render :content_type => 'application/json',:text => '{"aaData": ' + @clientes + '}' }       
  end
end

end

