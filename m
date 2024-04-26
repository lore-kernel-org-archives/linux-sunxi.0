Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55439824B3
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145133; cv=none; b=ui18OOC52py7wEVrX/Q28EP2xt2cr5JFvfleVm8MHjrroL5yJ2WA2R8SAmKcu1qNXZALlaHBGgTsCcOSA1FD3PewD/hO8BCeO+XQt9NrwMQ9MuerjTFWesFBpwQQAjXEDZOO4t1z3ocf9QEefbD3w1UM37wdKCNbPxvJ6Cxb04E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145133; c=relaxed/simple;
	bh=IL2++mNo2aq1MBXdWEeDx4hUUCVamp5GSDIQcKWJuhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kxgcp9KRy6ohxOASAHAKkeUdDhZf5JgU6QroeMhQNGrP3ORiGsE35jLHPAmQ3sfR7aP7tl/RrRcNalMbweOl4b1TJxnfVXaCJcLo3lo7a+NawimMxX5ivRD5qdnhZV1/MrNrGFJnOhH0SThYevzjrk1UIeToWO6kS09x6COMmzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2xr+VWG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2xr+VWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145132; x=1745681132;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IL2++mNo2aq1MBXdWEeDx4hUUCVamp5GSDIQcKWJuhY=;
  b=M2xr+VWGqNr2dvsUwuK22+w7RP2BSgr0mus1hNZvn8FR7GZoW9qJo2kJ
   CrebwCPFs49pdn9XCmR61CTCjdlcYXxGGjaiwwmH7i1bwNVkazT2CW7YO
   AaHiwtNLbuh9OnD1UCkBegioPtGcNV1KXW2U2dwQ2KeqGYYK+8BKfH48p
   prGRXfJ/NnbNoqud/k9lNISDaIBg5BHXnGUWNwQrhXqRG+OktyXN9gjEG
   NrjssjMj9HwTVHKpq81l3e08blsL0xgLg+o1RwasVeCEnor/dH1XE8tRn
   WudswthYt4AwskQeF+8umedoWQMohKj0To4lI5opGg1Vq5FZX0XrvQcdb
   g==;
X-CSE-ConnectionGUID: 5krPqm0WSQeIGoOMF/yhrA==
X-CSE-MsgGUID: Twwxw9jgSBa382TySXpGkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10005887"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="10005887"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:32 -0700
X-CSE-ConnectionGUID: 1bBkQqt7QkSddjdFx/K+hg==
X-CSE-MsgGUID: AtZdl5jVTUSEYoTRDvhmlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30084013"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 26 Apr 2024 08:25:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1DFF01CB; Fri, 26 Apr 2024 18:25:28 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Samuel Holland <samuel@sholland.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v1 1/1] leds: sun50i-a100: Use match_string() helper to simplify the code
Date: Fri, 26 Apr 2024 18:25:15 +0300
Message-ID: <20240426152515.872917-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

match_string() returns the array index of a matching string.
Use it instead of the open-coded implementation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-sun50i-a100.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-sun50i-a100.c b/drivers/leds/leds-sun50i-a100.c
index 62d21c3a3575..119eff9471f0 100644
--- a/drivers/leds/leds-sun50i-a100.c
+++ b/drivers/leds/leds-sun50i-a100.c
@@ -252,18 +252,16 @@ static int sun50i_a100_ledc_parse_format(struct device *dev,
 					 struct sun50i_a100_ledc *priv)
 {
 	const char *format = "grb";
-	u32 i;
+	int i;
 
 	device_property_read_string(dev, "allwinner,pixel-format", &format);
 
-	for (i = 0; i < ARRAY_SIZE(sun50i_a100_ledc_formats); i++) {
-		if (!strcmp(format, sun50i_a100_ledc_formats[i])) {
-			priv->format = i;
-			return 0;
-		}
-	}
+	i = match_string(sun50i_a100_ledc_formats, ARRAY_SIZE(sun50i_a100_ledc_formats), format);
+	if (i < 0)
+		return dev_err_probe(dev, i, "Bad pixel format '%s'\n", format);
 
-	return dev_err_probe(dev, -EINVAL, "Bad pixel format '%s'\n", format);
+	priv->format = i;
+	return 0;
 }
 
 static void sun50i_a100_ledc_set_format(struct sun50i_a100_ledc *priv)
-- 
2.43.0.rc1.1336.g36b5255a03ac

