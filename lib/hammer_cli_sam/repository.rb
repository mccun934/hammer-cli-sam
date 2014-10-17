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

  module Repository

    class ListCommand < HammerCLIKatello::Repository::ListCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:content_view,
                      :library,
                      :environment)
    end

  end

  HammerCLIKatello::Repository.subcommand!(
    HammerCLIKatello::Repository::ListCommand.command_name,
    HammerCLIKatello::Repository::ListCommand.desc,
    HammerCLISAM::Repository::ListCommand
  )

end
