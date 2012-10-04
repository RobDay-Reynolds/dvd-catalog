class DvdsController < ApplicationController
  # GET /dvds
  # GET /dvds.json
  def index
    if params[:name_search] && params[:name_search].length > 0
      @dvds = Dvd.search_name(params[:name_search])
    elsif params[:actor_search]
      @dvds = Dvd.search_actor(params[:actor_search])
    elsif params[:director_search]
      @dvds = Dvd.search_director(params[:director_search])
    else
      @dvds = Dvd.all
    end
    @actors = Actor.all
    @directors = Director.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dvds }
    end
  end

  # GET /dvds/1
  # GET /dvds/1.json
  def show
    @dvd = Dvd.find(params[:id])
    @actors = @dvd.actors
    if @dvd.director_id
      @director = Director.find(@dvd.director_id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dvd }
    end
  end

  # GET /dvds/new
  # GET /dvds/new.json
  def new
    @dvd = Dvd.new
    @directors = Director.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dvd }
    end
  end

  # GET /dvds/1/edit
  def edit
    @dvd = Dvd.find(params[:id])
    @directors = Director.all
  end

  # POST /dvds
  # POST /dvds.json
  def create
    @dvd = Dvd.new(params[:dvd])
    if @dvd.save
        @dvd.actors = Actor.find(params[:actor_ids]) if params[:actor_ids]
    end

    respond_to do |format|
      if @dvd.save
        format.html { redirect_to @dvd, notice: 'Dvd was successfully created.' }
        format.json { render json: @dvd, status: :created, location: @dvd }
      else
        format.html { render action: "new" }
        format.json { render json: @dvd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dvds/1
  # PUT /dvds/1.json
  def update
    @dvd = Dvd.find(params[:id])
    if @dvd.update_attributes(params[:dvd])
        @dvd.actors = Actor.find(params[:actor_ids]) if params[:actor_ids]
    end

    respond_to do |format|
      if @dvd.update_attributes(params[:dvd])
        format.html { redirect_to @dvd, notice: 'Dvd was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dvd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dvds/1
  # DELETE /dvds/1.json
  def destroy
    @dvd = Dvd.find(params[:id])
    @dvd.destroy

    respond_to do |format|
      format.html { redirect_to dvds_url }
      format.json { head :no_content }
    end
  end
end
