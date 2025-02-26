Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8650322A
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740569847; cv=none; b=QEjw3fO28++VLl1S79z1KHsQkLp1JruPeKhFdCbEHHymwf18legSUKMVG2icu/OD/gsUUBeooQ1Y3Dk53w++5CoqCa8h9UDECjrRiJU8/wy63WhvK/A7iu1UwVLVRslBf7VCGeZCKMNbdIRvH4Z8gz2MzJCOumQ1MZMPy9s5LO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740569847; c=relaxed/simple;
	bh=rThUbXKJi7PsNV6qvvIdfqQMeP2JiaAGn3O/T4UBvO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p010W0dq3w0JOItM+JTDyZoiPMArnBLkE98upgfTwCuZ43QF/Q1CcFL0Oij2vCRsQh6Xt+6n8CtCoIXIaa6eKKKrb7LOF+Oij9s47qrBoG1zZd9Dpg0F7Wvr96EWmWii3hjy1TiXs7FhP92WS4C4iOVbCmNpupgsuStlX/qF4w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB3261516;
	Wed, 26 Feb 2025 03:37:40 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63A683F673;
	Wed, 26 Feb 2025 03:37:23 -0800 (PST)
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
Subject: [PATCH 2/2] sunxi: sun50i_h6: clock: fix PLL_PERIPH0 rate calculation
Date: Wed, 26 Feb 2025 11:37:12 +0000
Message-Id: <20250226113712.1257061-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226113712.1257061-1-andre.przywara@arm.com>
References: <20250226113712.1257061-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the Allwinner D1/R528/T113-s3 SoCs (NCAT2) the factors encoded in
the PLL register describe the doubled clock rate, as in the other SoCs.

Correct for that by always dividing the calculated rate by 2, except on
the H6, where we need a divisor of 4 (no change here).

This corrects the PERIPH0 clock rate as read by the MMC driver, and
actually doubles the MMC performance on those NCAT2 chips.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reported-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 arch/arm/mach-sunxi/clock_sun50i_h6.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
index b424a7893ea..359513d1669 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -147,15 +147,20 @@ unsigned int clock_get_pll6(void)
 	if (IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2)) {
 		div1 = ((rval & CCM_PLL6_CTRL_P0_MASK) >>
 			CCM_PLL6_CTRL_P0_SHIFT) + 1;
-		m = 1;
 	} else {
 		div1 = ((rval & CCM_PLL6_CTRL_DIV1_MASK) >>
 			CCM_PLL6_CTRL_DIV1_SHIFT) + 1;
-		if (IS_ENABLED(CONFIG_MACH_SUN50I_H6))
-			m = 4;
-		else
-			m = 2;
 	}
 
+	/*
+	 * The factors encoded in the register describe the doubled clock
+	 * frequency, expect for the H6, where it's the quadrupled frequency.
+	 * Compensate for that here.
+	 */
+	if (IS_ENABLED(CONFIG_MACH_SUN50I_H6))
+		m = 4;
+	else
+		m = 2;
+
 	return 24000000U * n / m / div1 / div2;
 }
-- 
2.25.1

