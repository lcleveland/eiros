{ config, lib, ... }:
let
  eiros_accounts = config.eiros.system.accounts;
in
{
  options.eiros.system.accounts.mutable_users.enable = lib.mkEnableOption {
    default = true;
    description = "Allow users to create new accounts";
  };
  config.users.mutableUsers = eiros_accounts.mutable_users.enable;
}
