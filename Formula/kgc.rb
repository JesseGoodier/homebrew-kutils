class Kgc < Formula
  desc "kubectl get pods with color-coded status and last restart reason"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.14"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_amd64.tar.gz"
      sha256 "c1a06591d4c19b1f29a6562e9c10227da7ee14705ed86211f8ee8703e28d20a3" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_arm64.tar.gz"
      sha256 "68b0189d28ac048de0bac06cca15b11a61f7f238f3afac08223c1f48b8765450" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_amd64.tar.gz"
      sha256 "cdd628a5ef1fea1150207d4baaac04afacfdc9077dd8ae930070c5215d80cc65" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_arm64.tar.gz"
      sha256 "8e4954631fddba8231e67461ae3e6ca05468183746044c9eee0ca1ff8aa9d7d6" # linux_arm64
    end
  end

  def install
    bin.install "kgc"
    (bash_completion/"kgc").write Utils.safe_popen_read(bin/"kgc", "--completions", "bash")
    (zsh_completion/"_kgc").write Utils.safe_popen_read(bin/"kgc", "--completions", "zsh")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgc --version")
  end
end
