# typed: false
# frozen_string_literal: true

# This formula is automatically updated by the CD workflow on each release.
# Manual changes will be overwritten.

class Spotatui < Formula
  desc "Spotify client for the terminal written in Rust, powered by Ratatui"
  homepage "https://github.com/LargeModGames/spotatui"
  version "0.40.3"
  license "MIT"

  depends_on :macos
  depends_on "portaudio"
  depends_on "openssl@3"

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "aaf6fd2ecac45d86a1d2896b81d09d17a48cc8dae7a7779338e1824dad55c2b0"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "49d13d7239c15af1c60eac0ef5493331884cfbe18071362360bf00ade364f14e"
  end

  def install
    bin.install "spotatui"
  end

  def caveats
    <<~EOS
      To use spotatui, you need a Spotify Premium account and must set up
      Spotify API credentials. Run `spotatui` for first-time setup instructions.

      For native streaming support, ensure you have a Spotify Premium subscription.
      Note: Native streaming on macOS requires 'portaudio' (installed as a dependency).

      More info: https://github.com/LargeModGames/spotatui
    EOS
  end

  test do
    assert_match "spotatui", shell_output("#{bin}/spotatui --version")
  end
end
