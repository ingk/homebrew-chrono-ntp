class ChronoNtp < Formula
  desc "Minimal terminal clock synced via NTP; ideal for setting mechanical watches"
  homepage "https://github.com/ingk/chrono-ntp"
  version "202512131742"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512131742/chrono-ntp-darwin-arm64"
      sha256 "e1d1586592692d76d4f25a7300ef42969785caa6261c10886ba3b0d99f812353" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512131742/chrono-ntp-darwin-amd64"
      sha256 "4d4fecdf4248098e331e12bf3b4db5367a56e45fc3854c3d5ffef4f9b3be9098" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512131742/chrono-ntp-linux-arm64"
      sha256 "e93da9d432e0e902001a8303c50c7fd8ada0b0dedb81d670d27040be484effea" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512131742/chrono-ntp-linux-amd64"
      sha256 "94705c872840768d99024b8dfbf731bbba4b3e85775c349cdb83c305cb9637d2" # will be replaced automatically
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
