class Admins::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    authenticating("Google")
  end

  def github
    authenticating("Github")
  end

  def authenticating(kind)
    @admin = Admin.from_omniauth(request.env['omniauth.auth'])
  
    if @admin.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: kind
      sign_in_and_redirect @admin, event: :authentication
    else
      session['devise.auth_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
      redirect_to new_admin_registration_url, alert: @admin.errors.full_messages.join("\n")
    end
  end
end