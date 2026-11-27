Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766795;
	b=Wf4ethkYtStdjWlsmVJDET6upWgEN+lH+5SZ+8rdWa3syo1lc6bQ7uRcGoT/hdsDzPQh
	 uCZ8lqpnSMwMF04w8nIUMqWD/51FsJXQYwU5rbg8i4MMORwawOL+vUhMTVbtbFnZU9ybe
	 uHFfAiQCzBKoB9fwf1Ai4bC38GtW4LzQT98YkrB3N0ZG84HXndwSMGfVP//Md8GYsru9k
	 UwVAP4hNPqZdFqTWWFTpNSFh8QSkXgVfJ0vLTWJi1up1667Mr1gPOvxcXaQWVsht28QkL
	 3pHqPS9gDkXuU58OUDHE6rUSyIscukFC7PUmhJX9CzSFD55uVq5jarPfZUXUidpBnAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766795;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JbbcS+ed9y83OaOFK5PUKHNOgSt/0NxFFt6TN7c/NeA=;
	b=aMooFQNELCqau3/2JdsG7kkmBejeTUT8DuGki4GtRds62b2lOm8NCRKUJOMitfeBHR9u
	 oDqP0HmFvjZco419JIEMH/rAABHmiM3Bha0Vafp2SgqdvHdqaW0eYk2jzpsEd2OhN9DFv
	 o973IjDJSTZ34yzeMLItrRzsL0EcQs1fpEiHmSCiWDloP08Ax5VvfnpSX4ts0+YdkrSda
	 oa5UU0c+BmtSph5MjGa+MPzRu/BVhPZeBGG8QvH5u2HYeKzeTveursnZWMYp0kP1kalKB
	 dTq7Cs/uyxzfMlONBWYDhN/elU7aqDOgvDI0vmCspsa7+HLn/SZ5eSfH3Y52N8GHRsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=G+gTxcRt;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F005606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 08:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F005606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=G+gTxcRt
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 604994C951;
	Fri, 27 Nov 2026 19:06:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795766785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JbbcS+ed9y83OaOFK5PUKHNOgSt/0NxFFt6TN7c/NeA=;
	b=G+gTxcRtm4bOeWErhAYSCvXdMO4Bxvk3TOeLqL39u+qA7X/I0/tnjaEGVs3WT1JKSLA049
	IcAI6me3PpclK7uj/3ywUxecNd/mskIu6f7yezwmsfXzxULzw2dFTcJTciRJOVqcoXSf4d
	DXBCF7vi6QfvN980XdEY3XV4eGQpftlZMVhpO4gZDs8FgUQjAKB/XH0knd+dHFKtJ5M4x3
	Yq0+kL9keWotR2MrMV8KzUjnoT8D8gWGNcvvwTbSwsx78DLf9XQLgVjnPog02IcqkFPrbT
	7gHx8e0NJlOETq70G7LLz2tqvJjaUFJEsjPrTXb3JcoiwWZMdY5DozRfjBQs8A==
X-GPT-Reason: legitimate; the message is a technical software patch
	(kernel/driver update) that perfectly aligns with the personal
	mailbox (alastair@d-silva.org); the sender domain (d-silva.org)
	matches the recipient domain, indicating a personal/professional
	correspondence; the content contains standard git-style diffs and
	"Signed-off-by" headers with no marketing, phishing, or scare tactics
	present.
From: Alastair D'Silva <alastair@d-silva.org>
To: Ulf Hansson <ulfh@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH] pmdomain: sunxi: pck600: Initialize pd->pck in probe
Date: Fri, 27 Nov 2026 19:06:25 +1100
Message-ID: <20261127080625.1982574-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
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

sunxi_pck600_pd_set_power() dereferences pd->pck->dev on timeout.
sunxi_pck600_probe() never sets pd->pck, causing a NULL dereference.

Assign pd->pck = pck during probe.

Fixes: 76e4310115ca ("pmdomain: sunxi: add driver for Allwinner A523's PCK-600 power controller")
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/pmdomain/sunxi/sun55i-pck600.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/sunxi/sun55i-pck600.c b/drivers/pmdomain/sunxi/sun55i-pck600.c
index 81c3b18a38a4..46632278b8f4 100644
--- a/drivers/pmdomain/sunxi/sun55i-pck600.c
+++ b/drivers/pmdomain/sunxi/sun55i-pck600.c
@@ -175,6 +175,7 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
 		pd->genpd.power_off = sunxi_pck600_power_off;
 		pd->genpd.power_on = sunxi_pck600_power_on;
 		pd->genpd.flags = pd_desc->flags;
+		pd->pck = pck;
 		pd->base = base + PPU_REG_SIZE * i;
 
 		sunxi_pck600_pd_setup(pd, desc);
-- 
2.53.0

