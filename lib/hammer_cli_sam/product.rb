module HammerCLISAM

  commands = %w(
    create
    delete
    update
  )

  commands.each do |cmd|
    HammerCLIKatello::ProductCommand.remove_subcommand(cmd)
  end

end
