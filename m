Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EA132B102
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 23:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790465195; cv=none; b=IB2M41If/N+5itFfzaR3UCq0c54Jh2dZ8+yTjkKzKPOeycQGiBsJhAcr9IdWBRr6wv3hn+7hoGb/td/7NpuIeI1k1f7L6fzMlu9WfS1HGmfoGKahFkElAU5Ka4jNDluFfWIOboHz0UClSgqVB+f0QC35u5K4DXSvZmuYrOK2YUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790465195; c=relaxed/simple;
	bh=qXRsgdtUI3eUMBcjIZ2U+x5n6IUT1Yp1xou5hmMNBic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rAbMNHqcvJwD6KFSlHGM5UY0obQMyspknMZxyud9a8mLvKhy5e8osNO78RzdYtiHx7m+h2m1XyeXtQoR9XzVDH7L3gc9gd9yThYbWHI12yxpF9CnjAUafcosSlYHSH6BN56ziP3REb4mbzUFTe2TQmBP6giwX6VqjMc8qEKIXuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EcxKL4PB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EcxKL4PB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 840901570;
	Sat, 26 Sep 2026 16:26:30 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A3CF3F85F;
	Sat, 26 Sep 2026 16:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790465194; bh=qXRsgdtUI3eUMBcjIZ2U+x5n6IUT1Yp1xou5hmMNBic=;
	h=From:To:Cc:Subject:Date:From;
	b=EcxKL4PB0mFo7ASPx0Rk/bvEgjgi5o200btsxKGxohYL7po0vh3GM0VEg2dODk6jZ
	 jD065/D5J6X8FCGjJE/9Ljma/fbBaGpFLaVi7RbFbzJBeR4geYDtprEEaCWWBb+t78
	 YJXy/kNfvcwcGXrXh3aJYAFC98p+O26JE5IuVVNI=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Per Larsson <per@palvencia.se>
Subject: [PATCH v2 0/2] arm64: dts: allwinner: x96qpro+: enable Ethernet support
Date: Sun, 27 Sep 2026 01:21:40 +0200
Message-ID: <20260926232142.5244-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an update of the X96QPro+ Ethernet series, but just the DT
patches:
The X96QPro+ TV box uses the second GMAC in the Allwinner H728 SoC, and
connects its RGMII pins to a Maxio MAE0621-Q2C Ethernet PHY. That PHY
is clocked not by a crystal oscillator, but by a clock fanout pin, so by
the SoC.

Patch 1 in this series adds the two 25MHz PHY clock fanout pins to the
pincontroller node in the SoC .dtsi file, which patch 2 uses to describe
the Ethernet setup on this device.

Functionality-wise this series depends on the MAXIO PHY driver series,
though only the DT binding patch from there is required to make a build
pass, so apart from that binding patch they can be merged independently.

Please have a look and test. Based on v7.3-rc1 and this patch:
https://lore.kernel.org/netdev/20260926225625.25969-2-andre.przywara@arm.com/T/#u

Cheers,
Andre

Changes in v2:
- split of from MAXIO PHY patches (they go to netdev separately)
- fix misspelt pin label

Andre Przywara (2):
  arm64: dts: allwinner: a523: add EPHY 25MHz clock fanout pins
  arm64: dts: allwinner: a523: x96qpro+: enable Ethernet support

 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 14 ++++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    | 28 +++++++++++++++++++
 2 files changed, 42 insertions(+)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
prerequisite-patch-id: ded31e4869f9628e1af7f9676c718a17cb4f7c88
-- 
2.46.4

