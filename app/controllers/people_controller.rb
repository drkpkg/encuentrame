class PeopleController < ApplicationController
  before_action :set_person, only: [:info, :update, :delete, :generate]

  def index
    @people = Person.where(params_for_search)
  end

  def new
    @person = Person.new
  end

  def info
  end

  def create
    @person = Person.new(params_for_create)
    if @person.save
      redirect_to people_index_path
    else
      flash[:error] = @person.errors
      redirect_to root_path
    end
  end

  def update
    @person.records.push(params_for_update)
    @person.update
    redirect_to info_path(@person)
  end

  def delete
    @person.destroy
    redirect_to people_index_path
  end

  def generate
    render :pdf => "#{@person.complete_name.parameterize}",
           :layout => 'pdf.html.erb',
           encoding: 'utf8'
  end

  private

  def params_for_search
    params.permit(:country,:state,:city)
  end

  def params_for_create
    params.require(:person).permit(:name, :lastname, :age, :sex, :country, :state, :city, :last_location, :description, :contact_info_hash, :photo)
  end

  def params_for_update
    params.require(:person).permit(:new_location, :additional_description)
  end

  def set_person
    @person = Person.find_by(id: params[:id])
  end

end
