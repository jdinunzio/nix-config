{
  programs.git = {
    enable = true;

    settings = {
      user.name = "josedinunzio";
      user.email = "josedinunzio@microsoft.com";
      init.defaultBranch = "main";
      http.version = "HTTP/1.1";
      http.postBuffer = 1048576000;
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
      # credential = {
      #    helper = "manager";
      #    useHttpPath = true;
      #    credentialStore = "osxkeychain";
      # };
    };
  };
}
