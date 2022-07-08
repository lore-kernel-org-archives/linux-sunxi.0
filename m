Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC70F7A
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Jul 2022 18:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49BAC341C0;
	Fri,  8 Jul 2022 18:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657305321;
	bh=cb9aRkfH7qDeTzl1BrTzBay/sOVJzF/E6FhpnficN4s=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=S/uQHR/AQOCsl1pglxqSVI3DvTX8ETyeP1cWO3YcCr3Yg2YtTgcR9UUBrU3GBY6Xa
	 qFjPSdPT7JQssZw7i3BqPmX7k+M4ezxdzCQIKopzRkhh5IUYY5JYg2C3F99q9ttoXi
	 41FVo26zShB4C/bXkq5JNhD2M+6ZNEWlkQZpssw9sHYVmCHoMjL6mNZQ0a4e+klbdR
	 EnxjizW0d3UeByFTsYDtql4txYGDwvBVfDxqvhfoBdwnA36vKtHXtS8GksgWZcWjnb
	 i4WMxVr9bW4RIeW4gPbAOnaC+IPqtFXk3D7T4o4XKtfQRq7Wdj+HG6ZLVh+fv4XSSA
	 yUb4l8nW+U3+w==
Date: Fri, 8 Jul 2022 20:35:14 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner DT fixes for 5.19, part 2
Message-ID: <Ysh44qUmdmF6TWS6@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

One DT fix came late, so here is follow up DT fixes PR for 5.19.

Best regards,
Jernej

The following changes since commit 79471f29ec4870bc02b4fea844e86669a8a4f2a5:

  dt-bindings: display: sun4i: Fix D1 pipeline count (2022-07-04 22:41:26 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-5.19-2

for you to fetch changes up to 884b66976a7279ee889ba885fe364244d50b79e7:

  ARM: dts: sunxi: Fix SPI NOR campatible on Orange Pi Zero (2022-07-08 20:30:43 +0200)

----------------------------------------------------------------
- Fix SPI NOR compatible on Orange Pi Zero

----------------------------------------------------------------
Michal Suchanek (1):
      ARM: dts: sunxi: Fix SPI NOR campatible on Orange Pi Zero

 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
