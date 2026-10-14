# typed: false
# frozen_string_literal: true

# This formula is automatically updated by the CD workflow on each release.
# Manual changes will be overwritten.

class Spotatui < Formula
  desc "Terminal music player for Spotify, local files, Subsonic, radio, YouTube, Qobuz"
  homepage "https://spotatui.com"
  version "0.46.0"
  license "MIT"

  depends_on :macos
  depends_on "portaudio"
  depends_on "openssl@3"

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "180bb9dc36b10acc2c4d1bf70045efc904341fa73b3a63e1b4cd756a5242032d"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "446fe3bb56cbda3cc03f5773fe5d1e78a23e1dd2eba0b32776796bf64490fd16"
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
