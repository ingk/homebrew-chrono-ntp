class ChronoNtp < Formula
  desc "chrono-ntp is a simple command-line tool that synchronizes with an NTP (Network Time Protocol) server to account for any difference between your computer’s clock and the actual time, displaying the precise date and time in your terminal."
  homepage "https://github.com/ingk/chrono-ntp"
  version "202508152036"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508152036/chrono-ntp-darwin-arm64"
      sha256 "c62a5a6e2e318fe7d0cbd762e3be66d68f5618c42958f3b564e4134e760ff844" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508152036/chrono-ntp-darwin-amd64"
      sha256 "c069ec4d79a745d19324e90bdd2b639a09bf23aea40b9501fddd7091f1300d9c" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508152036/chrono-ntp-linux-arm64"
      sha256 "f2a6c5c10a5320bfc220c4da2aad38c16f805c5fa3ab4146682c8c0d623150ab" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508152036/chrono-ntp-linux-amd64"
      sha256 "624ba2234f567693ed458e777b2118ff7932f257751daafd6a3bb6f02fefaefa" # will be replaced automatically
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
