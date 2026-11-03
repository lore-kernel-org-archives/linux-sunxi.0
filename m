Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730653;
	b=QUMfyE2X6Wma88v1vf6JPRuCoe/w0VjiFGNsoqmaz2mQ7wXYKjUiUzDiCnfZsXJPl8Dn
	 59lEpE/gcfR5zq8hIuDV7s2Mwqjv8rInf3i+fT/5Lf6B55gfr5zvOd6IWyVnVuCDQfmeF
	 JIadnklLRZTPWqY3fjmBZj+3ammAy3sFHCe4GC9HwyLTjpXi0tj4WtMn5hdhEzV5m0ui0
	 gZgIsnXYlcuVk2wwkpS8Y1xdRvpFOcKSPV74DWF+a3OCjsIo3mzneIFldfv/rRQZtj50L
	 1E0L9tMwX7F+0DfyFef5F/dkmvE6a8kkugQsA5aA9G8RpnzdHiChFjbn4sgGgModzpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3GsiDmClXUsZuQhYM79SYeH9oaXJBKEF/AnaKpHO+KY=;
	b=fUV9G/etFvtUQByWVCLYK4u3S95h9t5YJyVR/UkuoSCnXzeAynSwpoY74LFvsJZpBs7f
	 3Jbzi2IuPewTi1r75XooBTH/X4pgYP6irSkcNWcw+uTcrLVCRvlptYAz8MSTML14DFOyz
	 pUR4IgpDa8T22E2hu8z9KZOvAiQiSQegKJ5hgF8WiEKvBcp0D3YGTET5nehCFSUChb6EW
	 4m1wbbpFH2okSYMX3SNrIxiacPP8B4O83dF2buW/Ooxri80kQTlEYLUySPoKCS41DkM3T
	 ZouGq3pcvvNfNmdSZSPzmu8HiWMyAcC5qh/MsfLFePISacbR+2PwFATV+29roElu5xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ee+IEWOX;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFC2606A32F
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 18:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DFC2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ee+IEWOX
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so22984495e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 10:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730652; x=1794335452; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GsiDmClXUsZuQhYM79SYeH9oaXJBKEF/AnaKpHO+KY=;
        b=ee+IEWOXO9uhFPx7w2bACvDJMKoW9U5ZeuuLX4KMZz547lcQJHVe6biO/oCbfrywqF
         HAiVOjUcUSL/XV9fHvS+gMpcn/UrU7JgLdfTES6RCydEDnTFQEMNhz2HcKZcXoRzvs4b
         qs0EAXSboUu2/m/q4Mo6RD336AMQE7nFNwhP/df8xVoWLIiF3QFuUt2QvrCDaf1M0cre
         pbw/ECNiDR3JPGCfKG7eR98BWwrkZzriU3p628T2K2UaeZWvQuGZ/FzvP1MJslsUbehY
         FJkSW+o+FcXEcYSfzl5O2W/N20sVc3G7HJL/kBDtX4n8aRs9Ys5v8tzeGfYskK1A3uuK
         hL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730652; x=1794335452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3GsiDmClXUsZuQhYM79SYeH9oaXJBKEF/AnaKpHO+KY=;
        b=h7dhK+pb6ZU1EPdU6qYjYQtlFj5ZngEUwrO7rg/eQC8uuQaBe3dNWwlWMLA50FexA0
         2/s56SmKaniG9N7NMIhtuTBnTk3l80MpeTlqO40xpS0M52FXEUHM6pHhPEV1+A+nXwNA
         7ARRgC+kC2Hr8cnXaHxNcAUHHWGfD0+Odr5ykmJbd35xSybOpQ/po1N1I9DUxFzU0QIC
         tHbctVAUszEw4/Hj6Jsg72CG8Ecj1bDoGpBMY/w9LbV4IXmS89QcdwqzHVT+tgZjpjhe
         X5XiUM7lHDOF1YSxfGc/yVkpb3tAPICiaGNT9S6NE9YhVdg9U9W49vpSfBN+tJwVzYom
         hQrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsgIEpAf7VMy1gWtsng+QSGOwh6FoeBhH3v7ggndx/v57BZrXQSf10vko0E+Rpl6yDFgcWa1l6jDwg/g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+kl+fz5Gb3eDEIHP8Oi7IUEbyZoYLIw7HztLxeFhQsbL3D24si
	VFWxNwcmoym22KcjF7hdtFREkaVGC6lPHyWH90ERltIE+yu9TAAgtC8t
