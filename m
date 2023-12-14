Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC763692A0
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0PnfO1x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CA1C433C8;
	Thu, 14 Dec 2023 19:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702581588;
	bh=SLnwOfnZIrvB4VzBl+S7nelpsQ3BWswHTT1pzK3ba6s=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=Y0PnfO1xw9oPRJjtjNXQztojKz5nL5HTowk1D7mVbfgXB+kpyEUWI+5nnJkVJ0BK1
	 mP+ZeDhaQq61KjHQmDu+QHl+VZJZKU8Dz3D9nF8XaEUsKTFkMNcNAggo2uovhIpsvu
	 D5X4m9nW0OutzNrZKYDjP+rNyvc2MZllY2il3DAgArC17fvJKs9J/EDLF4aBgkgzZD
	 5/ZPEQZ4n6ntlFJSz7XoIej8qfBUfeW5HYM5k+kn18FJqaItp7vIKEDHCcQZWaKr/3
	 Hx3HI/y0NvbhSXhHyvDRFcyl65IlecCBAeOaILo93mICBZ1uU7h/6E197I0cs6fj1z
	 TEMAuggTyZ8Uw==
Date: Thu, 14 Dec 2023 20:19:44 +0100
From: Jernej Skrabec <jernej@kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner fixes for 6.7
Message-ID: <ZXtVUJ0SG2NRpPG4@archlinux>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following DT fixes for 6.7.

Best regards,
Jernej

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.7-1

for you to fetch changes up to b9622937d95809ef89904583191571a9fa326402:

  arm64: dts: allwinner: h616: update emac for Orange Pi Zero 3 (2023-11-18 23:24:34 +0100)

----------------------------------------------------------------
- Fix ethernet node for Orange Pi Zero 3 board

----------------------------------------------------------------
Chukun Pan (1):
      arm64: dts: allwinner: h616: update emac for Orange Pi Zero 3

 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi | 3 ---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 3 +++
 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts | 2 ++
 3 files changed, 5 insertions(+), 3 deletions(-)
