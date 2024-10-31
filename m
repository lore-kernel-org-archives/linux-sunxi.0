Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9257319993C
	for <linux-sunxi@lists.linux.dev>; Thu, 31 Oct 2024 10:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730371598; cv=none; b=IADxzpuyE/7s5C285MygHvIuEMcD7w8+3Wh6CV/9GHMmJdpLJ5ps5QdLjdVLWxEZUGBjMr3FI9cdR8MBvLVNdMk7sn2ef0wqe/4EOSVgiSs6RwQF0+kJTqIaHqFS8u4nyUjSja77HbI2o42lbXNVZglVqBFPBP8A4y2cakho7K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730371598; c=relaxed/simple;
	bh=6PfFS6UMQ7cHAb8+W0ohRERtD1jmi9haCx++tPkMiPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RmuL8YEeAcmP85yw33KkFY4KSWkUcg7yRtXJtN2zfqXanClwpAKMa2Xaus1uWi65SAhiYovEAkJcQYwmMIQrH6rIlTrquejx/sEPkFHbGN4KRACM5YMhT/bNeJuxX2XBmLpdlPK7n81FAivAtEqE797hQbpNyN9P3cupyVaiu9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXI3izTC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXI3izTC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730371596; x=1761907596;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6PfFS6UMQ7cHAb8+W0ohRERtD1jmi9haCx++tPkMiPo=;
  b=ZXI3izTCQowZc57qEr+3mTRHjgTvnAtg+fX/yyVFleIOlP3TnGnQ1hnf
   gPKmKL8QRR3q2zBX1SReybCmLumdrpZlSkY4TZGpXya+S/qCMzUYJu7fq
   7VR3aOWa+Bycah0vdTccJksFkVYL60v5bv1t4htD1kH3dG+gH5c0EjdGN
   FxkQfXhCcbPmwjZOry57KXDhuvVpufr18w5WFJ1fa4BOlJPrbm4L61opg
   KUrIv1N3AzAG8LIbd845od3Cd6cHYrPHMAISCUseuquCdutRu9T2sNRfS
   +RgkFsRwj2ZeJJUFKU8kkKUi3QZdrOehV9bK0VItD/z4l7o8IgEZjera0
   w==;
X-CSE-ConnectionGUID: 01svBswCSMyNm/7JAkQfIQ==
X-CSE-MsgGUID: EqL9YSsyQamGKWdVW0dURw==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="34032577"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="34032577"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:46:36 -0700
X-CSE-ConnectionGUID: wS9ww3noQ76p2kiP9/Y0Uw==
X-CSE-MsgGUID: d7gYKt+VTIKQBMX8fjg2Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="113442251"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2024 03:46:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 281A317D; Thu, 31 Oct 2024 12:46:31 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] phy: sun4i-usb: Remove unused of_gpio.h
Date: Thu, 31 Oct 2024 12:46:31 +0200
Message-ID: <20241031104631.2454581-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_gpio.h is deprecated and subject to remove. The drivers in question
don't use it, simply remove the unused header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index cd159a71b23c..29b8fd4b9351 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -23,7 +23,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-sun4i-usb.h>
 #include <linux/platform_device.h>
-- 
2.43.0.rc1.1336.g36b5255a03ac

