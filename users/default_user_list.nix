{ config, lib, ... }:
{
  options.eiros.users.default_user_list = lib.mkOption {
    default = [ ];
    description = "List of users that should have default options applied.";
    type = lib.types.listOf lib.types.str;
  };
}