X-Gm-Gg: AYBFou0RLOvSve4PFBhCI20CeFEUe06fTfYPbv1G1BJ2Pr6sI7mh0URLfrziI9NlbRJ
	jgdnqUqo9udPOnA0zGKO3Ng49CBiX+ltnXECAVZ3zaPjk6K/Sd+zA+sPFcv9mgUflotZa30p2pm
	Z7FLE0SUMX+gAZbMf4GitD+8GjPE0bD0VdFwah+mJ5m2MjDMdON0dDfBB9it2cvCgA5vjnuaMq1
	E9teTDdHOF86205VA8qxXrXbUN6OzvngbUEAI1WPnCBNWr5M2ooKhrA6d/hXu9XtvzviWVwJG16
	iEEVe2TAx+4E5AvlW3BuMI78rgVTlGNAHKIrHeqmXSGMNJ9C6WStmjSVYDA7xakDBAdI3+6bltL
	lR/UmHcxFzYioPjhL7eFPTHsf8IlMbJzNgsgAZ7Odx25OGhhj135KY11jaPQ6C8elSzxgjWCHeq
	4G/VtEK4qtOuPa16SDLa+BIM2k6qKRbt54wzkBdiwENtffceJHGKti99ugbPv5EaGS6L/msqFzQ
	SeNR9XKtgMR/izaryzaLugnqj7R3m2sQ1fOQtwqRxMLeabj8gA1FLtk83rSrfSiGv4G/89PfvwK
	Q3bjWFAzESdE4SWAAMq3YzCM5mjTSqy13fno3PUo6vQPk79lHPgTUJ6YRZqv7nD0Zf70pr0DygS
	W15b+4jqGuhxVPThXkPtdgs4kDwP0RM+b4WAVe9hJI7crEKx/E2UvIv7Hsv5BNVyur0gjzrRzrw
	YzZw7Gm7Ay/h8QPVVU7g0zjC3jOWNS96YOv3VBkQHg0972yoPcQdhJv6i3LEMFcqDxYAf1W2BMH
	Ag1UvBfhAyi4JJ8qmiPF/7UHLWSLU+gZWIfj2cNw50v4dtqmg==
X-Received: by 2002:a05:600c:1d29:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4ac187a7678mr340616585e9.21.1793730651873;
        Tue, 03 Nov 2026 10:30:51 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/4] mmc: sunxi: Report manual stop errors correctly
Date: Tue,  3 Nov 2026 19:30:27 +0100
Message-ID: <20261103183030.81078-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103183030.81078-1-jernej.skrabec@gmail.com>
References: <20261103183030.81078-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a data transfer fails, sunxi_mmc_finalize_request() sets the stop
command error to -ETIMEDOUT and the threaded interrupt handler sends a
manual stop command. This has two problems:

- If the manual stop command succeeds, its response is stored, but the
  provisional -ETIMEDOUT error is left in place. The request thus
  completes with a stop command error that didn't happen, and as the
  block layer only checks the card status in the stop response when
  the stop command didn't fail, errors reported there are ignored.
- If the manual stop command fails, -ETIMEDOUT is stored in the
  response instead of in the error field. The block layer then decodes
  it as an R1 card status with random error bits set.

Store the error of a failed stop command in the error field, and clear
the provisional error when the manual stop command succeeds.

Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on Allwinner sunxi SoCs")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index fe4c0f6d73f3..9744b6b860ac 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -470,10 +470,12 @@ static void sunxi_mmc_send_manual_stop(struct sunxi_mmc_host *host,
 	if (!(ri & SDXC_COMMAND_DONE) || (ri & SDXC_INTERRUPT_ERROR_BIT)) {
 		dev_err(mmc_dev(host->mmc), "send stop command failed\n");
 		if (req->stop)
-			req->stop->resp[0] = -ETIMEDOUT;
+			req->stop->error = -ETIMEDOUT;
 	} else {
-		if (req->stop)
+		if (req->stop) {
 			req->stop->resp[0] = mmc_readl(host, REG_RESP0);
+			req->stop->error = 0;
+		}
 	}
 
 	mmc_writel(host, REG_RINTR, 0xffff);
-- 
2.43.0

