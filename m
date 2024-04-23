Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D88813F445
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 19:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713900338; cv=none; b=bXsRM2GFEY9esZLc8tIw4Tmo72BhYsmQAavhA9/FRfk84GFrJDPBWev7JcmeLr76mS0OUck2IyCh3sMczVhpdnqKELLB8zoO1EH834CEcuH2DuUhBKbNNSqiJT5rri4uV8RFacKTq5RcjdDvFW8w6Jnt2ynvd1Ag6nZ3qpaqrlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713900338; c=relaxed/simple;
	bh=2bbhNMcCCiv6N+ewcEN+Y+F2rWYZystG+A1e4eVfob8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h+RWoxmWnKkdZShmNGiXMJzApfkpNolnkLbCyH+mZZXcrQKI59vt2Hw4HF9WUbExKUaf17WsCiWWX/bfdDJSyEFeo5gQn5Y1p0PqtDYeHpQ+PvVeHHwGUgaOp9gFbv0HK5Cdj9fwiPuAvh3Ecjfuj0wAQcSO+p3u264P64FKaW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrMHH7X4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrMHH7X4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713900337; x=1745436337;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2bbhNMcCCiv6N+ewcEN+Y+F2rWYZystG+A1e4eVfob8=;
  b=IrMHH7X4vbKJsTf1Jiqc975ttd9NlI4+eYJijX5mnJhZBxasyH9eWQ/Q
   p+V1O6gZNQLvXF/gRoDiFAvOcXGAnCm5EIMreK/fw5wtbiJPGZ/qGpXyW
   mfhnw1re1sSl3JVtEHpRjRt5aCRyYuRYqd/xP3IOn9+9hYMwNduqAOryB
   521rbto6Z64aAGl5F1tPZTqPuqX1yg0dmhOqmVgBFncm0q2RSR5/4sjSt
   xBAzxuAyVzcPPOniJcz3pYu+G9JEyPNiXndAxgLuiRiauy/pDKtlqvqqX
   hXqFi+8dtChEVfwMWI14ofO+tqcV+CcoFb9X3ZjY5U2RzJfuf3dGLk23X
   A==;
X-CSE-ConnectionGUID: mQhCN0MfSkWTh3WjBwebJA==
X-CSE-MsgGUID: pw7N7Dh6RXqDW9IKUTwnbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9613671"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9613671"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 12:25:36 -0700
X-CSE-ConnectionGUID: W01uJp+jRGiHboM8QSfWyA==
X-CSE-MsgGUID: +a6k97EoTvq99nzBVT7nig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24440741"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 23 Apr 2024 12:25:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B1683192; Tue, 23 Apr 2024 22:25:30 +0300 (EEST)
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
Subject: [PATCH v2 0/3] kfifo: Clean up kfifo.h
Date: Tue, 23 Apr 2024 22:23:07 +0300
Message-ID: <20240423192529.3249134-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To reduce a dependency hell degree, clean up kfifo.h
(mainly getting rid of kernel.h in the global header).

In v2:
- rebased on top of v6.9-rc5 (Andrew)
- retested again with `make allyesconfig` on x86_64,
  hence first two new patches

Andy Shevchenko (3):
  media: rc: Add missing io.h
  media: stih-cec: Add missing io.h
  kfifo: Don't use "proxy" headers

 drivers/media/cec/platform/sti/stih-cec.c |  1 +
 drivers/media/rc/mtk-cir.c                |  1 +
 drivers/media/rc/serial_ir.c              |  1 +
 drivers/media/rc/st_rc.c                  |  1 +
 drivers/media/rc/sunxi-cir.c              |  1 +
 include/linux/kfifo.h                     |  9 +++++++--
 lib/kfifo.c                               | 10 +++++-----
 samples/kfifo/dma-example.c               |  3 ++-
 8 files changed, 19 insertions(+), 8 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac

