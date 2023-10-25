$dir = "C:\Users\mateusz.drozdzewski\Documents\EPOS.PL_plus\kampaniaEpos\gPhoneX"
# Build the file list
$fileList = Get-ChildItem -Path $dir -Filter *.tsf -File
$outFile = Join-Path $dir "merged.tsf"
# Get the header info from the first file
Get-Content $fileList[0] | select -First 90 | Out-File -FilePath $outfile -Encoding ascii
# Cycle through and get the data (sans header) from all the files in the list
foreach ($file in $filelist)
{
    Get-Content $file | select -Skip 90 | Out-File -FilePath $outfile -Encoding ascii -Append
}