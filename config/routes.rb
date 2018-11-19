Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  #main dashboard
  get 'dashboard', to: 'students#dashboard', as: :dashboard

  #calendar: index and edit on the same page
  get 'dashboard/calendar', to:'students#availabilities', as: :calendar

  patch 'availability', to: 'availabilities#update'

  post 'availabilities', to:'availabilities#create'
  delete 'availabilities/:id', to:'availabilities#destroy', as: :delete_availability


  get 'dashboard/profile', to:'students#profile', as: :profile
  get 'dashboard/training', to:'students#training', as: :training
  patch 'student', to:'students#update'

  #show upcoming and completed missions
  get 'dashboard/missions/upcoming', to:'students#upcoming_missions'
  get 'dashboard/missions/completed', to:'students#completed_missions'

  #show all missions, with possibility to accept/refuse (1. change status of mission, 2. mission.student = current_user)
  get 'dashboard/missions', to:'students#favorite_missions'
  #when clicking on accepted --> update mission, link with method update instead of get
  patch 'missions', to: 'missions#update'

  get 'dashboard/facilities', to:'facilities#index'

  get 'dashboard/revenues', to:'students#revenues', as: :revenues
  #reviews
  get 'dashboard/reviews', to: "students#reviews", as: :reviews

  get 'facility_add', to: "facilities#click_facility"
  get 'facility_remove', to: "facilities#click_remove"
  # ---- post fit creation ------

  post 'missions/:id/accept', to: "fits#accept", as: :accept_fit
  post 'missions/:id/refuse', to: "fits#refuse", as: :refuse_fit


end

