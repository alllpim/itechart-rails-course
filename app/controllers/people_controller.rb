# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :find_person, only: %i[show edit update destroy persons_finances]
  before_action :require_same_user, only: %i[destroy edit update]
  before_action :find_finance, only: %i[show edit update destroy persons_finances]

  # GET /people or /people.json
  def index
    @people = current_user.person
  end

  # GET /people/1 or /people/1.json
  def show; end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit; end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)
    @person.user = current_user
    if @person.save
      flash[:notice] = 'Person was successfully created.'
      redirect_to people_path
    else
      render :new
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    if @person.update(person_params)
      flash[:notice] = 'Person updated successfully'
      redirect_to people_path
    else
      render :edit
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    if @person.destroy
      flash[:notice] = 'Person deleted successfully'
    else
      flash[:alert] = 'You can\'t do this. It\'s your last person'
    end
    redirect_to people_path
  end

  def find_person
    if Person.exists?(params[:id])
      @person = Person.find(params[:id])
    else
      redirect_to errors_not_found_path
    end
  end

  def persons_finances; end

  private

  # Use callbacks to share common setup or constraints between actions.

  def find_finance
    if Finance.exists?(params[:id])
      @finances = find_person.finances
    else
      redirect_to errors_not_found_path
    end
  end

  def require_same_user
    person = Person.find(params[:id])
    return if current_user == person.user

    flash[:alert] = 'You can\'t do this'
    redirect_to root_path
  end

  def first_name
    @person = Person.first_name
  end

  # Only allow a list of trusted parameters through.
  def person_params
    params.require(:person).permit(:first_name, :last_name, :type_name)
  end
end
