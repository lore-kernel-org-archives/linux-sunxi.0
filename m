Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396549;
	b=RjNWTin6P6A/Va7V/EAE6PwxYcZV6w8bBDGX4mGUZ5sr1y+DLW7/eH+ARS3XW54rRhOv
	 arYQBFvmLd1HxAvZJwuHDq41n8cFYpqSx9XLMWcnEoOHtuGFIH3d9JH1g5P30lCCmJsr4
	 WQ90sV3iTEGs/gp5j79zOGur4vHMMdiwfsCfiaDoHBw5+cOmziIWfBgQ6nsI+xiqLCT0s
	 6lyIIsZGn4i2lIRACBCn6FbeoSyNybv9BAreuNT3u4yHlLUApQNjXNS5kf5unQkrEU9+k
	 K+cUzzlAgVtEDwnGRuiPMjcNSS4P4NPQoZrMe/Xz6qxubF7wMCiuOOJCmGMDR+Ib8qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396549;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xtlSslIv8yyKofUr6fezJE3hB+sqQhvOYjegQ+KxQ18=;
	b=x0OMeGBiav4oHvgMESSdc5g/x30xcnYKvW1QxMObXNc9Vfs/f/opu0DgHNma5Nbz9EqC
	 uvbdUTaUCcU9blSObQPEomwj0xjGzXNnavtOhRKDedtaVoXivkBDY5XfN2dIsvfF0k6Db
	 seq4+HI+dze++xqKxNHcGgo915pZdTWD7FgFydnOOp4dsJ/zCCnbamS1D2/pDfCaafGjl
	 dWJ4xSDv7GliUBqgWD64n1oBqyszmxjuLiJFAp48Mnpz4fWFZqFdLFWxgplaIESJYPzhw
	 nNPnjfz+o7vK9mW0thmJ2Cq73FIb3rwLIhct0GlKOisymxIEWAlaB+ziwkliNerkhjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=u5ff06I5;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678F606A320
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 01:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9678F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=u5ff06I5
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id BB7D642712;
	Mon, 23 Nov 2026 12:15:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795396540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xtlSslIv8yyKofUr6fezJE3hB+sqQhvOYjegQ+KxQ18=;
	b=u5ff06I5ROBOg4cQRnyNz/DLf0k0Lqn0Am3zTaHxjO+RpBPfxZ6PNO8TWfd+2JLDIzs4bP
	jEk+sJKCziDo0GV/B9UzwUTpIkHt5GFMwxyS9cXZenSXEU4yIri68MdN/AkVAmRl0/0+Kz
	8usZsHhP8jy915oDA+5DAULbILcUL/0PZYllL4lwXJ5t7v8/hfSJMu/Zf48tRoIH9fPPjl
	LksRJrH9eH+eRyT8TqE1R75vIsE69l8kB6/84a6ANdntG9suvdPDSX6+nCQ1TTvKx8dKxH
	Il3CPk+spBSx2CP9sKVez8HB/+Lp4Oe1myeO3wd99tHQ5jI3POJkjKgcFdP6wQ==
X-GPT-Reason: This email is classified as personal/technical communication.
	The content is a technical software patch description (Linux kernel/driver
	style) that perfectly aligns with the mailbox's owner (alastair@d-silva.org)
	and the sender's identity (alastair@d-silva.org). There are no
	signs of marketing, phishing, or urgency; the message contains specific
	technical details regarding voltage masks and bitwise operations,
	and the From/Return-Path domains are consistent and authenticated
	by the personal domain.
From: Alastair D'Silva <alastair@d-silva.org>
To: u-boot@lists.denx.de
Cc: Andre Przywara <andre.przywara@arm.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Peng Fan <peng.fan@nxp.com>,
	Tom Rini <trini@konsulko.com>,
	Yixun Lan <dlan@gentoo.org>,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 1/3] power: regulator: axp: Fix AXP318W ELDO voltage mask
Date: Mon, 23 Nov 2026 12:15:32 +1100
Message-ID: <20261123011534.1692975-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123011534.1692975-1-alastair@d-silva.org>
References: <20261123011534.1692975-1-alastair@d-silva.org>
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

On AXP318W, ELDO1-ELDO6 span 500 mV to 1500 mV in 25 mV steps.
This 41-step range (selectors 0x00 to 0x28) requires a 6-bit mask (0x3f).

The current 5-bit mask (0x1f) breaks voltages above 1275 mV.
axp_regulator_get_value() masks out bit 5, reporting 1300-1500 mV as
500-700 mV.
axp_regulator_set_value() only clears bits [4:0], leaving bit 5 stuck
high when lowering a rail.

Update the ELDO1-ELDO6 voltage mask to 0x3f in axp318_regulators[].

Fixes: 71f07932756f ("power: regulator: add AXP318W support")
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/power/regulator/axp_regulator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/power/regulator/axp_regulator.c b/drivers/power/regulator/axp_regulator.c
index 16d3a8f7f90..e425f3bf8b2 100644
--- a/drivers/power/regulator/axp_regulator.c
+++ b/drivers/power/regulator/axp_regulator.c
@@ -227,12 +227,12 @@ static const struct axp_regulator_plat axp318_regulators[] = {
 	{  "dldo4", 0x22, BIT(3), 0x37, 0x1f,  500, 3400, 100, NA },
 	{  "dldo5", 0x22, BIT(4), 0x38, 0x1f,  500, 3400, 100, NA },
 	{  "dldo6", 0x22, BIT(5), 0x39, 0x1f,  500, 3400, 100, NA },
-	{  "eldo1", 0x22, BIT(6), 0x3a, 0x1f,  500, 1500,  25, NA },
-	{  "eldo2", 0x22, BIT(7), 0x3b, 0x1f,  500, 1500,  25, NA },
-	{  "eldo3", 0x23, BIT(0), 0x3c, 0x1f,  500, 1500,  25, NA },
-	{  "eldo4", 0x23, BIT(1), 0x3d, 0x1f,  500, 1500,  25, NA },
-	{  "eldo5", 0x23, BIT(2), 0x3e, 0x1f,  500, 1500,  25, NA },
-	{  "eldo6", 0x23, BIT(3), 0x3f, 0x1f,  500, 1500,  25, NA },
+	{  "eldo1", 0x22, BIT(6), 0x3a, 0x3f,  500, 1500,  25, NA },
+	{  "eldo2", 0x22, BIT(7), 0x3b, 0x3f,  500, 1500,  25, NA },
+	{  "eldo3", 0x23, BIT(0), 0x3c, 0x3f,  500, 1500,  25, NA },
+	{  "eldo4", 0x23, BIT(1), 0x3d, 0x3f,  500, 1500,  25, NA },
+	{  "eldo5", 0x23, BIT(2), 0x3e, 0x3f,  500, 1500,  25, NA },
+	{  "eldo6", 0x23, BIT(3), 0x3f, 0x3f,  500, 1500,  25, NA },
 	{ "swout1", 0x11, BIT(3),   NA,   NA,   NA,   NA,  NA, NA },
 	{ "swout2", 0x11, BIT(4),   NA,   NA,   NA,   NA,  NA, NA },
 	{ }
-- 
2.53.0

