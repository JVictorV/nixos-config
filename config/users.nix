{ config, pkgs, ... }:

{
  users = {
    mutableUsers = false;

    users.joao = {
      isNormalUser = true;
      home = "/home/joao";
      extraGroups = [
        "wheel" # Enable ‘sudo’ for the user. 
        "docker"
      ];
      hashedPassword = "$6$a7/M2bJeU6/o4Thm$labOJOLGiGWGGRUmyVviGvpKDz3cwHKp1jO2zt9inK98WbxN3V2ritZKbTBZhY14mK6XQFpd9kTKbv70ZHC4O/";
    };
  };
}
