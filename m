Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2ED21FF25
	for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 00:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151210; cv=none; b=CNkEjEBiJ3C544VXjkF6oPhUCgUB5q9RVBjrb+WgrNvchGe7RyCXHxweQxFVov29+LuG0kP8NdORKfeIcAcb51OAxQbq/j0mL9/5OhA1XeASFA9VMD77g23pql1HJQWoYqhmsbVVspihmtjhkzExQPAOOr6VCPOFZhnQoiM9esg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151210; c=relaxed/simple;
	bh=sC8htZrcfJEvRMXc8wv3egJtmeaLsQ3QudQ+ojdiVLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ehu5Odj7bVVNrOQncko+f86cLG75615mgwJXJkT3WMXmSr7Lo3MIm/9bFTyOoBRPWV7m0cpIc767mvPSfUSjgLZAaClKcydOuFlwpRjfMvowMAS89e2p6o3ptQn3Vkg83DFZRte8AvcQi9g5tS2jDpYDmtm4Hrf/8u7Xr+CM5Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOzDAtgy; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOzDAtgy"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-839dc688d6cso1179992b3a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 17:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779151209; x=1779756009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZL8R42vUa8OZgmzVrA9ew7tVcpkru1FmRyxgoHHAOI=;
        b=pOzDAtgygKahAoKuDR4f3EctF1VFIrNoHx/buKsMJR73kEH/tEVQmVWTx7mm+5dMh/
         qCYvggDnaiIfohFm68NUEoUhz8d3diYX5YwOpkEsA90l71Z0xO6vvkIwOBaJKGCGB8QD
         q6IPV1/XvyI5hldHAVFSq1LJZwpO+lYuoiO6WP+DmW8Ygr2rH4T3Piglc6OYIMFolNhJ
         ABs3T9/H0v/vCiKNYNyXJ3YMkCP0PjJbd4weaTJl9kKn2EqK/ga+5w+f2/CrmPrkZF+c
         vQNZEVDvIYMTq0csNpEKseNWEpo4m0VYsBv2TESwP7pzrFeilCRL+ri1GjfHJQqhC8MS
         IXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151209; x=1779756009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZL8R42vUa8OZgmzVrA9ew7tVcpkru1FmRyxgoHHAOI=;
        b=J9pWKRxlagu5okRmWa7e0/l+oPVJil/F6AmgQpEDdP8jNeexLnDdxaLLP0LAW7eVP7
         k2Pv4TJ5eV8QAy7oo6D4dPLPX7cH3h6o8TV+aJsTVaCK4gwRnHsQRXUm+mIjYwjzsnO9
         oKhMb4vXn1jMZakURk8Y+88QP6BJNauX8g/vbXbJ5pxs2My9GhlF8kVtIGYxCezXlR+K
         ByevINf59Ldz7Cq68tmUNfcyBXDMba9bkKUvzy/9Ci5iE3lcXl74BsO3rtUBsK1mF7i6
         ykfFS3XkMIJBbihnWrKnVy7Qyiz2D5Kpzu5Ox7hZ2f65pxlmoP8OJd9iNPxRmCUGk6lI
         0HZw==
X-Forwarded-Encrypted: i=1; AFNElJ9QhNlHePFMWfegaw41SMZ21sE7H2lIb+WTQBWgKHxBJMdMKuX5hd1mvrAdohbObSjz6WPMBGKlWeiJgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9iLo3aCcaQkaB6Pajp8reRjWX9/M/eDJoGnOAfg7ZA9KLa5O+
	G4lcvSHKFgaRm86hzMY/06s0wDMTEjzlrXS84KBxKrVPyv0wAE70f7Z6
X-Gm-Gg: Acq92OGQsF+teF1HNR23WLEiiqde6teBvJWODCLEJPxmLz16it7/2vzWiIKPDOCDS7K
	prr4rjtObh2vduxsd21GUSUeo3cTvNfPo6vnnd88ObDDUpoBDa2OlJ2TU14gqWjQJxczdim1U5U
	hQp1asW8Ugbh7JWlhmLcvYT0hoSkNN9nF2cM0CdBcFxDp+x1zc7SPcz0Jyhf6ARUFp+Vl61T1jM
	lhX8wx3HxHtUTo/+T82g9jWTV70biPgmL+bEM2TqmwA1doOezOpuim5xKaA9iKTxfUPkNDWitqK
	PT/zNpj0OhIY/K8lYpW7Gs8lCQhGbyOUx5UT4UDmqyPIqWXstCzZJWcEBhZ6q0KoW+2dk9uZMgC
	QWU1ennNjjQHKVc5iDesJ0HP5zwPjhILCMQpejycauSOytd5ur7UI5a132J/YZRnxl+o+HGYHi3
	/n816QeyI88XqzWCTpCUpZ/uQLQStbo1jUid7BR8GtDSASsjZnUFGWLcVehbSyzLXZ/rsDhOqPX
	SrkuBXKtyC6t/BvlGGxlGsSdb9OIcdxv3nuD19QLMYaUA==
X-Received: by 2002:a05:6a20:72ab:b0:3a3:171f:6aff with SMTP id adf61e73a8af0-3b22e6685edmr20892462637.2.1779151208559;
        Mon, 18 May 2026 17:40:08 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb062695sm14473479a12.4.2026.05.18.17.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:40:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: sunxi-ng: Use of_device_get_match_data()
Date: Mon, 18 May 2026 17:39:50 -0700
Message-ID: <20260519003950.626727-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of_device_get_match_data() to fetch the RTC CCU match data directly
instead of open-coding an of_match_device() lookup.

This also lets the driver drop the of_device.h include.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index f6bfeba009e8..a3cf0dde05be 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -9,7 +9,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>

 #include <linux/clk/sunxi-ng.h>

@@ -353,14 +352,12 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 {
 	const struct sun6i_rtc_match_data *data;
 	struct clk *ext_osc32k_clk = NULL;
-	const struct of_device_id *match;

 	/* This driver is only used for newer variants of the hardware. */
-	match = of_match_device(sun6i_rtc_ccu_match, dev);
-	if (!match)
+	data = of_device_get_match_data(dev);
+	if (!data)
 		return 0;

-	data = match->data;
 	have_iosc_calibration = data->have_iosc_calibration;

 	if (data->have_ext_osc32k) {
--
2.54.0

