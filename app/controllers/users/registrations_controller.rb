class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end

  def destroy
    Picture.pictures_delete(current_user.id)
    super
  end
end
