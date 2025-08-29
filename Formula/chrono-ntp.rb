class ChronoNtp < Formula
  desc "chrono-ntp is a simple command-line tool that synchronizes with an NTP (Network Time Protocol) server to account for any difference between your computer’s clock and the actual time, displaying the precise date and time in your terminal."
  homepage "https://github.com/ingk/chrono-ntp"
  version "202508291510"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508291510/chrono-ntp-darwin-arm64"
      sha256 "008c7168efb3f45b804490e609f3074d7db444729e0b08381ce753cba758cfa7" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508291510/chrono-ntp-darwin-amd64"
      sha256 "239705000d03eb3ef00a228db1c506ed78b3d5c99147d8b2521ae6a5be572779" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508291510/chrono-ntp-linux-arm64"
      sha256 "414c13b8c58395b4eca157e1f5929c7ff1e0e246de2dc93f9d73017b0eb5c3ad" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508291510/chrono-ntp-linux-amd64"
      sha256 "d4cc2778a8524392b1702947cb7ba44752c95f336bcd094b538ad0044134230f" # will be replaced automatically
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
