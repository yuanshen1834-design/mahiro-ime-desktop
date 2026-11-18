Unicode true
!include "MUI2.nsh"

Name "真寻拼音"
OutFile "G:\RIMEIME\真寻拼音桌面版-v2.0-安装包.exe"
InstallDir "$PROGRAMFILES64\MahiroIME"
InstallDirRegKey HKCU "Software\Mahiro\Weasel" "InstallDir"
RequestExecutionLevel admin
SetCompressor /SOLID lzma

!define MUI_ICON "G:\RIMEIME\assets\mahiro.ico"
!define MUI_UNICON "G:\RIMEIME\assets\mahiro.ico"
!define MUI_ABORTWARNING

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_LANGUAGE "SimpChinese"

Section "Install"
  SetOutPath "$INSTDIR"
  File /r "G:\MahiroIME-v2\program\*.*"
  File /r "G:\MahiroIME-v2\Rime\*.*"
  File "G:\MahiroIME-v2\启动.bat"
  File "G:\MahiroIME-v2\README.txt"

  WriteRegStr HKCU "Software\Mahiro\Weasel" "RimeUserDir" "$INSTDIR\Rime"
  WriteRegStr HKCU "Software\Mahiro\Weasel" "InstallDir" "$INSTDIR"

  nsExec::Exec '"$SYSDIR\regsvr32.exe" /s "$INSTDIR\program\weaselx64.dll"'
  Pop $0

  WriteUninstaller "$INSTDIR\uninstall.exe"
  CreateDirectory "$SMPROGRAMS\真寻拼音"
  CreateShortCut "$SMPROGRAMS\真寻拼音\启动真寻拼音.lnk" "$INSTDIR\启动.bat" "" "$INSTDIR\program\WeaselServer.exe" 0
  CreateShortCut "$SMPROGRAMS\真寻拼音\卸载真寻拼音.lnk" "$INSTDIR\uninstall.exe"
  CreateShortCut "$DESKTOP\真寻拼音.lnk" "$INSTDIR\启动.bat" "" "$INSTDIR\program\WeaselServer.exe" 0

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MahiroIME" "DisplayName" "真寻拼音"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MahiroIME" "DisplayVersion" "2.0"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MahiroIME" "Publisher" "绪山真寻"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MahiroIME" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MahiroIME" "DisplayIcon" "$INSTDIR\program\WeaselServer.exe"
SectionEnd

Section "Uninstall"
  nsExec::Exec 'taskkill /f /im WeaselServer.exe'
  nsExec::Exec '"$SYSDIR\regsvr32.exe" /s /u "$INSTDIR\program\weaselx64.dll"'
  DeleteRegKey HKCU "Software\Mahiro"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MahiroIME"
  Delete "$DESKTOP\真寻拼音.lnk"
  RMDir /r "$SMPROGRAMS\真寻拼音"
  RMDir /r "$INSTDIR"
SectionEnd
