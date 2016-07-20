class StanzaLinux < Formula
  desc "An optionally-typed, general-purpose programming language from the University of California, Berkeley."
  homepage "http://lbstanza.org"
  url "http://lbstanza.org/resources/stanza/lstanza_0_10_5.zip"
  sha256 "b7e893869a586f023eb3b5b3e5dacb5bae50e1c5e7e242aadef291a9eedfb0d3"
  head "https://github.com/StanzaOrg/lbstanza.git"
  version "0.10.5"

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
