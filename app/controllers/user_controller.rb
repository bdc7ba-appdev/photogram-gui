class UserController < ApplicationController
  def index
    
    @matching_users  = User.all
    @list_of_users = @matching_users.order({:username => :asc})
    
    render({:template => "/user_templates/index.html.erb"})
  end

  def view
    @username = params.fetch("username")
    
    render({:template => "user_templates/view.html.erb"})
  end



end
