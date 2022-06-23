{
  programs.git = {
    enable = true;
    userName = "Jacob Bednarz";
    userEmail = "jacob.bednarz@gmail.com";

    attributes = [
      "*.rb diff=ruby"
      "*.rake diff=ruby"
      "*.gemspec diff=ruby"
    ];

    aliases = {
      br                     = "branch";
      branches               = "branch -a --color -v";
      bump                   = "commit -m 'Bump' --allow-empty";
      ci                     = "commit";
      co                     = "checkout";
      commit                 = "commit -S";
      contributors           = "shortlog --summary --numbered";
      cp                     = "cherry-pick";
      credit                 = "\"!f() { git commit --amend --author \"$1 <$2>\" -C HEAD; }; f\"";
      delete-merged-branches = "!sh -c 'git branch --merged master | grep -v master | xargs -n 1 git branch -d'";
      df                     = "diff -w";
      graph                  = "log --graph --color --pretty=format:\"%C(yellow)%H%C(green)%d%C(reset)%n%x20%cd%n%x20%cn%x20(%ce)%n%x20%s%n\"";
      hash                   = "rev-parse --short HEAD";
      ignorechanges          = "update-index --assume-unchanged";
      l                      = "log --pretty=oneline -n 20 --graph --abbrev-commit";
      lc                     = "log ORIG_HEAD.. --stat --no-merges";
      lf                     = "log --pretty=fuller";
      lg                     = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -- ";
      noticechanges          = "update-index --no-assume-unchanged";
      prune                  = "fetch --prune";
      root                   = "rev-parse --show-toplevel";
      st                     = "status -sb";
      stash-all              = "stash save --include-untracked";
      undo                   = "reset --soft HEAD^";
      unstage                = "reset HEAD --";
      wip                    = "for-each-ref --sort='authordate:iso8601' --format=' %(color:green)%(authordate:relative)%09%(color:white)%(refname:short)' refs/heads";
      recent                 = "branch --sort=-committerdate --format=\"%(committerdate:relative)%09%(refname:short)\"";
    };

    signing = {
      key           = "9846E532AF49C75E";
      signByDefault = true;
      gpgPath       = "/usr/local/bin/gpg";
    };

    includes = [
      {
        condition = "gitdir:~/cf-repos/";
        contents = { user.email = "jbednarz@cloudflare.com"; };
      }
    ];

    extraConfig = {
      core = {
        eol         = "lf";
        autocrlf    = "input";
        trustctime  = false;
        whitespace  = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
        editor      = "vim";
        commentChar = "|";
        pager       = "~/.nix-profile/share/git/contrib/diff-highlight/diff-highlight | less";
        commitGraph = true;
        excludesFile = "~/.gitignore";
      };

      status.renames = "copies";

      help.autocorrect = 1;

      merge = {
        ff   = true;
        tool = "Kaleidoscope";
      };

      mergetool = {
        keepBackup = false;
      };

      "mergetool \"Kaleidoscope\"" = {
        md = "ksdiff --merge --output \"$MERGED\" --base \"$BASE\" -- \"$LOCAL\" --snapshot \"$REMOTE\" --snapshot";
        trustExitCode = true;
      };

      push.default = "current";

      github.user = "jacobbednarz";

      color.ui = "auto";

      commit = {
        verbose = true;
      };

      interactive.diffFilter = "~/.nix-profile/share/git/contrib/diff-highlight/diff-highlight";

      log.showSignature = false;

      diff = {
        tool       = "Kaleidoscope";
        renames    = "copies";
        noprefix   = true;
        colorMoved = "default";
      };

      # Use `hexdump` to diff binary files
      "diff \"bin\"".textconv = "hexdump -v -C";

      "color \"diff-highlight\"" = {
        oldNormal    = "red bold";
        oldHighlight = "red bold 52";
        newNormal    = "green bold";
        newHighlight = "green bold 22";
      };

      "difftool \"Kaleidoscope\"" = {
        cmd = "ksdiff --partial-changeset --relative-path \"$MERGED\" -- \"$LOCAL\" \"$REMOTE\"";
      };

      pager = {
        diff = "~/.nix-profile/share/git/contrib/diff-highlight/diff-highlight | less";
        show = "~/.nix-profile/share/git/contrib/diff-highlight/diff-highlight | less";
        log  = "~/.nix-profile/share/git/contrib/diff-highlight/diff-highlight | less";
      };

      "filter \"lfs\"" = {
        smudge   = "git-lfs smudge -- %f";
        process  = "git-lfs filter-process";
        required = true;
        clean    = "git-lfs clean -- %f";
      };

      credential.helper = "osxkeychain";

      protocol.version = 2;

      advice.detachedHead = false;
    };
  };

  # global gitignore file
  home.file.".gitignore".source = ../git/gitignore;
}
