class ChildInfoController < ApplicationController
  def index
    @temp = "hello world"
    @child = ChildInfo.all
    #puts @child
  end
  def show
    @temp = "hello world"
    cnic = session[:nurse_cnic]
    if cnic
      @nurse = NurseInfo.find_by_cnic(cnic)
      @child = ChildInfo.where(:nurse_name => @nurse.name)
    else
      redirect_to login_path
    end
    
    #puts @child
  end
  def new
# puts(params[:name])
    ChildInfo.create!(:name => params[:name], :cnic => session[:nurse_cnic], :family_number => params[:family],:nurse_name => params[:nurse], :date_of_birth => params[:dob], :polio_1 => params[:p1], :polio_2 => params[:p2], :polio_3 => params[:p3], :polio_4 => params[:p4], :measles_1 => params[:m1], :measles_2 => params[:m1])
  end
end



  
