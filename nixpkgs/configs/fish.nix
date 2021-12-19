{ config, pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      any-nix-shell fish --info-right | source
    '';

    plugins = [{
      name = "z";
      src = pkgs.fetchFromGitHub {
        owner = "jethrokuan";
        repo = "z";
        rev = "ccb0ac58bc09841eaa2a54bf2aa7e9fb871d0e3f";
        sha256 = "05z6lnkmzbl212cbfp291p63qfzzqp73nkfizsgbmm0fbiqbi74p";
      };
    }];

    functions = {
      generate_gitignore = "curl -sL https://www.gitignore.io/api/$argv";
      cat = "bat $argv";
      fish_greeting = "";
      fish_prompt = ''
        set -l last_status $status 
        if not set -q __fish_prompt_normal 
          set -g __fish_prompt_normal (set_color normal) 
        end 

        # PWD 
        set_color $fish_color_cwd 
        echo -n (prompt_pwd) 
        set_color normal 
  
        printf '%s ' (__fish_git_prompt) 
        if not test $last_status -eq 0 
          set_color red
          else
              set_color cyan
        end 


          # set_color cyan 
        echo -n 'λ ' 
        set_color normal 
      '';
    };
  };
}
