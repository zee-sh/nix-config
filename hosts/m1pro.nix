{ config, ... }: {

  imports = [ ./darwin ];

  networking = { hostName = "m1pro"; };

}
