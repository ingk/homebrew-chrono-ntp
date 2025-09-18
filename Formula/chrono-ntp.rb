class ChronoNtp < Formula
  desc "Minimal terminal clock synced via NTP; ideal for setting mechanical watches"
  homepage "https://github.com/ingk/chrono-ntp"
  version "202509181526"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202509181526/chrono-ntp-darwin-arm64"
      sha256 "b8a81b74699f1de70659fc330f6c3606ba1ccf9214a85db22c772dc662d7647d" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202509181526/chrono-ntp-darwin-amd64"
      sha256 "2783f76b17be3d289d8dcd0ab62df45943977e8ae86deacefa89d69a5458ffaa" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202509181526/chrono-ntp-linux-arm64"
      sha256 "fdabb239b28ffa22932e29181798343b37deccd380a28ccb01d3a6994e4bbdd6" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202509181526/chrono-ntp-linux-amd64"
      sha256 "528a6dd9b39e512341bfc273438f99be9149d9b88ac2c75a14189c3d5db6d9af" # will be replaced automatically
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
