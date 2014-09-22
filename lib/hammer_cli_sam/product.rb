module HammerCLISAM

  commands = %w(
    create
    delete
    update
  )

  commands.each do |cmd|
    HammerCLI::MainCommand.find_subcommand('product').subcommand_class.remove_subcommand(cmd)
  end

end
