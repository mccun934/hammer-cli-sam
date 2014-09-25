module HammerCLISAM

  commands = %w(
    add-hostgroup
    remove-hostgroup
    add-environment
    remove-environment
    add-domain
    remove-domain
    add-medium
    remove-medium
    add-subnet
    remove-subnet
    add-compute-resource
    remove-compute-resource
    add-smart-proxy
    remove-smart-proxy
    add-config-template
    remove-config-template
  )

  commands.each do |cmd|
    HammerCLI::MainCommand.find_subcommand('location').subcommand_class.remove_subcommand(cmd)
  end

end
