module Authorizable
  extend ActiveSupport::Concern

  private

  def authenticate_and_authorize!
    authenticate_user!

    return if current_user.userable_type == 'Root'

    authorized = !!authorizations.dig(current_user.userable_type, controller_name, action_name)
    render 'home/index' unless authorized
  end

  def authorizations
    # {
    #    'ClassName' => {
    #       'controller_name' => {
    #         'action_name' => true/false
    #       }
    #    }
    # }

    {
      'Admin' => {
        'admins' => {
          'index' => true
        },
        'customers' => {
          'index' => true
        }
      },
      'Customer' => {
        'customers' => {
          'index' => true
        }
      }
    }
  end
end
