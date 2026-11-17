Param(
    [Parameter(Mandatory=$false)]
    [Switch]$clean,
    [Parameter(Mandatory=$false)]
    [Switch]$docs
)

# if user specified clean, remove all build files
if ($clean.IsPresent)
{
    if (Test-Path -Path "build")
    {
        remove-item build -R
    }
}

if (($clean.IsPresent) -or (-not (Test-Path -Path "build")))
{
    new-item -Path build -ItemType Directory
}


$root = "${PSScriptRoot}"
$build = "${root}/build"

& cmake -G "Ninja" -DCMAKE_BUILD_TYPE="RelWithDebInfo" -S ${root} -B ${build}
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& cmake --build ${build}
exit $LastExitCode
