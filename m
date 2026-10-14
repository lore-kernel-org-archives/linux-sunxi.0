Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6693E2AB0
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 19:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792006372; cv=none; b=R+lbh2hs1/3b5s7o0Xee02MvJS69ZFvyH4U0aaTG0Fy73aQwu7NInPjBryFJ+v0qB40Ut9vz30RQMis3a+5aZSQduGge6hZ6e7RUXB912YdqKCwrKqugJ9c7rKsi8YmsEusLPxJH5KkCuPiBLbzZbOogQHwQR2IQciRgUn+ohT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792006372; c=relaxed/simple;
	bh=CHwRqVxsnHjeGl/EzDs6jplQ1XElmScr9zvEPr3Dl1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tjY2xpUIod5tyXgRhcfedViE58zsv2nZAdCzpfd6zEyw1RKYtk1HEFbexma5J4vdnSXL/ITpgOcVjH+44SnLbU4swQhzEVMQQY8dBC9iawlrO9ivsWZzcCx7dTRw7riiJxTHKTp6X9PYxRpQnqNkIYEUMIJU9cyE9Mx89AOAY6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgg2J/hd; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgg2J/hd"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso675459f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 12:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792006369; x=1792611169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUucbabIGrn3bRd3fXdHgTzW7jRpxaxIBGMPCbeA8Ms=;
        b=dgg2J/hd9w8oEIolckyPkQS5yc2qLd/VEohEXfi32QF5Rlg4h18aVG1ZvjtjahtCJn
         hGhr5h9vwfzGqIZnii1oW03f1v5qaWneWX2GJ910arh/geC1pb/ePDWfYkMi/Fq8nJii
         066wH8kQAYGiCaFx0TH/D8+kjWnFD2LZxEvAUKatQjnq1SRs9EXRL1stYvhtnxns6muC
         rjkUh7FvZAznZ7u0+6ttX7byk2KiF6uwkJmIGfBH8ozQ16Aowg2E+GV0TMaUTiEC3dyX
         FQTBlmDbGsByKxAAPM4cVZRSm0rxMdiB96xTCd82o6Rv6txzRlhcFiUQ/AL6r8Slmhc5
         mJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006369; x=1792611169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUucbabIGrn3bRd3fXdHgTzW7jRpxaxIBGMPCbeA8Ms=;
        b=cvc2COCdGL5m7m4qVKTYNPx/Ff6QlesSkbBxgPGhj//OdwKoQ/hvCgOzrHmC2Qj0X9
         eksc+8GEyxPvVzWf1eDFrJzWVii38OkFjBmrl2/xoFXkBLsJsDq5Fj4Ah3li7Qus++Lg
         gYKEMxdTkXaflxXFQZpeT/ved3cm7A+37jGs2nL5UVitvBWBE9CL1nlZyVmzA2HywPpC
         E/k2NVkeEOrd0QiK7kBmmoxVwGousAW6qWPk5oqerZuX9I7vsJtuDaDs4eDULh4UnEIG
         hmZlAW4CiUA2xQfk3AgB8SkKaYujgrZWX2UtArKPLoaQF4JVsSBtSmD+c+8jggShwjCR
         EPWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxC6Jf0qSY81kV+Dk0nuXAxK4tGKRZrCX2d85O/46zJqBHPnEwM9kGz/6871tymqLx5FLbYHDTCJPXoaQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJPuHUek57IKxOF5qPRxrxMvmOLyDZBxC3K/kzV7b6ulktMu+ci
	zxc4bJXGO5EcSoXDPo01Y6DWio0ASDUfVi6eZ6fhb31/r53+h+zWCMTM
X-Gm-Gg: AYBFou2eOoyYD3hzulGWvAOL8Up1BNirEEqcqOjLzMMDtzkTHBlYK82QMKeb9HKnJIR
	gvkzvYEDgNc5IqdjTbtXZGGbm79KVw8COFKAB3b0BZJMQSMg77bnYZL20hfbo67MUW0pmmayMK6
	WlQhJQxbG2MgCfC9OlM+Pwl/sXHAuM0RaeqhGuaBr4//nNR08zXc7FgfbxPGm3jA7xs3cY5Lxdo
	4y7oeJFHSaaBrirmcEJU0hY2wcjj8ynEXVyUfcqk8hiGdwEmgcdCUhEf5EizXTWrS/jFQ0/AZ0g
	MLynv077AfrpzPq4U7qln/HqjLlRaiIK9JzoMrFiq46lh4mMOqNhOpJDBgyhJYnkZ3ru+ETicbU
	wMT7JAjgOavq/Yo892vAYErF7XfR7Veoamx79DUgiA1PW8SX8hKPfjuMqTBmrmVIYW0XvKD7wRU
	MYJSkXGo2k1m0OhKT0qtUkJ5NYIz70tJCdst75VgZh99uZJHBldb83xlC8xfco3HQ3yqCLFP+mM
	75V0sPp6nuURFT6Q3dcHYqgIQStQUHX
X-Received: by 2002:a05:6000:298e:10b0:48b:5e2:52c7 with SMTP id ffacd0b85a97d-48dba77cf13mr25773200f8f.8.1792006368804;
        Wed, 14 Oct 2026 12:32:48 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4e8csm13151463f8f.23.2026.10.14.12.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:32:46 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pablo Mazzini <pmazzini@gmail.com>
Subject: [PATCH] rtc: sun6i: fix error handling in sun6i_rtc_clk_init()
Date: Wed, 14 Oct 2026 20:32:20 +0100
Message-ID: <20261014193220.38055-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set sun6i_rtc only once all clocks are registered, and unwind fully on
error.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 7fc60880e409..dd293e8324b8 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -231,6 +231,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	const char *iosc_name = "rtc-int-osc";
 	const char *clkout_name = "osc32k-out";
 	const char *parents[2];
+	struct resource res;
 	u32 reg;
 
 	rtc = kzalloc_obj(*rtc);
@@ -267,9 +268,6 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	}
 	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
 
-	/* Yes, I know, this is ugly. */
-	sun6i_rtc = rtc;
-
 	of_property_read_string_index(node, "clock-output-names", 2,
 				      &iosc_name);
 
@@ -280,7 +278,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 								300000000);
 	if (IS_ERR(rtc->int_osc)) {
 		pr_crit("Couldn't register the internal oscillator\n");
-		goto err;
+		goto err_unmap;
 	}
 
 	parents[0] = clk_hw_get_name(rtc->int_osc);
@@ -309,7 +307,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 					  &rtc->lock);
 	if (IS_ERR(rtc->ext_losc)) {
 		pr_crit("Couldn't register the LOSC external gate\n");
-		goto err_register;
+		goto err_losc;
 	}
 
 	clk_data->num = 3;
@@ -317,12 +315,22 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	clk_data->hws[1] = __clk_get_hw(rtc->ext_losc);
 	clk_data->hws[2] = rtc->int_osc;
 	of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+
+	/* Yes, I know, this is ugly. */
+	sun6i_rtc = rtc;
 	return;
 
+err_losc:
+	clk_unregister(rtc->losc);
 err_register:
 	clk_hw_unregister_fixed_rate(rtc->int_osc);
+err_unmap:
+	iounmap(rtc->base);
+	of_address_to_resource(node, 0, &res);
+	release_mem_region(res.start, resource_size(&res));
 err:
 	kfree(clk_data);
+	kfree(rtc);
 }
 
 static const struct sun6i_rtc_clk_data sun6i_a31_rtc_data = {
-- 
2.52.0

