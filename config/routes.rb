Rails.application.routes.draw do
  root 'woot#index'

  get 'det' => 'application#det'
  get 'proxy' => 'application#proxy'
  get 'tools' => 'application#tools'
  get 'ruby-json-hash-converter' => 'application#ruby_json_hash_converter'
  get 'music' => 'woot#music'
  get 'travel' => 'woot#travel'
  get 'outdoors' => 'woot#outdoors'
  get 'lizlegend' => 'lizlegend#home'

  post 'to_json' => 'application#to_json'
  post 'to_ruby' => 'application#to_ruby'
end
