# frozen_string_literal: true

cask "pisa" do
  version "0.4.369"
  sha256 "bd81f4beb64cf24a01a3413eb4ca64072974280e32972197967ca0ecd763ff5d"

  url "https://github.com/docomoz/pisa/releases/download/v#{version}/Pisa-#{version}-arm64.dmg"
  name "Pisa"
  desc "Meeting recorder with local transcription"
  homepage "https://getpisa.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Pisa.app"

  uninstall quit: "com.docomoz.pisa"

  caveats <<~EOS
    This build has not been notarized by Apple. Before the first launch, run:
      xattr -dr com.apple.quarantine "#{appdir}/Pisa.app"
  EOS
end
