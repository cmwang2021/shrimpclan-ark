# .idx/dev.nix
{ pkgs, ... }: {
  # 選擇穩定的系統環境
  channel = "stable-23.11";

  # 我們只需要極簡的基礎工具，剩下的全交給 Docker
  packages = [
    pkgs.git
    pkgs.nano
  ];

  # 🔥 最核心的一行：啟用 Docker 引擎 🔥
  services.docker.enable = true;

  # 預留環境變數 (敏感資訊如 TS_AUTHKEY 請在 Firebase Studio 介面或 .env 中設定)
  env = {
    PROJECT_NAME = "xiaren-01-ark";
  };

  idx = {
    # 推薦的 VS Code 擴充套件
    extensions = [
      "ms-azuretools.vscode-docker"
      "tamasfe.even-better-toml"
    ];

    workspace = {
      # 工作區一建立好，自動拉起我們的方舟！
      onCreate = {
        # 注意：這裡假設啟動前您會手動配置好 .env，所以預設只 echo 提示
        # 如果要全自動，必須確保 .env 已經在 Repo 裡 (不推薦) 或透過 Secret Manager 注入
        setup = "echo 'Please create .env with TS_AUTHKEY and run docker compose up -d'";
      };
      
      # 每次重新打開這個 Workspace，確保容器也是醒著的
      onStart = {
        resume_ark = "docker compose start || true";
      };
    };
  };
}