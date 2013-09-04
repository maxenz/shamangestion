class TipoTerminalesController < ApplicationController
  # GET /tipo_terminales
  # GET /tipo_terminales.json
  def index
    @tipo_terminales = TipoTerminal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_terminales }
    end
  end

  # GET /tipo_terminales/1
  # GET /tipo_terminales/1.json
  def show
    @tipo_terminal = TipoTerminal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_terminal }
    end
  end

  # GET /tipo_terminales/new
  # GET /tipo_terminales/new.json
  def new
    @tipo_terminal = TipoTerminal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_terminal }
    end
  end

  # GET /tipo_terminales/1/edit
  def edit
    @tipo_terminal = TipoTerminal.find(params[:id])
  end

  # POST /tipo_terminales
  # POST /tipo_terminales.json
  def create
    @tipo_terminal = TipoTerminal.new(params[:tipo_terminal])

    respond_to do |format|
      if @tipo_terminal.save
        format.html { redirect_to estados_url }
        format.json { render json: @tipo_terminal, status: :created, location: @tipo_terminal }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_terminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_terminales/1
  # PUT /tipo_terminales/1.json
  def update
    @tipo_terminal = TipoTerminal.find(params[:id])

    respond_to do |format|
      if @tipo_terminal.update_attributes(params[:tipo_terminal])
        format.html { redirect_to tipo_terminales_url }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_terminales.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_terminales/1
  # DELETE /tipo_terminales/1.json
  def destroy
    begin
    @tipo_terminal = TipoTerminal.find(params[:id])
    @tipo_terminal.destroy
    rescue ActiveRecord::DeleteRestrictionError => e
      @tipo_terminal.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to tipo_terminales_url
    end
  end
end
