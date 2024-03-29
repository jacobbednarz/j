{ config, pkgs, ... }:

{
  home.file.".fish".source = ../fish;

  programs.fish = {
    enable = true;

    shellInit = ''
      # turn off the damn greeting
      set fish_greeting

      # direnv for loading and unloading environment config
      if command -v direnv &> /dev/null
        direnv hook fish | source
      end

      # autojump
      [ -f ${pkgs.autojump}/share/autojump/autojump.fish ]; and source ${pkgs.autojump}/share/autojump/autojump.fish

      # hub
      if command -v hub &> /dev/null
        eval (hub alias -s)
      end

      # rg
      if command -v fzf &> /dev/null && command -v rg &> /dev/null
        set -gx FZF_DEFAULT_COMMAND  'rg --files --no-ignore-vcs --hidden'
      end

      # Use LibreSSL
      if test -d /usr/local/opt/libressl/bin
        set -g fish_user_paths "/usr/local/opt/libressl/bin" $fish_user_paths
      end

      # source asdf-vm
      [ -f ${pkgs.asdf-vm}/share/asdf-vm/asdf.fish ]; and source ${pkgs.asdf-vm}/share/asdf-vm/asdf.fish

      set -gx GPG_TTY (tty)
      set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
      gpgconf --launch gpg-agent
    '';

    plugins = [
        {
          name = "bass";
          src  = pkgs.fetchFromGitHub {
            owner  = "edc";
            repo   = "bass";
            rev    = "50eba266b0d8a952c7230fca1114cbc9fbbdfbd4";
            sha256 = "0ppmajynpb9l58xbrcnbp41b66g7p0c9l2nlsvyjwk6d16g4p4gy";
          };
        }

        {
          name = "fenv";
          src  = pkgs.fetchFromGitHub {
            owner  = "oh-my-fish";
            repo   = "plugin-foreign-env";
            rev    = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
            sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
          };
        }
      ];

    functions = {
      fish_prompt = ''
        set -l last_pipestatus $pipestatus
        set -l normal (set_color normal)

        # Color the prompt differently when we're root
        set -l color_cwd $fish_color_cwd
        set -l prefix
        set -l suffix '$'
        if contains -- $USER root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            end
            set suffix '#'
        end

        # If we're running via SSH, change the host color.
        set -l color_host $fish_color_host
        if set -q SSH_TTY
            set color_host $fish_color_host_remote
        end

        # Write pipestatus
        set -l prompt_status (__fish_print_pipestatus " [" "]" "|" (set_color $fish_color_status) (set_color --bold $fish_color_status) $last_pipestatus)

        echo -n -s (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal $prompt_status $suffix " "
      '';

      reload = ''
        if test (count $argv) -eq 0
          _reload_shell
        else
          switch $argv[1]
            case 'all'
              _reload_shell
              _reload_direnv
            case 'yubikey'
              _reload_yubikey
            case 'direnv'
              _reload_direnv
            case '*'
              _reload_shell
          end
        end
      '';

      _reload_shell   = "source ~/.config/fish/config.fish; echo config reloaded";
      _reload_direnv  = "direnv allow; echo direnv reloaded";
      _reload_yubikey = "rm -r ~/.gnupg/private-keys-v1.d; gpgconf --kill gpg-agent; killall gpg-agent; gpg-agent --daemon";
      init_direnv     = "echo 'use asdf' > .envrc; direnv reload; echo 'direnv has been initialised'";
      jwt             = "ruby -rjson -rbase64 -e \"ARGV[0].split('.')[0,2].each_with_index { |f, i| j = JSON.parse(Base64.urlsafe_decode64(f)); jj j; break if i.zero? && j.key?('enc')}\" $argv[1]";
    };

    shellAliases = {
      code = "code-insiders";
    };
  };
}
