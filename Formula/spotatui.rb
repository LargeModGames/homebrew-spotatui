# typed: false
# frozen_string_literal: true

# This formula is automatically updated by the CD workflow on each release.
# Manual changes will be overwritten.

class Spotatui < Formula
  desc "Spotify client for the terminal written in Rust, powered by Ratatui"
  homepage "https://github.com/LargeModGames/spotatui"
  version "0.36.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "04b0ddb92be81550c6c08a62968c941322b8a59122e09b551997ee17db97cae8"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "9a18a524293881037fd770bed2070ab7c59921d4d3d1d8e8ae6251e743eb4948"
  end

  def install
    bin.install "spotatui"
  end

  def caveats
    <<~EOS
      To use spotatui, you need a Spotify Premium account and must set up
      Spotify API credentials. Run `spotatui` for first-time setup instructions.

      For native streaming support, ensure you have a Spotify Premium subscription.
      More info: https://github.com/LargeModGames/spotatui
    EOS
  end

  test do
    assert_match "spotatui", shell_output("#{bin}/spotatui --version")
  end
end
