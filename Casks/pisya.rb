# frozen_string_literal: true

cask "pisya" do
  version "0.4.149"
  sha256 "46b722793ad74b87d06be7e2653ecbd7eb0fe1dcdc30e7540460d0f6ee26a53a"

  url "https://github.com/docomoz/pisya/releases/download/v#{version}/Pisya-#{version}-arm64.dmg"
  name "Pisya"
  desc "Meeting recorder with local transcription"
  homepage "https://github.com/docomoz/pisya"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Pisya.app"

  uninstall quit: "com.docomoz.pisya"

  caveats <<~EOS
    This build has not been notarized by Apple. Before the first launch, run:
      xattr -dr com.apple.quarantine "#{appdir}/Pisya.app"
  EOS
end
