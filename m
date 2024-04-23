Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120191420B0
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 19:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713900340; cv=none; b=W+tgrsybvD406THOG7YdwemvZo3wkg9ua485ppXmZsFuW9FgNs9aOQx8cE7s6CK+YJyLWZe/VQ9Qp0NI/zttRf4Zn1QtBXkD/IpcdsPOg99MGqG2+hAYfs5VavunxjC2mtQxMpy5Qa8o0a2LQPReGxXvcfaw3AG5C8qSd2ktJ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713900340; c=relaxed/simple;
	bh=iARSuX9KuhJ/Yd1VAlCEEM5wx1EpDHoBr77TViozzoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WK9Io+80eEe0bwliL3DoE9bD8xPoF5rhk90bJrUp+9iDF5dMplyihjYi+329sObRwaIrRSKhwqO9Zi1p5lTvMFReNQjsr6gX65k7QibAzLekJUdpR+KEcgmIueJHEPnSpkQdJawLBUCn8UNRK+GUvQnfiSt0+jClEJBxcLiocyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUlvadOh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUlvadOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713900339; x=1745436339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iARSuX9KuhJ/Yd1VAlCEEM5wx1EpDHoBr77TViozzoM=;
  b=VUlvadOhQBI2imQIG3AxDHhK4EAWylnpWc7Y+lvNxVm3luh7Sc5Tsfpf
   RuwVKOtEqk1cGATAHN563MKrbi71ebCms0cZm9eLKdAb4Gp9IjuY7+0PK
   Udr6TNRWq3TYWeKcSn8HFAdcuboj81BfDz9YtAyyEi3EZx8ggOdcvpggn
   wuhI5ppKOK5yTc2Rt/l0M9/EHyToR3nUWUZD2LtaKPwFT4fvkVgwLKM2+
   lSwS17LUBMqWxFvXaPUkWj6RiEY+Kmj59DW0fIOelSKxEGmR4AlaDDML9
   ks0nBYivBvBdvP2ZDzKba/aR/TqEP/hhCH73C4pb1Tww8DUGlZ2vOMQYC
   w==;
X-CSE-ConnectionGUID: eJBrVviDS8ezAc5P6ViidA==
X-CSE-MsgGUID: l22LNgv7RGKRjrvSDwkU3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9613657"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9613657"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 12:25:36 -0700
X-CSE-ConnectionGUID: w/ztJlpcRnuDr+9rvjbvpw==
X-CSE-MsgGUID: v5WeMhnJTXS6NM71pfP0ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24440742"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 23 Apr 2024 12:25:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D372D489; Tue, 23 Apr 2024 22:25:30 +0300 (EEST)
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
Subject: [PATCH v2 3/3] kfifo: Don't use "proxy" headers
Date: Tue, 23 Apr 2024 22:23:10 +0300
Message-ID: <20240423192529.3249134-4-andriy.shevchenko@linux.intel.com>
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

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/kfifo.h       |  9 +++++++--
 lib/kfifo.c                 | 10 +++++-----
 samples/kfifo/dma-example.c |  3 ++-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/linux/kfifo.h b/include/linux/kfifo.h
index 0b35a41440ff..6b28d642f332 100644
--- a/include/linux/kfifo.h
+++ b/include/linux/kfifo.h
@@ -36,10 +36,15 @@
  * to lock the reader.
  */
 
-#include <linux/kernel.h>
+#include <linux/array_size.h>
 #include <linux/spinlock.h>
 #include <linux/stddef.h>
-#include <linux/scatterlist.h>
+#include <linux/types.h>
+
+#include <asm/barrier.h>
+#include <asm/errno.h>
+
+struct scatterlist;
 
 struct __kfifo {
 	unsigned int	in;
diff --git a/lib/kfifo.c b/lib/kfifo.c
index 12f5a347aa13..15acdee4a8f3 100644
--- a/lib/kfifo.c
+++ b/lib/kfifo.c
@@ -5,13 +5,13 @@
  * Copyright (C) 2009/2010 Stefani Seibold <stefani@seibold.net>
  */
 
-#include <linux/kernel.h>
-#include <linux/export.h>
-#include <linux/slab.h>
 #include <linux/err.h>
-#include <linux/log2.h>
-#include <linux/uaccess.h>
+#include <linux/export.h>
 #include <linux/kfifo.h>
+#include <linux/log2.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
 
 /*
  * internal helper to calculate the unused elements in a fifo
diff --git a/samples/kfifo/dma-example.c b/samples/kfifo/dma-example.c
index 0cf27483cb36..74fe915b7ffe 100644
--- a/samples/kfifo/dma-example.c
+++ b/samples/kfifo/dma-example.c
@@ -6,8 +6,9 @@
  */
 
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/kfifo.h>
+#include <linux/module.h>
+#include <linux/scatterlist.h>
 
 /*
  * This module shows how to handle fifo dma operations.
-- 
2.43.0.rc1.1336.g36b5255a03ac

