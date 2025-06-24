{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    working.devops.k8s.enable = lib.mkEnableOption "Enable Kubernetes tools";
  };

  config = lib.mkIf config.working.devops.k8s.enable {
    home.packages = with pkgs; [
      minikube
      kubectl
      kind
    ];
  };
}
