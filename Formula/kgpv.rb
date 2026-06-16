class Kgpv < Formula
  desc "List Kubernetes PersistentVolumes with PVCs, pods, zones, and sizes"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.14"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_amd64.tar.gz"
      sha256 "5a5c749c7f86f201be2f30e0f51d7f468ecc0d4e497ffda68c1c66e820ce1540" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_arm64.tar.gz"
      sha256 "5d73e19c0ac63c959a58050ea73d744aa5b0a2a5484b6bc8f62ac8e8ff90f4d7" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_amd64.tar.gz"
      sha256 "386c2cf408aa9fdb662ef0822ad05e1206762dbf99182c6e8e53cc92f46fae1e" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_arm64.tar.gz"
      sha256 "fa7dd3ac816d628eea1d40fb8b0995912d2758eb579d3be8d2db80267a79cdd7" # linux_arm64
    end
  end

  def install
    bin.install "kgpv"
    (bash_completion/"kgpv").write Utils.safe_popen_read(bin/"kgpv", "--completions", "bash")
    (zsh_completion/"_kgpv").write Utils.safe_popen_read(bin/"kgpv", "--completions", "zsh")
  end

  def caveats
    <<~EOS
      If you use oh-my-zsh, the kubectl plugin may define a conflicting alias.
      To check: alias | grep kgpv

      To unalias for your current session:
        unalias kgpv

      To make it permanent, add this to your ~/.zshrc:
        echo "unalias kgpv" >> ~/.zshrc
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgpv --version")
  end
end
