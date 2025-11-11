class ChronoNtp < Formula
  desc "Minimal terminal clock synced via NTP; ideal for setting mechanical watches"
  homepage "https://github.com/ingk/chrono-ntp"
  version "202511112240"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202511112240/chrono-ntp-darwin-arm64"
      sha256 "d0354bbb789e248ef7591d2af82d7f051eb065b393b2d0df47425cb386debbad" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202511112240/chrono-ntp-darwin-amd64"
      sha256 "c3a6adeef01f5876cf64bc06f39cf3b79e6d47f83f3cd5121e317d8504fe6bea" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202511112240/chrono-ntp-linux-arm64"
      sha256 "39a654acce37df0b270e56b17948303889f9ce8f96fc71a1cae0729c41699d0f" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202511112240/chrono-ntp-linux-amd64"
      sha256 "e705af41beee74b70581bea45608fbb73178b12825a5a9c92d245d721594869c" # will be replaced automatically
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
