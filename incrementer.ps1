 Param(
    [Parameter(Mandatory = $true)]
    [string] $source_dir,
   
    [Parameter(Mandatory = $true)]
    [string] $base_file_name,

    [Parameter(Mandatory = $false)]
    [string] $file_types = "*.*",

    [Parameter(Mandatory = $false)]
    [string] $before_number = " - ",

    [Parameter(Mandatory = $false)]
    [string] $after_number = "",

    [Parameter(Mandatory = $false)]
    [int] $start_from = 1
)

# Get all of the files which match the given filter
$files = Get-ChildItem $source_dir -File -Filter $file_types

# Rename them all
$iterator = $start_from

foreach ($file in $files) {
    $old_name = $file.FullName
    $extension = $file.Extension
    $new_name = "$($base_file_name)$($before_number)$($iterator)$($after_number)$($extension)"
    $iterator = $iterator + 1

    Rename-Item -Path $old_name -NewName $new_name
}
