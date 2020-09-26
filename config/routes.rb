Rails.application.routes.draw do
  get 'chords/update'
  get 'videos/new'
  get 'videos/create'
  get 'videos/update'
  get 'videos/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/students/:id/add-songs", to: "students#create_student_song", as: "create_student_song"
  resources :students, only: [ :new, :create, :show, :index ] do
    resources :student_songs, only: [:destroy, :create], as: 'songs'
    resources :lessons, only: [:destroy]
  end

  resources :songs, only: [ :new, :create, :show, :edit, :update, :index ]
  # resources :student_songs, only: [ :create ], as: :songs

  resources :chords, only: [:update, :show, :index]

  resources :lessons, only: [ :new, :create] do
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
