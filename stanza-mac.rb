class StanzaMac < Formula
  desc "An optionally-typed, general-purpose programming language from the University of California, Berkeley."
  homepage "http://lbstanza.org"
  url "http://lbstanza.org/resources/stanza/stanza.zip"
  sha256 "4c56e399e0814e9a44844f1a35e47fea1b487a8ed24b812be679859141ac4543"
  head "https://github.com/StanzaOrg/lbstanza.git"
  version "0.9.6"

  def install
    system("./stanza", "install", "-platform", "linux", "-path", prefix)

    prefix.install "stanza",
                   "compiler",
                   "core",
                   "fast-pkgs",
                   "pkgs",
                   "runtime"

    bin.mkpath
    ln "#{prefix}/stanza", "#{bin}/stanza"

    inreplace "#{prefix}/.stanza" do |s|
      s.gsub! /#{buildpath}/, prefix
    end
  end

  test do
    File.write("#{prefix}/test.stanza", "print(1)")
    system "#{bin}/stanza", "compile", "#{prefix}/test.stanza", "-o", "#{prefix}/test"
    system "#{prefix}/test"
  end

  def caveats; <<-EOS.undent
    Add the following line to your .bashrc or .zshrc:
      export STANZA_CONFIG="#{prefix}"
    If you are using Fish Shell, run this command:
      set -Ux STANZA_CONFIG "#{prefix}"
    EOS
  end

end
