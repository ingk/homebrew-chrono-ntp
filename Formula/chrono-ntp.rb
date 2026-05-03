class ChronoNtp < Formula
  desc "Minimal terminal clock synced via NTP; ideal for setting mechanical watches"
  homepage "https://github.com/ingk/chrono-ntp"
  version "202605031641"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202605031641/chrono-ntp-darwin-arm64"
      sha256 "bd057370dd292d6a232d504db127a7138320ff89fd6d7ef12ed65d7453ff274e" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202605031641/chrono-ntp-darwin-amd64"
      sha256 "685ad7dac25c480b2642bf24475590451c536a7600d123ad821be5cc6fa92e73" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202605031641/chrono-ntp-linux-arm64"
      sha256 "aa0e14491d1841c63f554636fb80327c44e27e93a5822a2756c8826fea4d639f" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202605031641/chrono-ntp-linux-amd64"
      sha256 "5ca7c3fd0cc96eacaf2d6779853ebe50425e1f399fb6230624d52924224a4632" # will be replaced automatically
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
