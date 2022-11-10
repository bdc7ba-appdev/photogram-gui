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

  def add_user
    new_user = params.fetch("input_username")
    a_new_user = User.new

    a_new_user.username = new_user
    a_new_user.save

    redirect_to("/users/"+a_new_user.username)
  end

  def update

    orig_user = params.fetch("modify_user")
    matching_user = User.where({:id => orig_user})
    the_user = matching_user.at(0)

    the_user.username

    new_name = params.fetch("input_username")
    
    the_user.username = new_name

    the_user.save

    redirect_to("/users/"+the_user.username)

    # render({:template => "user_templates/updates.html.erb"})

  end 


end
