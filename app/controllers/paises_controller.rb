class PaisesController < ApplicationController
  # GET /paises
  # GET /paises.json
    before_filter :authenticate_user!
  def index
    @paises = Pais.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @paises }
    end
  end

  # GET /paises/new
  # GET /paises/new.json
  def new
    @pais = Pais.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pais }
    end
  end

  # GET /paises/1/edit
  def edit
    @pais = Pais.find(params[:id])
  end

  # POST /paises
  # POST /paises.json
  def create
    @pais = Pais.new(params[:pais])
  

    respond_to do |format|
       if @pais.save
        format.html { redirect_to paises_url }
        format.json { render json: @pais, status: :created, location: @pais }
      else
         format.html { render action: "new" }
         format.json { render json: @pais.errors, status: :unprocessable_entity }
       end
     end
   end

  # PUT /paises/1
  # PUT /paises/1.json
  def update
    @pais = Pais.find(params[:id])

    respond_to do |format|
      if @pais.update_attributes(params[:pais])
        format.html { redirect_to paises_url}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pais.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paises/1
  # DELETE /paises/1.json

  def destroy
    
    begin
      @pais = Pais.find(params[:id])
      @pais.destroy
    rescue ActiveRecord::DeleteRestrictionError => e
      @pais.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to paises_url
    end
  end



  def get_paises
    @paises = Pais.all
  end
end
