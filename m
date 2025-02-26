Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D030619CD16
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740569843; cv=none; b=u8/RyRI/iG9p3sMx3YghHfdgVILUUgahIkia3xisrRNm0Io4XB/0Wi+6YX16mhQ8GSDNRTw7BzLOnvCDu3MrwaH466jFWs1wIMUTmbPT13XpIXx6KcL23paQJakMjr/7iyhsCslwL9PWOCxc8/Q1RyXYGNgBgburQFAFJaANgLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740569843; c=relaxed/simple;
	bh=4mKOWjwJkWjS/DjzFpBgi8fqNJTV++jbofeBK9RWiyY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NMyK4KSVtgmJki4VO4XL9IMUbUphjvygnuCYWLwb0IogqRm9LMkhhmByVaefmMYizkjNKYAN4FCaC3nz19RH8XYCX+xq13KwM4kvd+UZr6U+4ZsIRLK02lBrRf0ycdzZcYv3KO4/MHTpzfYVmLUEY947X90HrdM/FUQDZ654stI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 323261516;
	Wed, 26 Feb 2025 03:37:37 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D19C3F673;
	Wed, 26 Feb 2025 03:37:19 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Peng Fan <peng.fan@nxp.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	=?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/2] sunxi: clk/mmc: Fix T113-s3 MMC performance
Date: Wed, 26 Feb 2025 11:37:10 +0000
Message-Id: <20250226113712.1257061-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

as Kuba reported, the MMC performance of the Allwinner T113-s3 chips in
mainline Linux is only half of what's expected. Checking that in U-Boot
revealed that's actually only one fourth there, since on top of the same
bug as in the kernel, we also calculate the base PLL frequency wrongly.

Fix that by halving the frequency as reported by the clock function, and
apply an extra divider of two in the MMC code - to compensate for that
missing hidden divider (which is the same bug as in Linux).
Seeing only one fourth of the base frequency makes the calculated
internal divider go up by the factor of 4, so we get the MMC performance
back its expected levels: from around 5.8 MB/s to ~23 MB/s.

Cheers,
Andre

Andre Przywara (2):
  sunxi: mmc: Fix T113-s3 MMC clock divider
  sunxi: sun50i_h6: clock: fix PLL_PERIPH0 rate calculation

 arch/arm/mach-sunxi/clock_sun50i_h6.c | 15 ++++++++++-----
 drivers/mmc/sunxi_mmc.c               |  7 +++++++
 2 files changed, 17 insertions(+), 5 deletions(-)

-- 
2.25.1

