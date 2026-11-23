Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396558;
	b=zzhw9YXxoI9R4U0D0bSFgWiMa2OI7n4VXP7hQCvKnTJs9d7uFs2RgjlUmaSGUS07iJ/l
	 5limFnrxvvMVfG84t5CD1iwOIvGC/UgjOXfWP8KJw4PmSlLx8a+72da1ta0DTYert+arl
	 LVLuMjdmGE9Okezz3r7MjIwwBe/hKznwbmyGJj2j386u52tV+/O2zKuYvswgbwvy+hz8M
	 cLCZiSAMsW1Rxfdw8nrE5RfdmT/o98tgpzfrCSDagi9J2vDdK2aTiYb8bkvVwBRVyzFbK
	 Us0+aNnVp81mHtg+C6c7ITIoFj6Gc/BfxGqxBwX4qEbE8sBV+tjohDCNQJ363GzpgkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396558;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L3JJFYO6w2ZQqiiP370awpYu7GNPqlh/p6ErW/UAQm4=;
	b=WAbMmdiYCjX4vnVDpn8YItrXNVGKhkesYTZEo8J9lz8ognuzr7P6v5nrC4mIDxA0/SGz
	 a7R+cbwXWLiSh8UjcANejTBIqAUBgVH9yYuSqtLYu/a3maEg1/JW9SMOL7b7Sa3OIEiTg
	 DhmgVHk7nMWSl0xu7eIVHKMEMMNUlOI7xtAhteawrr8YKO1JuZcG8hpPEO295sqPxOY42
	 flr+5xEJlFnGkcCYmb15r/6cTIvl74qkUIRLL/JrlaB39cetfd1SLNo5FtZ3Gq/grEAd/
	 OeumYhbg+Q2pNs/eWX9oSbGzqDSjR/9l3+Ks7Yh7P3kEdBCx4i4o3mvxibLrB+0k+JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=qFgtZfrQ;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FDD606A31A
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 01:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1FDD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=qFgtZfrQ
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 027D142720;
	Mon, 23 Nov 2026 12:15:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795396547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L3JJFYO6w2ZQqiiP370awpYu7GNPqlh/p6ErW/UAQm4=;
	b=qFgtZfrQEb1Ne2K/Mc/TmtD7/flSu0Hi/KuxBp2Dp3DccC9Zxj3wDqtAimR3A3t3+QRTUQ
	S98b2w/Gzq+oOe55R6UIk6tF16dR/iY1up9B26wIUIK6blhVw5dReOl9J8JwG43rsvEqGu
	/4cP6C8zf0SxqybiwqczO2nxiGmdPkYA4ifwAfB4EMeXCE74ZEWjRQmwvyQUDp6xAgbZV5
	pMVoAyP242HNT1/a82mVSwYWoxqA5Sog40g49Bv/gen5tQviFn0t6OUIBgNIr6us6xUqVv
	cZnB/BxW1zsNaFzDKnLoeW9qjGRceQX7OZ/egZN/xDi7uwdrkf3Vh3S3X/dsTA==
X-GPT-Reason: legitimate personal/professional communication.
	The email content is a technical patch description for a Linux
	kernel driver (PMIC power management) which perfectly aligns with
	the sender's identity (Alastair D'Silva) and the intended mailbox
	(alastair@d-silva.org). No phishing markers, urgency, or marketing
	elements are present, and the technical detail regarding register
	addresses (0x55, 0x32) and signed-off-by lines confirms a standard
	developer workflow.
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
Subject: [PATCH 2/3] power: pmic: axp: Fix AXP318W sysreset shutdown register
Date: Mon, 23 Nov 2026 12:15:33 +1100
Message-ID: <20261123011534.1692975-3-alastair@d-silva.org>
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

AXP318W places the poweroff bit (BIT(7)) in register 0x55 instead of 0x32.
Register 0x32 controls CLDO4 voltage on AXP318W.
Powering off via sysreset currently corrupts CLDO4 instead of
shutting down.

Define AXP318_SHUTDOWN (0x55) in axp_pmic.h.
Select it in axp_sysreset_request() when the PMIC ID is AXP318_ID.

Fixes: 71f07932756f ("power: regulator: add AXP318W support")
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/power/pmic/axp.c | 4 +++-
 include/axp_pmic.h       | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/power/pmic/axp.c b/drivers/power/pmic/axp.c
index 7d8348b0769..c24165ef67e 100644
--- a/drivers/power/pmic/axp.c
+++ b/drivers/power/pmic/axp.c
@@ -10,12 +10,14 @@
 #if CONFIG_IS_ENABLED(SYSRESET)
 static int axp_sysreset_request(struct udevice *dev, enum sysreset_t type)
 {
+	ulong id = dev_get_driver_data(dev->parent);
+	u8 reg = (id == AXP318_ID) ? AXP318_SHUTDOWN : AXP152_SHUTDOWN;
 	int ret;
 
 	if (type != SYSRESET_POWER_OFF)
 		return -EPROTONOSUPPORT;
 
-	ret = pmic_clrsetbits(dev->parent, AXP152_SHUTDOWN, 0, AXP152_POWEROFF);
+	ret = pmic_clrsetbits(dev->parent, reg, 0, AXP152_POWEROFF);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/axp_pmic.h b/include/axp_pmic.h
index 2f547da74c2..5df0e269b9d 100644
--- a/include/axp_pmic.h
+++ b/include/axp_pmic.h
@@ -26,6 +26,8 @@
 #define AXP_PMIC_SEC_DEVICE_ADDR	0x745
 #define AXP_PMIC_SEC_RUNTIME_ADDR	0x3a
 
+#define AXP318_SHUTDOWN			0x55
+
 enum {
 	AXP152_ID,
 	AXP202_ID,
-- 
2.53.0

