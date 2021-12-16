class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :require_same_signed_user, only: %i[destroy edit update]

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

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
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

  def require_same_signed_user
    person = Person.find(params[:id])
    return if current_user == person.user

    flash[:alert] = 'You can only delete your own person'
    redirect_to root_path
  end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :type_name)
    end
end
