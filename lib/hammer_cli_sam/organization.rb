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
    HammerCLIKatello::OrganizationCommand.remove_subcommand(cmd)
  end

end
