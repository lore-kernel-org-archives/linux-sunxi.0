Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028081;
	b=zeeUwNgUZ+fFetau51nrLvoz/a9Wy9BRsB317M/mxN/m2UxS0eqthxU1jZNMDz/O2Aaq
	 1VRzw+0CcZG7LAbLfHypLO6+McVzfDOkaJaT0iahCi9KqpBu30xVWizV6ou8ZfdZzHmXB
	 wkrMpdg5a8LvpjBEpe9qGrOoAKRwX+LHJ5qGoDyCREE5VxYpR+HtPNi7aRdhZgP3VYewo
	 qR91ckU+eser6RiVvnBwXMgkzduysNkGPdoPWRp7uxc2r0VB7cLZrcB7IKZLVVts9J2Dk
	 thwLGcuZZFPOgFPTvKH5EsthPhUTkEo6Spo7sfj/b460oYnIGKcS+OYwKhyBWKHpe4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028081;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=NgUZou+QAUenodbqqsNTHG+MAZHRcJXPTQZv1JbHVys=;
	b=J/4Of8IWVoL7c/PdxpKF22RoOJ9QMcO7cjiXegRn0+DDnt+6hvZU4Tm6JSgja0vm0f0j
	 V+76dCNnUfLj/fKHNnj+biVLKUr4j80ACAXyNutUL+PcfWdPf90/0CuU2FKJX7D3qPMi6
	 o+RGCkGQlXgzDM3o+Kffh+4YtWpiq+GIHmTCEBLtHUdBU/4zgQD3tcH9W+h1UG/j4wsSN
	 QO4+lCzCjK5oSUBBe5ig78n/WCREHrAvrZT5qhnMOVxaXWxCdeatzlDU7tcrmheziGM4P
	 JNElUlPagrjKCyW8SxXqh2307omPtapHxmd9Sw5ceDobj7hNfauzhK0L/qc0Pyq+W4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Zdp1usVO;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22AC606A31A
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 15:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22AC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Zdp1usVO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ng
	UZou+QAUenodbqqsNTHG+MAZHRcJXPTQZv1JbHVys=; b=Zdp1usVO+wA1HyRZky
	ELohWUrb/FJ+Wz0rd8BNcMAJLR2AJTCopWLgYZjKLUQrhK2qtFJIp8OBGc82TKSJ
	XJDf45LKpo/wjE6WreuMLkMg14/R/8xSMf45Cc6Vrixj9BJddKRvmlWXk86cUPr7
	iHtijdSLB3Vlf6BkvdfoVPlxU=
Received: from SYPC (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDXXx3Ub99q1qL2Cw--.8607S2;
	Mon, 26 Oct 2026 23:20:52 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: sunxi: request the per-bank supply optionally
Date: Mon, 26 Oct 2026 23:20:27 +0800
Message-ID: <20261026152027.1417178-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026144751.1392715-1-hsyysy@163.com>
References: <20261026144751.1392715-1-hsyysy@163.com>
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
X-CM-TRANSID:_____wDXXx3Ub99q1qL2Cw--.8607S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFW7AF43XF4fAr4UAFyftFb_yoW5Xr4kpr
	sxXr1akr4kAFyfKw47uw1xtr1fuan7Ja43CFy0g34rXFs8AFs3Xw1akF4YkFWkGr4kXr4Y
	yryDZFyxGF45Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UH7K3UUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7RWj12rfb9XufgAA3T

The per-bank "vcc-pX" supplies are optional in the device tree: the
binding documents them, but notes that many boards do not describe them.
sunxi_pmx_request() uses regulator_get() anyway, so the regulator core
falls back to a dummy regulator and warns for every bank that has no
supply:

  sun50i-h616-r-pinctrl 7022000.pinctrl: supply vcc-pl not found, using
  dummy regulator

The H616 R_PIO is such a controller, and its PL0/PL1 pins drive the
R_I2C bus, so every H616 board hits the warning during boot.

Use regulator_get_optional() instead.  A bank supply that is described
in the device tree is still acquired and enabled, as it powers the
physical VCC-Px rail, but one that is absent is skipped without a
warning.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---

Changes in v2:
- Do not skip the supply on controllers without IO bias configuration:
  the per-bank regulator also powers the physical VCC-Px rail, so a
  supply described in the device tree must still be requested and
  enabled.  Use regulator_get_optional() so only banks that have no
  supply are skipped, which silences the warning without changing the
  power management behaviour.
- Link to v1: https://lore.kernel.org/linux-gpio/20261026144751.1392715-1-hsyysy@163.com/
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 70099052d..23c1fbd46 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -925,11 +925,19 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 	}
 
 	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
-	reg = regulator_get(pctl->dev, supply);
-	if (IS_ERR(reg))
+	reg = regulator_get_optional(pctl->dev, supply);
+	if (IS_ERR(reg)) {
+		/*
+		 * The per-bank supply is optional: boards that do not
+		 * describe it simply have no regulator to manage.
+		 */
+		if (PTR_ERR(reg) == -ENODEV)
+			return 0;
+
 		return dev_err_probe(pctl->dev, PTR_ERR(reg),
 				     "Couldn't get bank P%c regulator\n",
 				     'A' + bank);
+	}
 
 	ret = regulator_enable(reg);
 	if (ret) {
@@ -959,6 +967,10 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctldev, unsigned offset)
 					    PINS_PER_BANK;
 	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
 
+	/* The per-bank supply is optional, so this bank may not have one. */
+	if (!s_reg->regulator)
+		return 0;
+
 	if (!refcount_dec_and_test(&s_reg->refcount))
 		return 0;
 
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.0

