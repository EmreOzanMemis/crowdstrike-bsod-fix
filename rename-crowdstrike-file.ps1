# PowerShell script to rename the specified file

# Define the path to the file
$filePath = "C:\Windows\System32\drivers\CrowdStrike\C-00000291-00000000-00000032.sys"

# Define the new file name
$newFileName = "C-00000291-00000000-00000032.renamed"

# Check if the file exists
if (Test-Path $filePath) {
    try {
        # Rename the file
        Rename-Item -Path $filePath -NewName $newFileName
        Write-Output "File renamed successfully."
    } catch {
        Write-Error "Failed to rename the file. Error: $_"
    }
} else {
    Write-Error "File not found: $filePath"
}
