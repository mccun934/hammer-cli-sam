module HammerCLISAM

  HammerCLI::MainCommand.find_subcommand('activation-key').subcommand_class

  module ActivationKeyCommand

    class CreateCommand < HammerCLIKatello::ActivationKeyCommand::CreateCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:environment, :content_view)
    end

    class ListCommand < HammerCLIKatello::ActivationKeyCommand::ListCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:environment, :content_view)
    end

    class UpdateCommand < HammerCLIKatello::ActivationKeyCommand::UpdateCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:environment, :content_view)
    end

  end

  HammerCLIKatello::ActivationKeyCommand.subcommand!(
    HammerCLIKatello::ActivationKeyCommand::CreateCommand.command_name,
    HammerCLIKatello::ActivationKeyCommand::CreateCommand.desc,
    HammerCLISAM::ActivationKeyCommand::CreateCommand
  )

  HammerCLIKatello::ActivationKeyCommand.subcommand!(
    HammerCLIKatello::ActivationKeyCommand::ListCommand.command_name,
    HammerCLIKatello::ActivationKeyCommand::ListCommand.desc,
    HammerCLISAM::ActivationKeyCommand::ListCommand
  )

  HammerCLIKatello::ActivationKeyCommand.subcommand!(
    HammerCLIKatello::ActivationKeyCommand::UpdateCommand.command_name,
    HammerCLIKatello::ActivationKeyCommand::UpdateCommand.desc,
    HammerCLISAM::ActivationKeyCommand::UpdateCommand
  )

end
