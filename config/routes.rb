Rails.application.routes.draw do
  resources :discounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :merchant, only: [:show] do
    resources :dashboard, only: [:index]
    resources :items, except: [:destroy]
    resources :item_status, only: [:update]
    resources :invoices, only: [:index, :show, :update]
    resources :bulk_discounts, except: [:update]
  end

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :merchants, except: [:destroy]
    resources :merchant_status, only: [:update]
    resources :invoices, except: [:new, :destroy]
  end
end

#                      Prefix Verb  URI Pattern                                                                              Controller#Action
#    merchant_dashboard_index GET   /merchant/:merchant_id/dashboard(.:format)                                               dashboard#index
#              merchant_items GET   /merchant/:merchant_id/items(.:format)                                                   items#index
#                             POST  /merchant/:merchant_id/items(.:format)                                                   items#create
#           new_merchant_item GET   /merchant/:merchant_id/items/new(.:format)                                               items#new
#          edit_merchant_item GET   /merchant/:merchant_id/items/:id/edit(.:format)                                          items#edit
#               merchant_item GET   /merchant/:merchant_id/items/:id(.:format)                                               items#show
#                             PATCH /merchant/:merchant_id/items/:id(.:format)                                               items#update
#                             PUT   /merchant/:merchant_id/items/:id(.:format)                                               items#update
#        merchant_item_status PATCH /merchant/:merchant_id/item_status/:id(.:format)                                         item_status#update
#                             PUT   /merchant/:merchant_id/item_status/:id(.:format)                                         item_status#update
#           merchant_invoices GET   /merchant/:merchant_id/invoices(.:format)                                                invoices#index
#            merchant_invoice GET   /merchant/:merchant_id/invoices/:id(.:format)                                            invoices#show
#                             PATCH /merchant/:merchant_id/invoices/:id(.:format)                                            invoices#update
#                             PUT   /merchant/:merchant_id/invoices/:id(.:format)                                            invoices#update
#     merchant_bulk_discounts GET   /merchant/:merchant_id/bulk_discounts(.:format)                                          bulk_discounts#index
#                             POST  /merchant/:merchant_id/bulk_discounts(.:format)                                          bulk_discounts#create
#  new_merchant_bulk_discount GET   /merchant/:merchant_id/bulk_discounts/new(.:format)                                      bulk_discounts#new
# edit_merchant_bulk_discount GET   /merchant/:merchant_id/bulk_discounts/:id/edit(.:format)                                 bulk_discounts#edit
#      merchant_bulk_discount GET   /merchant/:merchant_id/bulk_discounts/:id(.:format)                                      bulk_discounts#show
#                    merchant GET   /merchant/:id(.:format)                                                                  merchant#show
#       admin_dashboard_index GET   /admin/dashboard(.:format)                                                               admin/dashboard#index
#             admin_merchants GET   /admin/merchants(.:format)                                                               admin/merchants#index
#                             POST  /admin/merchants(.:format)                                                               admin/merchants#create
#          new_admin_merchant GET   /admin/merchants/new(.:format)                                                           admin/merchants#new
#         edit_admin_merchant GET   /admin/merchants/:id/edit(.:format)                                                      admin/merchants#edit
#              admin_merchant GET   /admin/merchants/:id(.:format)                                                           admin/merchants#show
#                             PATCH /admin/merchants/:id(.:format)                                                           admin/merchants#update
#                             PUT   /admin/merchants/:id(.:format)                                                           admin/merchants#update
#       admin_merchant_status PATCH /admin/merchant_status/:id(.:format)                                                     admin/merchant_status#update
#                             PUT   /admin/merchant_status/:id(.:format)                                                     admin/merchant_status#update
#              admin_invoices GET   /admin/invoices(.:format)                                                                admin/invoices#index
#                             POST  /admin/invoices(.:format)                                                                admin/invoices#create
#          edit_admin_invoice GET   /admin/invoices/:id/edit(.:format)                                                       admin/invoices#edit
#               admin_invoice GET   /admin/invoices/:id(.:format)                                                            admin/invoices#show
#                             PATCH /admin/invoices/:id(.:format)                                                            admin/invoices#update
#                             PUT   /admin/invoices/:id(.:format)                                                            admin/invoices#update
#          rails_service_blob GET   /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#   rails_blob_representation GET   /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#          rails_disk_service GET   /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#   update_rails_disk_service PUT   /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#        rails_direct_uploads POST  /rails/active_storage/direct_uploads(.:format)