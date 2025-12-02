class ChronoNtp < Formula
  desc "Minimal terminal clock synced via NTP; ideal for setting mechanical watches"
  homepage "https://github.com/ingk/chrono-ntp"
  version "202512021938"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512021938/chrono-ntp-darwin-arm64"
      sha256 "3fc9fc354d13b98541e60f09e70e9eda8c857c5d0e5e17359c8f8d0e65cd3cac" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512021938/chrono-ntp-darwin-amd64"
      sha256 "389c82fb8e4c1ded4edebdd573185a6f9bff1855ce06b49ce708a00290c3c0b6" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512021938/chrono-ntp-linux-arm64"
      sha256 "e64e4eb65f534ec855d5edaf90b3a4730e9648e2f9c06b94bc3f0f1cd708fde1" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512021938/chrono-ntp-linux-amd64"
      sha256 "68f7eb3c8bd9051c8cdeb547bc27c43444c8c44fbe269e17f179bcefa30bfecf" # will be replaced automatically
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
