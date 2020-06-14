$GodotPath = "C:\Program Files\Godot_v3.2.1-stable_win64\Godot_v3.2.1-stable_win64.exe"
$WeekToPushProjectFile = "C:\Users\Jack\Google Drive\Godot\MiniJam56\project.godot"
$WeekExportFolder = "C:\temp\DvAvP"
$WeekExportFolderEXE = "C:\temp\DvAvP_exe"
$ItchProjectName = "donut-vs-ants-vs-pepper"

#Invoke-Command -ScriptBlock {& $GodotPath $WeekToPushProjectFile --export "HTML5" "$WeekExportFolder\index.html"}
#Invoke-Command -ScriptBlock {& $GodotPath $WeekToPushProjectFile --export "WindowsDesktop" "$WeekExportFoldeExE\JiniJam56.exe"}
#Invoke-Command -ScriptBlock {& "C:\Users\$ENV:USERNAME\Google Drive\Godot\butler\butler-windows-amd64\butler.exe" push $WeekExportFolder HayGarryGames/donut-vs-ants-vs-pepper:html5} 
Invoke-Command -ScriptBlock {& "C:\Users\$ENV:USERNAME\Google Drive\Godot\butler\butler-windows-amd64\butler.exe" push $WeekExportFolderEXE HayGarryGames/donut-vs-ants-vs-pepper:windows}
