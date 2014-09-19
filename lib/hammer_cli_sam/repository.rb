module HammerCLISAM

  commands = %w(
    create
    delete
    update
    upload-content
  )

  commands.each do |cmd|
    HammerCLIKatello::RepositoryCommand.remove_subcommand(cmd)
  end

end
