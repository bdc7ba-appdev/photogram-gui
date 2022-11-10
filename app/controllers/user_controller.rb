class UserController < ApplicationController
  def index
    
    @matching_users  = User.all
    @list_of_users = @matching_users.order({:username => :asc})
    
    render({:template => "/user_templates/index.html.erb"})
  end

  def view
    @url_username = params.fetch("username")
    @user_matching = User.where({:username => @url_username})

    @the_user = @user_matching.at(0)

    if @the_user == nil
      redirect_to("/404")
    else
      render({:template => "user_templates/view.html.erb"})
    end 
  end



end
