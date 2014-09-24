module HammerCLISAM

  commands = %w(
    package
    package-group
    errata
  )

  commands.each do |cmd|
    HammerCLI::MainCommand.find_subcommand('content-host').subcommand_class.remove_subcommand(cmd)
  end

end
