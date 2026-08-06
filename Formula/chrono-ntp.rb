class ChronoNtp < Formula
  desc "Minimal terminal clock synced via NTP; ideal for setting mechanical watches"
  homepage "https://github.com/ingk/chrono-ntp"
  version "202608061525"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202608061525/chrono-ntp-darwin-arm64"
      sha256 "7467d878b7dba680d248a499d3cd8435edb8bcf02afeed2a6fd3036cb7468f10" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202608061525/chrono-ntp-darwin-amd64"
      sha256 "386ee66b20cc3872b97bc7dba0c91d54cfdf609747fbc583f43d654d5c3876e9" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202608061525/chrono-ntp-linux-arm64"
      sha256 "a05c0ccc7c65b08129e0eb743e4c50baaeb761e66b824910d6c30d97e09f87dc" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202608061525/chrono-ntp-linux-amd64"
      sha256 "d762f94d75cb18710829ec527c3e264d482f1944fad5090ae9bc0bc42cf9fcdb" # will be replaced automatically
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "chrono-ntp-darwin-arm64" : "chrono-ntp-darwin-amd64"
    else
      Hardware::CPU.arm? ? "chrono-ntp-linux-arm64" : "chrono-ntp-linux-amd64"
    end

    bin.install binary_name => "chrono-ntp"
  end

  test do
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "chrono-ntp-darwin-arm64" : "chrono-ntp-darwin-amd64"
    else
      Hardware::CPU.arm? ? "chrono-ntp-linux-arm64" : "chrono-ntp-linux-amd64"
    end

    system "#{bin}/#{binary_name}", "-help"
  end
end
