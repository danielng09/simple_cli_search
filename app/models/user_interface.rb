class UserInterface
  def next(controller)
    controller.render
    option = gets.chomp
    controller.handle_option(self, option)
  end
end
