Rails.application.routes.draw do

  mount ZfClient::Engine => "/zf_client"
end
