class UserInterface

  attr_accessor :current_controller

  def next(controller)
    controller.render
    option = gets.chomp
    controller.handle_option(self, option)
  end
end
