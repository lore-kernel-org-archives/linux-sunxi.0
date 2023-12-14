Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC08697B1
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 19:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNrTMyT0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8DBC433C7;
	Thu, 14 Dec 2023 19:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702581786;
	bh=1jSyaZzwOop1fqkEuKg2l2BsCl81VoWnlMNWcTHjtkg=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=SNrTMyT0hl+WomlcINkwaLBDWus58T5BE17Gp9muT9+dt3VrWii1Kcyp6bb1ileHi
	 4rOuANGr7UZAgd0zObC46yDkEmBaIZb4a50BPx8DeWdFKk+qzzcgzBSpl516KIEhB0
	 IlDOBkaY2pHU5zVkpw9DslghVZpuCZLGRy11/W0d6ZmCw4t9BBvlXEA29DjdRHORc5
	 wUMAOXPxFxIPEKBDkGh+8WpaFHlUqODVtb3azmJYlrLp4q55Fx6q281cwtVuaHetiI
	 zSbfv8608dOOA2liQoD6I3Mp6u/aYI3VZ6oYVNkDwLTo65bbS443IqgjP/vyc3LUBe
	 jB+dncnBoyvZA==
Date: Thu, 14 Dec 2023 20:23:02 +0100
From: Jernej Skrabec <jernej@kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner device tree changes for 6.8
Message-ID: <ZXtWFk-Bne835txP@archlinux>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following DT changes for 6.8.

Best regards,
Jernej

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.8-1

for you to fetch changes up to 557e5347ba8bb050fec39c488486c4a948f2e4aa:

  arm64: dts: allwinner: h618: add Transpeed 8K618-T TV box (2023-12-14 19:53:04 +0100)

----------------------------------------------------------------
- new boards: Orange Pi Zero 2W, Transpeed 8K618-T

----------------------------------------------------------------
Andre Przywara (5):
      dt-bindings: arm: sunxi: add Orange Pi Zero 2W
      arm64: dts: allwinner: h616: add Orange Pi Zero 2W support
      dt-bindings: vendor-prefixes: add Transpeed
      dt-bindings: arm: sunxi: document Transpeed 8K618-T board name
      arm64: dts: allwinner: h618: add Transpeed 8K618-T TV box

 Documentation/devicetree/bindings/arm/sunxi.yaml   |  10 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts  | 176 +++++++++++++++++++++
 .../allwinner/sun50i-h618-transpeed-8k618-t.dts    | 161 +++++++++++++++++++
 5 files changed, 350 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
