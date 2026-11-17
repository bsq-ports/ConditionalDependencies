& "$PSScriptRoot/build.ps1"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

adb shell am force-stop com.beatgames.beatsaber

adb push "$PSScriptRoot/build/libconditional-dependencies-test-1.so" /sdcard/ModData/com.beatgames.beatsaber/Modloader/mods/libconditional-dependencies-test-1.so
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
adb push "$PSScriptRoot/build/libconditional-dependencies-test-2.so" /sdcard/ModData/com.beatgames.beatsaber/Modloader/mods/libconditional-dependencies-test-2.so
