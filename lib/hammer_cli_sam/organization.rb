module HammerCLISAM

  commands = %w(
    add-compute-resource
    add-config-template
    add-domain
    add-environment
    add-hostgroup
    add-medium
    add-smart-proxy
    add-subnet
    remove-compute-resource
    remove-config-template
    remove-domain
    remove-environment
    remove-hostgroup
    remove-medium
    remove-smart-proxy
    remove-subnet
  )

  commands.each do |cmd|
    HammerCLI::MainCommand.find_subcommand('organization').subcommand_class.remove_subcommand(cmd)
  end

  module Organization

    class CreateCommand < HammerCLIKatello::Organization::CreateCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:compute_resource,
                      :config_template,
                      :domain,
                      :hostgroup,
                      :environment,
                      :media,
                      :realm,
                      :smart_proxy,
                      :subnet)
    end

    class UpdateCommand < HammerCLIKatello::Organization::UpdateCommand
      include HammerCLISAM::ExcludeOptions

      exclude_options(:compute_resource,
                      :config_template,
                      :domain,
                      :hostgroup,
                      :environment,
                      :media,
                      :realm,
                      :smart_proxy,
                      :subnet)
    end

  end

  HammerCLIKatello::Organization.subcommand!(
    HammerCLIKatello::Organization::CreateCommand.command_name,
    HammerCLIKatello::Organization::CreateCommand.desc,
    HammerCLISAM::Organization::CreateCommand
  )

  HammerCLIKatello::Organization.subcommand!(
    HammerCLIKatello::Organization::UpdateCommand.command_name,
    HammerCLIKatello::Organization::UpdateCommand.desc,
    HammerCLISAM::Organization::UpdateCommand
  )

end
