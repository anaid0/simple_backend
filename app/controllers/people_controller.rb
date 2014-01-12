class PeopleController < ApplicationController
  include ActionController::MimeResponds
  # GET /people
  # GET /people.json
  def index
    @people = Person.all
    respond_to do |format|
      format.json { render json: @people }
    end
  end

  def create_sample_data
    @sample_list = []
    @sample_list.append(Person.new(:name => "Adam", :surname => "Kowalski"))
    @sample_list.append(Person.new(:name => "Jan", :surname => "Nowak"))
    @sample_list.append(Person.new(:name => "Anna", :surname => "Kwiatkowska"))
    @sample_list.append(Person.new(:name => "Ignacy", :surname => "Zielinski"))
    @sample_list.append(Person.new(:name => "Sylwia", :surname => "Pawlowska"))
    @sample_list.append(Person.new(:name => "Kazimierz", :surname => "Zawadzki"))
    @sample_list.append(Person.new(:name => "Dominika", :surname => "Kucharska"))
    @sample_list.each do |p|
      p.save
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])

    render json: @person
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])

    if @person.save
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    @person = Person.find(params[:id])

    if @person.update(params[:person])
      head :no_content
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    head :no_content
  end
end
