class ChronoNtp < Formula
  desc "chrono-ntp is a simple command-line tool that synchronizes with an NTP (Network Time Protocol) server to account for any difference between your computer’s clock and the actual time, displaying the precise date and time in your terminal."
  homepage "https://github.com/ingk/chrono-ntp"
  version "202508221952"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508221952/chrono-ntp-darwin-arm64"
      sha256 "2cf860d41afdf1499459541cc7c6d0286e92f0128ec7c90c4092caaa4bb451f1" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508221952/chrono-ntp-darwin-amd64"
      sha256 "4f81ead6a3d09c49e9691fc5ebd081e6de49d547bd5ff8a0a7771c1906b6e46c" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508221952/chrono-ntp-linux-arm64"
      sha256 "e497528769772d388f010f5e69a7f60b9439a148e7b8679325e9e9a98392ae12" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508221952/chrono-ntp-linux-amd64"
      sha256 "d1fbfcfc531ff59ea460e36bbe3914bdff78cae4be714c102f1ff85068a07918" # will be replaced automatically
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
