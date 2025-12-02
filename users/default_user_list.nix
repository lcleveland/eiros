{ config, lib, ... }:
{
  options.eiros.users.default_user_list = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "List of users that should have default options applied.";
  };
}
