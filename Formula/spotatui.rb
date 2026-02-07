# typed: false
# frozen_string_literal: true

# This formula is automatically updated by the CD workflow on each release.
# Manual changes will be overwritten.

class Spotatui < Formula
  desc "Spotify client for the terminal written in Rust, powered by Ratatui"
  homepage "https://github.com/LargeModGames/spotatui"
  version "0.35.6"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "1c43a5c985502b7bdd3f66404f07f6a7ab39456ce7e058131c0141721550433d"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "fbab56d2b9c9dcded364033bdebf3c27d9f1f268797d728e3368bdfbac284796"
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
