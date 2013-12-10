require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminEndVote
end
 
module RailsAdmin
  module Config
    module Actions
      class EndVote < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :visible? do
          authorized? && bindings[:object].respond_to?(:end_vote)
        end

        register_instance_option :member? do
          true
        end

        register_instance_option :link_icon do
          'icon-bullhorn'
        end

        register_instance_option :controller do
          Proc.new do
            @object.end_vote 
            if object.reading == nil
              redirect_to back_or_index, notice: "Nie ma żadnej wolnej lektury"
            else
            redirect_to back_or_index, notice: "lektura: #{@object.reading.title} została wybrana."
            end
          end
        end
      end
    end
  end
end