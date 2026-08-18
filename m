Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A548265620
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Aug 2026 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787059644; cv=none; b=rRTYA3trlsjU34IiYQMEIQh2COksO4DYhImYz9NDzt5bbx02fOstGnGtfhQEdv6KiXRll2zWwzRvQHEjUEz2ejrXI8v6PlcL+y3wQvpfVqiXNcxo4BugXVxgY+5ezQFOq1Luxtnc84oaq2XMkU0nivAd5eH0WI/83rAcFE1qUbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787059644; c=relaxed/simple;
	bh=0RNb6mAFf1biVAsNXj5XoKHaO8YRzpezL99+2akIeAg=;
	h=Message-ID:From:Subject:To:Date; b=LjqCiLQRARmmMC/tJ5VFTE4Fez1UrKXRNYZfdrZo+QHVEAROrFGdSz11wm1gcanah64ak2DJ7y6pdsnQDXsEz6AJ5VXJgKZzSBOzFcyiBa79NcfapHgdIvVTVSzJ4uSNcM/UI6IUu19EH16PMVFm3Q9qhZhzgae0gPscdL1TLNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=xiUN4Jd1; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="xiUN4Jd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787059639; bh=s/R8YXq/jdT0RMiTQ8drI7mqnf4rvZtAc7EKvxishIU=;
	h=From:Subject:To:Date;
	b=xiUN4Jd1ADYVR8XZnCGBqxbG71It9pEl35XhtUQ5fj0L4d/6NoigOkVUwEGRh6Lp+
	 FKD0suRdv8QD8uEo/QonWqoI7Ubw9n/vPg8UCcAGiR/wbPnz2dVw2/mZq4QroT000g
	 ArEcEU8uBC3K2Xk0IR67fMgKy3vxKUUsBxiKC/Co=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 1721C6D8; Tue, 18 Aug 2026 21:05:50 +0800
X-QQ-mid: xmsmtpt1787059545td7dssfc9
Message-ID: <tencent_3AEE86932EE0F9AF7D6549FD705139A4AF06@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznooasm1iYEna7Z8uUEc4a65tvmBXCMCAMXEfgiwRn6Bjzdsh428
	 8LlfZ0T531NmyK3xWhGJd//wcZKx03zpyhsjz+CUVDuUSSZkrZG9CrvdqditywmTkVsmFfGfXKDP
	 Qqo2vY1MsOSvWJ7c7777sgkP94zoezKMUXCa3cNU22iLStcwK9veFs5CaIhNthzlS7T3ndrI0ZZ3
	 B0aTU9IQW4cmJxL4vrljpQZb7kt+nBsmNHiSZ7GCip2N4Q92Jo7RvLJXa8n359pcDOgvG/2H3Tec
	 +DGBTOxiy+Lbkyl31iDiCd0HKlRs3pgiEXhFlbyIlVQhCe07IUYqrypKgAxdwsyleH14/I6YXNl7
	 0zbcaViu2qjnZXKnAg23ym876sCW38OXXiM+OEBNgXrPdgJrMPLHSv9SpfrEgRsIcHcHlPAL/bzg
	 HYBs0/jWAubBQyrYleFnEU3PVe1qOvDRKelMmz+sUubTapMnmQB5X/sLAK+s/22Q666SyiF/fVm8
	 n56pnJSXJZ6GgPP4/bzOyFXfaTfmx7dFvSfPU0m6B1vhjwSoH7/yL3OAwo9gnCcNgZqXp4Aawkfg
	 ZXfS4VCJr1Fc6gsfcDpVdaPe+1jc6LBmXImZUTeYdX3Ke7mVZ0K9MvNR34/L/C7ToAAYc2gkI7g2
	 Cdz8SEvJGztW7kbQxjeUfs7wlj3OCGCdiDrjZ9LSpzFcYG2ce98HNdPbBoEysfb2E56cqLb5TEp7
	 twb5hep6d8KolJcl90RkYIVGo/19lpptVVpgg9fAAxy+NlUfILi8AJsYzA81wQXvzu6KVeKfKoZK
	 GrN1aJsS0ZcqXKtA7y8i7vo2mE4njU4xF9YTpAUd7Twp4TkmlRE7Vm/hyUCF4SSL7uw09moIp2+w
	 UzPv+KnMHlaPxquxM8IUewXFPsdkISmi0KhOlydTIQe8e213gDa7wGyFKNdjlFiGgPHZIVpEgw3E
	 StLBcSMB2PO3T66SamCODQSy/mi8eXtfuB7YLV9CYD7QfLztXQXBSdMBKI5nKPdriep31NygPNLL
	 GgVN7Z1AhMeMItczdDa3TInBwmBUmy1bbB+yKhZW1VT9YpQAKzREUMiJ6wYTk=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Jiawen Liu <1298662399@qq.com>
Subject: [PATCH] drm/sun4i: frontend: fix clock leak on reset failure in
 runtime resume
To: Chen-Yu Tsai <wens@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Tue, 18 Aug 2026 17:27:15 +0400
X-OQ-MSGID: <178705963597.291840.3745581396856240806@qq.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

sun4i_frontend_runtime_resume() can fail after enabling the bus, mod,
and ram clocks if reset_control_reset() returns an error. The function
previously returned without disabling those clocks, leaking them and
leaving the hardware in an inconsistent state.

Check the return value of each clk_prepare_enable() call and unwind the
clocks that were successfully enabled on any subsequent failure,
including reset failure.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -647,14 +647,22 @@
 
 	clk_set_rate(frontend->mod_clk, 300000000);
 
-	clk_prepare_enable(frontend->bus_clk);
-	clk_prepare_enable(frontend->mod_clk);
-	clk_prepare_enable(frontend->ram_clk);
+	ret = clk_prepare_enable(frontend->bus_clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(frontend->mod_clk);
+	if (ret)
+		goto err_disable_bus_clk;
+
+	ret = clk_prepare_enable(frontend->ram_clk);
+	if (ret)
+		goto err_disable_mod_clk;
 
 	ret = reset_control_reset(frontend->reset);
 	if (ret) {
 		dev_err(dev, "Couldn't reset our device\n");
-		return ret;
+		goto err_disable_ram_clk;
 	}
 
 	regmap_update_bits(frontend->regs, SUN4I_FRONTEND_EN_REG,
@@ -664,6 +672,14 @@
 	sun4i_frontend_scaler_init(frontend);
 
 	return 0;
+
+err_disable_ram_clk:
+	clk_disable_unprepare(frontend->ram_clk);
+err_disable_mod_clk:
+	clk_disable_unprepare(frontend->mod_clk);
+err_disable_bus_clk:
+	clk_disable_unprepare(frontend->bus_clk);
+	return ret;
 }
 
 static int sun4i_frontend_runtime_suspend(struct device *dev)

