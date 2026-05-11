# SKK辞書一括更新スクリプト（複数対応）

$ErrorActionPreference = "Stop"

# === 設定 ===
$skkDir = "$env:USERPROFILE\.skk"

$dictList = @(
    @{ name = "SKK-JISYO.L";          url = "https://skk-dev.github.io/dict/SKK-JISYO.L.gz" },
    @{ name = "SKK-JISYO.jinmei";     url = "https://skk-dev.github.io/dict/SKK-JISYO.jinmei.gz" },
    @{ name = "SKK-JISYO.fullname";   url = "https://skk-dev.github.io/dict/SKK-JISYO.fullname.gz" },
    @{ name = "SKK-JISYO.geo";        url = "https://skk-dev.github.io/dict/SKK-JISYO.geo.gz" },
    @{ name = "SKK-JISYO.propernoun"; url = "https://skk-dev.github.io/dict/SKK-JISYO.propernoun.gz" },
    @{ name = "SKK-JISYO.station";    url = "https://skk-dev.github.io/dict/SKK-JISYO.station.gz" },
    @{ name = "SKK-JISYO.law";        url = "https://skk-dev.github.io/dict/SKK-JISYO.law.gz" },
    @{ name = "SKK-JISYO.assoc";      url = "https://skk-dev.github.io/dict/SKK-JISYO.assoc.gz" }
)

# === ディレクトリ作成 ===
if (!(Test-Path $skkDir)) {
    New-Item -ItemType Directory -Path $skkDir | Out-Null
}

Add-Type -AssemblyName System.IO.Compression.FileSystem

foreach ($dict in $dictList) {
    try {
        $name    = $dict.name
        $url     = $dict.url

        $gzPath  = "$skkDir\$name.gz"
        $tmpPath = "$skkDir\$name.tmp"
        $dstPath = "$skkDir\$name"

        Write-Host "`n=== $name ==="

        # ダウンロード
        Write-Host "⬇️ Downloading..."
        Invoke-WebRequest -Uri $url -OutFile $gzPath

        # 解凍
        Write-Host "📦 Decompressing..."
        $inStream  = [System.IO.File]::OpenRead($gzPath)
        $outStream = [System.IO.File]::Create($tmpPath)

        $gzip = New-Object System.IO.Compression.GzipStream(
            $inStream,
            [System.IO.Compression.CompressionMode]::Decompress
        )

        $gzip.CopyTo($outStream)

        $gzip.Close()
        $inStream.Close()
        $outStream.Close()

        # バックアップ
        if (Test-Path $dstPath) {
            Rename-Item $dstPath "$dstPath.bak" -Force
        }

        # 置き換え
        Rename-Item $tmpPath $dstPath -Force

        # cleanup
        Remove-Item $gzPath -Force

        Write-Host "✅ Updated"
    }
    catch {
        Write-Host "❌ Failed: $name"
        Write-Host $_
    }
}

Write-Host "`n🎉 All done!"
