Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :students, only: [ :new, :create, :show, :index ] do
    resources :student_songs, only: [:destroy, :create], as: 'songs'
    resources :lessons, only: [:destroy]
  end

  resources :songs, only: [ :new, :create, :show, :index ]
  # resources :student_songs, only: [ :create ], as: :songs


  resources :lessons, only: [ :new, :create, :index] do
    resources :notes, only: [ :show, :new, :create, :edit ]
  end

  scope "/dashboards" do
    get "/my_dashboard", to: "dashboards#my_dashboard", as: "my_dashboard"
  end

  # resources :teachers, only: [ :show] do
  #   resources :songs, only: [ :index, :new, :create]
  #   resources :students, only: [ :index, :new, :create]
  # end

  # resources :songs, only: [ :show, :edit, :update, :destroy ], as: 'teacher_songs' do
  #   resources :videos, only: [ :new, :create ]
  #   resources :audios, only: [ :new, :create ]
  #   # Lyrics and chords necessary?
  #   resources :lyrics, only: [ :new, :create ]
  #   resources :chords, only: [ :new, :create ]
  #   # Replace lyrics and chords with lyrics_chords? Index?
  #   resources :lyrics_chords, only: [ :new, :create ]
  # end

  # resources :students, only: [ :show, :edit, :update, :destroy ] do
  #   resources :student_songs, only: [ :index, :new, :create], as: 'songs'
  # end

  # resources :student_songs, only: [ :show, :edit, :update, :destroy ]

end
