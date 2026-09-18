#ifndef MyAppVersion
  #define MyAppVersion "0.0.0"
#endif

[Setup]
AppId={{127894D5-B5E2-4510-92C3-485EF6E82EA1}
AppName=TOMS SLA MT
AppVersion={#MyAppVersion}
AppPublisher=cuongtm88-blip
DefaultDirName={localappdata}\Programs\TOMS SLA MT
DefaultGroupName=TOMS SLA MT
PrivilegesRequired=lowest
OutputDir=dist-installer
OutputBaseFilename=TOMS-SLA-MT
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
CloseApplications=yes
RestartApplications=no
UninstallDisplayIcon={app}\TOMS-SLA-MT.exe

[Files]
Source: "dist\TOMS-SLA-MT\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\TOMS SLA MT"; Filename: "{app}\TOMS-SLA-MT.exe"
Name: "{autodesktop}\TOMS SLA MT"; Filename: "{app}\TOMS-SLA-MT.exe"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Tạo biểu tượng ngoài màn hình"; GroupDescription: "Biểu tượng bổ sung:"; Flags: checkedonce

[Run]
Filename: "{app}\TOMS-SLA-MT.exe"; Description: "Mở TOMS SLA MT"; Flags: nowait postinstall skipifsilent

[Code]
function InitializeSetup(): Boolean;
var
  ReadyFile: String;
begin
  ReadyFile := GetEnv('TOMS_UPDATE_READY_FILE');
  if ReadyFile <> '' then
    SaveStringToFile(ReadyFile, 'installer-ready', False);
  Result := True;
end;
