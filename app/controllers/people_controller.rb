class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people or /people.json
  def index
    @people = current_user.person
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)
    @person.user = current_user
    if @person.save
      flash[:notice] = 'Person was successfully created.'
      redirect_to person_url
    else
      render :new
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    if @person.update(person_params)
      flash[:notice] = 'Person updated successfully'
      redirect_to person_url
    else
      render :edit
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end


  def find_person
    @person = Person.find(params[:id])
  end


    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :type_name)
    end
end
