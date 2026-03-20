# 🚢 蝦仁一號 (Xiaren-01 Ark)

這是蝦家班的「諾亞方舟計畫」核心組件，專為 Firebase Studio 設計的零設定 (Zero Setup) 雲端著陸艙。

## 🚀 一鍵啟動 (Open in Firebase Studio)

點擊下方按鈕，Firebase Studio 會自動為您建立一個全新的開發環境、啟動 Docker Daemon，並自動拉起方舟骨架 (OpenClaw + 9Router + Tailscale)：

[![Open in Firebase Studio](https://img.shields.io/badge/Open%20in-Firebase%20Studio-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://studio.firebase.google.com/import?url=https://github.com/cmwang2021/shrimpclan-ark)

## ⚠️ 啟動後必要步驟 (Post-Launch Setup)

方舟啟動後，為了讓系統連上神經網路，您必須手動注入 Tailscale 的金鑰：

1. 在 Firebase Studio 的左側檔案總管中，於根目錄建立一個 `.env` 檔案。
2. 寫入您的 Tailscale Auth Key (建議使用具有 Tag 權限的 Reusable Key)：
   ```env
   TS_AUTHKEY=tskey-auth-您的金鑰...
   ```
3. 在下方的 Terminal 中，重新啟動容器以套用金鑰：
   ```bash
   docker compose down
   docker compose up -d
   ```
4. 檢查連線狀態，如果成功，您應該能在 Tailscale 管理後台中看到名為 `abai-firebase-01` 的節點上線。

## 📦 內含裝備 (Included Components)

*   `docker-compose.yml`: 方舟的結構藍圖，定義了三個核心容器的網狀網路。
*   `.idx/dev.nix`: Firebase Studio 的環境定義檔，負責在雲端建立能跑 Docker 的底層作業系統，並負責自動化生命週期。