module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @user ||= User.new
  end
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def tab_participant?(params)
    'active2' if params == 'Participant'
  end

  def tab_organiser?(params)
    'active2' if params == 'Organiser'
  end
end
