# SKK辞書更新スクリプト

$ErrorActionPreference = "Stop"

# === 設定 ===
$dictUrl = "https://skk-dev.github.io/dict/SKK-JISYO.L.gz"
$skkDir  = "$env:USERPROFILE\.skk"
$dictGz  = "$skkDir\SKK-JISYO.L.gz"
$dictTmp = "$skkDir\SKK-JISYO.L.tmp"
$dict    = "$skkDir\SKK-JISYO.L"

# === ディレクトリ作成 ===
if (!(Test-Path $skkDir)) {
    New-Item -ItemType Directory -Path $skkDir | Out-Null
}

Write-Host "⬇️ 辞書ダウンロード中..."
Invoke-WebRequest -Uri $dictUrl -OutFile $dictGz

Write-Host "📦 解凍中..."

# gzip解凍
Add-Type -AssemblyName System.IO.Compression.FileSystem

$inStream  = [System.IO.File]::OpenRead($dictGz)
$outStream = [System.IO.File]::Create($dictTmp)

$gzip = New-Object System.IO.Compression.GzipStream($inStream, [System.IO.Compression.CompressionMode]::Decompress)
$gzip.CopyTo($outStream)

$gzip.Close()
$inStream.Close()
$outStream.Close()

# === 安全に置き換え ===
if (Test-Path $dict) {
    Write-Host "🗑 古い辞書をバックアップ..."
    Rename-Item $dict "$dict.bak" -Force
}

Write-Host "🔁 新しい辞書を適用..."
Rename-Item $dictTmp $dict -Force

# === 後片付け ===
Remove-Item $dictGz -Force

Write-Host "✅ 完了！"
