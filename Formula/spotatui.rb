# typed: false
# frozen_string_literal: true

# This formula is automatically updated by the CD workflow on each release.
# Manual changes will be overwritten.

class Spotatui < Formula
  desc "Terminal music player for Spotify, local files, Subsonic, radio, YouTube, Qobuz"
  homepage "https://spotatui.com"
  version "0.48.0"
  license "MIT"

  depends_on :macos
  depends_on "portaudio"
  depends_on "openssl@3"

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "19e380f4d834328ec8a24b07e0c24d7bd36f46feb4f9466fac22a29f45dc3f92"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "5740dcae3d485cb41d3a7191c7fcb39b74be513bef9e024d9260b11005157e0b"
  end

  def install
    bin.install "spotatui"
  end

  def caveats
    <<~EOS
      Spotify in spotatui needs a Spotify Premium account. Run `spotatui`,
      pick Spotify, and confirm the code it shows on Spotify's pairing page.

      Note: Native streaming on macOS requires 'portaudio' (installed as a dependency).

      More info: https://github.com/LargeModGames/spotatui
    EOS
  end

  test do
    assert_match "spotatui", shell_output("#{bin}/spotatui --version")
  end
end
