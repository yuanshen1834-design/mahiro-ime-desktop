# 真寻拼音 Windows 桌面版

基于 Weasel 0.17.4 (GPLv3) 二次开发，独立 CLSID，不覆盖官方小狼毫。

## 与上游的差异
- 新 CLSID/TIP GUID（见 `WeaselTSF/Globals.cpp`）
- 产品名「真寻拼音」（`include/WeaselUtility.h`）
- 独立注册表键 `Software\Mahiro\Weasel`（`include/WeaselConstants.h`、`RimeWithWeasel/WeaselUtility.cpp`）
- 独立 Rime 用户目录
- 图标替换（`resource/weasel.ico`）
- `include/afxres.h` 兼容头
- 安装器脚本 `installer.nsi`

## 构建
需要 Visual Studio Build Tools + Boost + librime 预编译库，详见仓库根目录构建说明；或直接使用 Release 中的安装包。

## 许可证
Weasel: GPLv3；Rime: BSD-3-Clause。
