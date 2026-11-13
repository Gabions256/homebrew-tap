class Tracemark < Formula
  desc "Local code intelligence: every symbol, call and import with its evidence"
  homepage "https://github.com/Gabions256/tracemark"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Gabions256/tracemark/releases/download/v0.3.0/tracemark-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "a76f936a8d9168e29de34c2a7482c1a609f122fc62ff55ea9e4f8b676043e6bc"
    end
    on_intel do
      url "https://github.com/Gabions256/tracemark/releases/download/v0.3.0/tracemark-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "da766b460c924c532a87b8734ea0aac073ded9df25486f775f053dbbf4129c0a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Gabions256/tracemark/releases/download/v0.3.0/tracemark-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "de86fc17b3381257cd3f7e5a054c7d4a10873e30393970219d82fe5fa61db9ae"
    end
  end

  def install
    bin.install "tracemark"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tracemark --version")
    (testpath/"a.ts").write "export function f() { return g(); }\nfunction g() {}\n"
    system bin/"tracemark", "scan", testpath
    assert_match "f -> g", shell_output("#{bin}/tracemark --project #{testpath} graph dependencies f")
  end
end
