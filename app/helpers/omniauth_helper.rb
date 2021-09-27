module OmniauthHelper
  def graf
    @coun = User.group("provider").count
  end
end
