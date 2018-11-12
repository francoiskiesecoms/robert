Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  #main dashboard
  get 'dashboard', to: 'profiles#dashboard', as: :dashboard

  #calendar: index and edit on the same page
  get 'dashboard/calendar', to:'availibilities#index', as: :calendar
  patch 'availibilities', to:'availibilities#update'

  #edit profile infos
  get 'dashboard/profile', to:'profiles#profile', as: :profile
  get 'dashboard/training', to:'profiles#training', as: :training
  patch 'dashboard', to:'profiles#update'

  #show upcoming and completed missions
  get 'dashboard/missions/upcoming', to:'students#upcoming'
  get 'dashboard/missions/completed', to:'students#completed'

  #show all missions, with possibility to accept/refuse (1. change status of mission, 2. mission.student = current_user)
  get 'dashboard/missions', to:'missions#index'
  #when clicking on accepted --> update mission, link with method update instead of get
  patch 'missions', to: 'missions#update'

  get 'dashboard/facilities', to:'facilities#index'

  get 'dashboard/revenues', to:'profiles#revenues', as: :revenues
  #reviews
  get 'dashboard/reviews', to: "reviews#index"
end

