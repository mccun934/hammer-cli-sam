module HammerCLISAM

  commands = %w(
    create
    delete
    update
  )

  commands.each do |cmd|
    HammerCLI::MainCommand.find_subcommand('product').subcommand_class.remove_subcommand(cmd)
  end

  module Product

    class RemoveSyncPlanCommand < HammerCLIKatello::Product::RemoveSyncPlanCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:gpg_key)
    end

    class SetSyncPlanCommand < HammerCLIKatello::Product::SetSyncPlanCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:gpg_key)
    end

  end

  HammerCLIKatello::Product.subcommand!(
    HammerCLIKatello::Product::RemoveSyncPlanCommand.command_name,
    HammerCLIKatello::Product::RemoveSyncPlanCommand.desc,
    HammerCLISAM::Product::RemoveSyncPlanCommand
  )

  HammerCLIKatello::Product.subcommand!(
    HammerCLIKatello::Product::SetSyncPlanCommand.command_name,
    HammerCLIKatello::Product::SetSyncPlanCommand.desc,
    HammerCLISAM::Product::SetSyncPlanCommand
  )

end
