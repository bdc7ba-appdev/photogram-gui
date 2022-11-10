Rails.application.routes.draw do

  get("/", {:controller => "user", :action => "index"})
  
  get("/users", {:controller => "user", :action => "index"})
  get("/users/:username", {:controller => "user", :action => "view"})

  get("/photos", {:controller => "photo", :action => "index"})
  get("/photos/:photo_id", {:controller => "photo", :action => "show"})

  get("/delete_photo/:photo_id", {:controller => "photo", :action => "delete"})

  get("/insert_user_photo")



end
