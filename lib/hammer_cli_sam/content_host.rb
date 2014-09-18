module HammerCLISAM

  commands = %w(
    package
    package-group
    errata
  )

  commands.each do |cmd|
    HammerCLIKatello::ContentHostCommand.remove_subcommand(cmd)
  end

end
