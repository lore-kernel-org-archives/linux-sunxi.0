Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450690;
	b=bEKsfKRFhVTK3GHibV5++Tp41FfxvMUS3wCuSNBPHZkJfKMoCl5a+9M3MEE0QZOoYdtV
	 X2xGg0030mNLMUwHltWVA3NxI0fQaKwk6gixsj13wKbpxp79m+NDzlwaAU0RX0ANpYDVS
	 7wynQamSwvfr9E8ZSqNqjMCWCeNSvEUf9qPrB880oJ4a5yplJ/Bs+0ePWON5NzSjs1h5Q
	 mAU5kUb7HmILumHt6sCTqYiVUQ34s1PdVwQ6JgMTxkRZTXyodHSSxxEbKln6016jRZZQp
	 lYknXfFBL3c1B6R3lxKf2lGhzEzBFRQwsgoV/NiiaQbV5DrV37fpN2CzQq5u16Kqf8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450690;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PSYYKqvNBHQRpRXqr6rKxOfnsA0fN/waXWV83fOGwXE=;
	b=petL3aLPQ2Lim4bbLFofwQzIVcoJWWDlw/5HC+//YaqX7sGPg8reZdqtpRCByEAehWlz
	 9f7xI4jzxcdPvF6P2wHP7PKJf+h39IR7QzmnrDP1c7jPcHOsVBv9kxfcWGB/Ciyi2CHS7
	 aWTuO0Mk4nTxE55MGXteXzDohv11GOlE8jygqYwXM4MWQuY7Knq4vlllGSbAbLwPEQNvE
	 12to+YbBjnDK8T6B6tDGZ/RUCo4KiZo4h2iqkah66sWfYLZ1vtouMyQxMkXdPOCAbkX9d
	 zPsy1ufR8W2S0tty50GrH4w6I5K/aAsLHk9+iCyqHFEm+8EbCA0N4Ft2ZSsNHv8JJvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ELpIaBJp;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE91606A32D
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 02:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AE91606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ELpIaBJp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ELpIaBJpKA9J7AdD2NrAn+mvJYewlQpidOK53oTm3s7AO1Qt4pudeJZfGiVrr4C6sItXD40FChFuP
	 c2u6Xh6hsgwucdOx9YtDJnx91RB7aly0D8+xEapgjWG4k1m8OCk2w6hjlMBOMwNoqT9OlzXKvnneGA
	 hO/ZuC/eTcMScZO4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af524ffb9d-dd5fb;
	Thu, 12 Nov 2026 10:31:27 +0800 (CST)
X-RM-TRANSID:2ee76af524ffb9d-dd5fb
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af524feafc-eee32;
	Thu, 12 Nov 2026 10:31:27 +0800 (CST)
X-RM-TRANSID:2ee86af524feafc-eee32
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: wens@kernel.org
Cc: jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] soc: sunxi: sram: Release node references when claims fail
Date: Thu, 12 Nov 2026 10:31:26 +0800
Message-ID: <20261112023126.118228-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

When claiming an SRAM region fails, sunxi_sram_claim() leaves the phandle
iteration before it can release the current node. The rollback loop also
parses each previously claimed region without releasing the returned
node reference.

Put the iterator's current node before rollback and release each node
after undoing its claim.

OpenAI Codex assisted with analysis and patch preparation.

Fixes: be99eb936b4f ("soc: sunxi: sram: Support claiming multiple regions per device")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/soc/sunxi/sunxi_sram.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 2ccaeacf8c70..4667661b2003 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -294,12 +294,14 @@ int sunxi_sram_claim(struct device *dev)
 	return 0;
 
 err:
+	of_node_put(it.node);
 	while (count--) {
 		struct of_phandle_args args;
 
 		of_parse_phandle_with_fixed_args(dev->of_node, SUNXI_SRAM_PROP,
 						 SUNXI_SRAM_CELLS, count, &args);
 		sunxi_sram_release_one(args.np, args.args[0]);
+		of_node_put(args.np);
 	}
 
 	return err;
-- 
2.51.0



