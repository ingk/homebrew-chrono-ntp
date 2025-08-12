class ChronoNtp < Formula
  desc "chrono-ntp is a simple command-line tool that synchronizes with an NTP (Network Time Protocol) server to account for any difference between your computer’s clock and the actual time, displaying the precise date and time in your terminal."
  homepage "https://github.com/ingk/chrono-ntp"
  version "202508121759"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508121759/chrono-ntp-darwin-arm64"
      sha256 "55d8c7261271e45b3ee8852afd31ef77e096f74e0c10c49cc4b60f851d02808d" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508121759/chrono-ntp-darwin-amd64"
      sha256 "32cf43e8214014f1dbb9d2ce93fc2e24d648a2f683a2b21d15059af84301edc4" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508121759/chrono-ntp-linux-arm64"
      sha256 "23944a80cf97484a9fa9308fcfeb031fa781b76bed00a78c62d9bdbb6f577ebe" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508121759/chrono-ntp-linux-amd64"
      sha256 "5a9a0a0d86445c3fd3ef4cfc527f3b5819c85c5769f4e03a81b97c39f50c0b50" # will be replaced automatically
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
