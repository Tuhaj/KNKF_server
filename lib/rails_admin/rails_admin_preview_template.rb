require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminPreviewTemplate
end
 
module RailsAdmin
  module Config
    module Actions
      class PreviewTemplate < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :visible? do
          authorized? # && bindings[:object].respond_to?(:meetings)
        end

        register_instance_option :member? do
          true
        end

        register_instance_option :link_icon do
          'icon-eye-open'
        end

        register_instance_option :controller do
          Proc.new do
            @object.end_vote
          end
        end
      end
    end
  end
end