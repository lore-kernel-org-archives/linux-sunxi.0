Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B132E31195C
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Apr 2026 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298310; cv=none; b=gDQ4uyUreXgVIVTipuVNGcxJEQUmskVYzlc/uQWqx1azto84ukFcFWFbo4vCb7KBj4KEtDd4K2RChXSP6Tz6brWI33AY/oRPIplXgYCHdkIcupyu5HXI4VfnWl+lHxBic/XS22OmAlr0YkoyDOjJjYgT7a2mNRdBvnuxpgLsysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298310; c=relaxed/simple;
	bh=QZ1r7xvI3w3wqabz7J+d/q+8yyT/afyu1ZnTDuVW4fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZuMkirwTncunzV5IytNBav82tQtDCS+PpPrIgyVIbroTp8sqGvDdxx7DNODCHwdfhV72pNtCK4xzC4LZosCci8sxrBiConGVd6y5BzkJdOslm4QxdvXUaxEZd6UQyIgzqhSbtCIs8HnptRJPwk0ky7mPc14vJmm/R1zuQq5PHIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=e0EP0de4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="e0EP0de4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A70E51684;
	Mon, 27 Apr 2026 06:58:22 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.145])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 463F93F763;
	Mon, 27 Apr 2026 06:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777298308; bh=QZ1r7xvI3w3wqabz7J+d/q+8yyT/afyu1ZnTDuVW4fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e0EP0de4qnzJtcjl3ZB/Uq71HNdxxPEbtZpAkMY6nf6z31p4U1hzASzqfi/DXG5uU
	 66NM21TzTUuOVibuCwlnPNTMvZ47SWOIccFmhOsPzuF3xqjaRogSVjveAAOeV2b9nW
	 qGTN9oApIMzxxnnD/Bse8MdZ6u1doWpd2VuFeAs8=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>
Subject: [PATCH v3 1/2] sunxi: H616: dram: fix LPDDR3 TPR6 parsing
Date: Mon, 27 Apr 2026 15:58:18 +0200
Message-ID: <20260427135819.2577234-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427135819.2577234-1-andre.przywara@arm.com>
References: <20260427135819.2577234-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Allwinner's DRAM initialisation code defines a parameter named TPR6,
presumably containing some "Vref" parameter, but containing values for
*all* DRAM types. The runtime code selects one byte based on the DRAM
type used.
This selection code was wrong for LPDDR3, the value is encoded in
bits [23:16], not [15:8]. Fix that in the code, which also aligns it
with the very similar code for the A133 and A523.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reported-by: Philippe Simons <simons.philippe@gmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/dram_sun50i_h616.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index 3345c9b8e82..42a0550e015 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -975,7 +975,7 @@ static bool mctl_phy_init(const struct dram_para *para,
 		val = para->tpr6 & 0xff;
 		break;
 	case SUNXI_DRAM_TYPE_LPDDR3:
-		val = para->tpr6 >> 8 & 0xff;
+		val = para->tpr6 >> 16 & 0xff;
 		break;
 	case SUNXI_DRAM_TYPE_LPDDR4:
 		val = para->tpr6 >> 24 & 0xff;
-- 
2.43.0

