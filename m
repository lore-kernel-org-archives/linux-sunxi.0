Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140052264AD
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 13:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761572069; cv=none; b=cGSzFJwROdzNaAdzwC83c9cq7eEzkVkB5BSPr5DAELIko2B6EmH0WJnntfVMcmDvloV8oKvXNSS+1S8zVut7mzun/IKHUE1hWKx2o4winM2IsyrP6hB9wZpkG2L5dc0JyqkVDiEO5vQrP8kfy+CG4OE+GkZaqUmds6ui6/o+Yjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761572069; c=relaxed/simple;
	bh=pDOIWQm2Pb2yaskYb7YG9zNBNAaV4QP98n/IzFf/fTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AbGZLOkR0fV5wDs0pOd4MvvQhU7wJ+F4+XKRYSUHjh++++yGhyv4htGxpMI+MqYbc3ViFzDOBDXOO0vNTV79KWJk56BH5+pDATf8StjJf9+CdA1SIvjzTniA/cL3Tt/wYpXx/HlXHNzYdnSmr7HrWY8rDuU9F3XGIeCudGHm794=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IoTBSSds; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IoTBSSds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761572068; x=1793108068;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pDOIWQm2Pb2yaskYb7YG9zNBNAaV4QP98n/IzFf/fTs=;
  b=IoTBSSds6HqsF0FVeVyKrA8BcYwy9Ri1kqzfV727ozuyWGcswWFry+GF
   QPmPV5EMNwN9o5d6CCiasXsiZeIP3Q3WzhtR/Ipz3hvfOWdS1dvtpdf6o
   Ymh6NEqqDoJH/oBLjScNx0I673ftT3w8mPin/8bwyS2h+f4OruBD+Ur5I
   1YR0FsJ9u/J7fyOp+r+wRqr9QLzSbWMn3RFH2HYSki4OxQZ9OMZbMUEuz
   LOn4XmzYizWxHOISLWDHq1e0+eL6u8uzVa/rQ0ZWr7AIlhnQKadPSGvwB
   5FZ2HN8XHfs+968gVX3k3hge7hAF/dzXEqRVuQBdl+XbDO4ekGmslRxqf
   w==;
X-CSE-ConnectionGUID: Oq6xmJKwQpaS3dUl/11PmQ==
X-CSE-MsgGUID: QxZakUdYTNOHgAhFisoC9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63549471"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63549471"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:34:03 -0700
X-CSE-ConnectionGUID: MAweIGDcR+6Uu4QLokWN1Q==
X-CSE-MsgGUID: oyiT45llT5+5Seg48/7Xrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="190256817"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:34:01 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2898B11FADA;
	Mon, 27 Oct 2025 15:33:59 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDNMF-00000001eEe-0bu7;
	Mon, 27 Oct 2025 15:33:59 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/1] bus: sunxi-rsb: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 15:33:59 +0200
Message-ID: <20251027133359.392984-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/bus/sunxi-rsb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index 7a33c3b31d1e..82735c58be11 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -373,7 +373,6 @@ static int sunxi_rsb_read(struct sunxi_rsb *rsb, u8 rtaddr, u8 addr,
 unlock:
 	mutex_unlock(&rsb->lock);
 
-	pm_runtime_mark_last_busy(rsb->dev);
 	pm_runtime_put_autosuspend(rsb->dev);
 
 	return ret;
@@ -417,7 +416,6 @@ static int sunxi_rsb_write(struct sunxi_rsb *rsb, u8 rtaddr, u8 addr,
 
 	mutex_unlock(&rsb->lock);
 
-	pm_runtime_mark_last_busy(rsb->dev);
 	pm_runtime_put_autosuspend(rsb->dev);
 
 	return ret;
-- 
2.47.3

