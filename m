Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A822D1411E5
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 19:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713900340; cv=none; b=A60yji2+SyVGAILx0o3tNjyOfYprOHskvgnrvZc16pHIEV75s17uU4RMPaed2f/DRPHu7i4pFWEym31tFsmVwZ6MH7A9IkYKu9LGnFtfLsNB9U7A/l9QALZHYPVUmUDtH8Ln46eZMwTtFCqlUPQHZmdLcCGhTjyXPnlA6G3nCt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713900340; c=relaxed/simple;
	bh=HTsoFANv6JLEmjESsOo2isIzkzhPyuPDbVVy0uob3Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUahyauUKbXZJtvamDuR3BRSG0mek4KtCQZICaq4HWF3nkqCRrOmlPFMCIZOyzqfnRiOnQpg0hHnafG02NnxyIZysD0X1zAiSs3ZzxHK4Pl+/nEsLBO4epNCF5pevZQpnmj8fugDrefO8T53VdXIIdbBlC0We+iqlFx9fzNz09w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OObMbuik; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OObMbuik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713900338; x=1745436338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HTsoFANv6JLEmjESsOo2isIzkzhPyuPDbVVy0uob3Zc=;
  b=OObMbuik/TdAntigQ2fc22OtrkJWXkyaZUgsvEwVgAG+dmg+wf9leBFg
   nWj2grJlV9Tp0Gt7dRU8U41Zsss8yxMG6sCLRPhStHW70JwM5OetVP/Xo
   kvku7QgtN6eXDfd+fTGbPnU+smFzsZbMPZOHxLDo1eQTzTduWSIWCyveB
   tuLsO07JkjDDQxoUXtbRU5FFpiwv+rlef3C86xDsvbki6JR4IY6PP3KwP
   7FybKa2mECZU4dTv3Z7wk9HNd1KOL5W7h0NwH6OQdZqJIYSXGHz2dw1sO
   0SJrEp2nxd5ZiMvN/VMa7rwq3gSrBShGYQ3QlY3ZM/Tg4uSU6O3HXnPMZ
   A==;
X-CSE-ConnectionGUID: 331tSr/ZSBOzzh8aK2r83g==
X-CSE-MsgGUID: UHUIMiqxT12NXQ5KPapRBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9613686"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9613686"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 12:25:36 -0700
X-CSE-ConnectionGUID: jU9dTxssRxCDT9Y4mI+TiA==
X-CSE-MsgGUID: owZMSlD9QfSf3MU/LQ5KuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24440743"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 23 Apr 2024 12:25:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CA0E244E; Tue, 23 Apr 2024 22:25:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Sean Young <sean@mess.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stefani Seibold <stefani@seibold.net>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 2/3] media: stih-cec: Add missing io.h
Date: Tue, 23 Apr 2024 22:23:09 +0300
Message-ID: <20240423192529.3249134-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240423192529.3249134-1-andriy.shevchenko@linux.intel.com>
References: <20240423192529.3249134-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the driver the io.h is implied by others. This is not good as
it prevents from cleanups done in other headers. Add missing include.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/cec/platform/sti/stih-cec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/cec/platform/sti/stih-cec.c b/drivers/media/cec/platform/sti/stih-cec.c
index a20fc5c0c88d..99978a7c8d9b 100644
--- a/drivers/media/cec/platform/sti/stih-cec.c
+++ b/drivers/media/cec/platform/sti/stih-cec.c
@@ -6,6 +6,7 @@
  */
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-- 
2.43.0.rc1.1336.g36b5255a03ac

