module HammerCLISAM

  commands = %w(
    create
    delete
    update
    upload-content
  )

  commands.each do |cmd|
    HammerCLI::MainCommand.find_subcommand('repository').subcommand_class.remove_subcommand(cmd)
  end

end
