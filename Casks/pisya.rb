# frozen_string_literal: true

cask "pisya" do
  version "0.4.220"
  sha256 "ffdedffbe8a98b6cb7019cd0fbfe81487fdc10fe0a6554fcfed742b227982885"

  url "https://github.com/docomoz/pisya/releases/download/v#{version}/Pisya-#{version}-arm64.dmg"
  name "Pisya (Legacy)"
  desc "Legacy meeting recorder; migrate manually to Pisa"
  homepage "https://getpisa.app/migration"

  livecheck do
    skip "Legacy release: install Pisa separately and copy your library manually"
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Pisya.app"

  uninstall quit: "com.docomoz.pisya"

  caveats <<~EOS
    Pisya is the legacy app, frozen at 0.4.220. Install Pisa separately:
      brew install --cask docomoz/tap/pisa
    Copy and verify your recordings before uninstalling Pisya:
      https://getpisa.app/migration
    Your recordings are not migrated automatically.

    This build has not been notarized by Apple. Before the first launch, run:
      xattr -dr com.apple.quarantine "#{appdir}/Pisya.app"
  EOS
end
