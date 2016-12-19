Rails.application.routes.draw do

    scope PluginRoutes.system_info["relative_url_root"] do
      scope '(:locale)', locale: /#{PluginRoutes.all_locales}/, :defaults => {  } do
        # frontend
        namespace :plugins do
          namespace 'cama_image_lightbox' do
            get 'index' => 'front#index'
          end
        end
      end

      #Admin Panel
      scope :admin, as: 'admin', path: PluginRoutes.system_info['admin_path_name'] do
        namespace 'plugins' do
          namespace 'cama_image_lightbox' do
            get 'index' => 'admin#index'
          end
        end
      end

      # main routes
      #scope 'cama_image_lightbox', module: 'plugins/cama_image_lightbox/', as: 'cama_image_lightbox' do
      #  Here my routes for main routes
      #end
    end
  end
