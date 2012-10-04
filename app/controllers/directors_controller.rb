class DirectorsController < ApplicationController
  # GET /directors
  # GET /directors.json
  def index
    if params[:name_search] && params[:name_search].length > 0
      @directors = Director.search_name(params[:name_search])
    elsif params[:age_range_search]
      @directors = Director.search_age_range(params[:age_range_search])
    elsif params[:dvd_search]
      @directors = Director.search_dvd(params[:dvd_search])
    else
      @directors = Director.all
    end
    @dvds = Dvd.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @directors }
    end
  end

  # GET /directors/1
  # GET /directors/1.json
  def show
    @director = Director.find(params[:id])
    @dvds = Dvd.where(:director_id => @director.id)
    now = Time.now.utc.to_date
    if @director.date_of_birth
      dob = @director.date_of_birth.to_date
      @age = now.year - @director.date_of_birth.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @director }
    end
  end

  # GET /directors/new
  # GET /directors/new.json
  def new
    @director = Director.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @director }
    end
  end

  # GET /directors/1/edit
  def edit
    @director = Director.find(params[:id])
  end

  # POST /directors
  # POST /directors.json
  def create
    @director = Director.new(params[:director])

    respond_to do |format|
      if @director.save
        format.html { redirect_to @director, notice: 'Director was successfully created.' }
        format.json { render json: @director, status: :created, location: @director }
      else
        format.html { render action: "new" }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /directors/1
  # PUT /directors/1.json
  def update
    @director = Director.find(params[:id])

    respond_to do |format|
      if @director.update_attributes(params[:director])
        format.html { redirect_to @director, notice: 'Director was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directors/1
  # DELETE /directors/1.json
  def destroy
    @director = Director.find(params[:id])
    @dvds = Dvd.where(:director_id => @director.id)
    @dvds.each do |dvd|
        dvd.director_id = nil
        dvd.save
    end
    @director.destroy

    respond_to do |format|
      format.html { redirect_to directors_url }
      format.json { head :no_content }
    end
  end
end
