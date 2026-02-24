{
  pkgs,
  username,
  email,
  git ? {
    userName = username;
  },
  ...
}:
{
  programs.git = {
    enable = true;
    package = pkgs.gitSVN;
    settings = {
      user.name = git.userName;
      user.email = email;
      core.preloadIndex = false;
      init.defaultBranch = "main";
      http.version = "HTTP/1.1";
      http.postBuffer = 1048576000;
      credential.helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
      credential."https://dev.azure.com".useHttpPath = true;
      alias = {
        br = "branch";
        co = "checkout";
        lg = "log --graph --pretty=tformat:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --decorate=full";
        st = "status";
        brd = "!f() { git comain && git co2main $1 && git co main && git br -d $1 ; }; f";
        comain = "!git co main && git pull origin main && git pull origin --tags &&  git remote prune origin";
        co2main = "!f() { git co $1 && git rebase main; }; f";
        pushd = "!f() { git comain && git co2main $1 && git push origin $1 ; }; f";
      };
    };
  };
}
