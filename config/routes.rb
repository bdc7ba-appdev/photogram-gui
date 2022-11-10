Rails.application.routes.draw do

  get("/", {:controller => "user", :action => "index"})
  
  get("/users", {:controller => "user", :action => "index"})
  get("/users/:username", {:controller => "user", :action => "view"})

  get("/photos", {:controller => "photo", :action => "index"})
  get("/photos/:photo_id", {:controller => "photo", :action => "show"})

  get("/delete_photo/:photo_id", {:controller => "photo", :action => "delete"})

  get("/insert_photo_record", {:controller => "photo", :action => "add_photo"})
  get("/update_photo/:change_id", {:controller => "photo", :action => "update"})
  get("/insert_comment_record", {:controller => "photo", :action => "comment"})


  get("/insert_user_record", {:controller => "user", :action => "add_user"})

  get("/update_user/:modify_user", {:controller => "user", :action => "update" })




end
