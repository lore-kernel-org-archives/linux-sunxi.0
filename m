Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793033906;
	b=j/uAao0kj5P+f3bF/fwuOmApvGvBdO/CDJtXxF7+5v5gMGjhNrml2hgg/p7koV4YRnhW
	 AamymBPinAV+5nNYzt7sg8seJMsyTgdbqlpoKfMeMW6PMJ9UWBkgJ4SGS/mjt9Kg1C7GI
	 mBaz1QAWC2EFQGgHIjqm5a+d9EKD6QdDHNbC0MuPcjhD4tWYe2i1IYS/ZILAhgns8bSbm
	 wL8XmPq6X59JE5k2BE3//HgB8aiCVDj2YpkfF0AobhqgHY3jJa4nzCaSTchNjnwG+uTjC
	 c48zhPl38+V5RIM4W8irJMMinJrOEkISkZ/x4hcw9BFcRFyJPptasN9l/qVhyckGxsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033906;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=yxHn6IyMEc/gFXG0FL2K57vaxjrPtjjGVPSWUg++9V4=;
	b=uFp6iqXa9yw0MVgzCw2/n+B9nCFZCuHx9yKHQTwBOCZ2zhE3ezrhOKzheENI1Mp9I6ct
	 tCS/T++GAdWPadLTluMrAV7Jmg9yRDOxIpEzKDTNkfffqoYG7Pj+biH9aHmV0K53Eer5n
	 ZnjFM2jSwpVJsaLhN5983WOnZUVyvBuI50qDRZGMZBuxNY4HedA6/c8Tps1aV9FZXqdyT
	 0GpbFGHKVm5d4PcEffCTiq5wDJqTxDv+zYTOKf44rOpBHnVHBPouMFkeygJ94PyhMc8DF
	 tKALP5trkFxxMzstAxc9rGr6jjk+ccx2dPzBfE/xqkFrWdz6EQ1orV8gSH96qQiV+SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=AllCAX8h;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA0D606A31A
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Oct 2026 16:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFA0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=AllCAX8h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=yx
	Hn6IyMEc/gFXG0FL2K57vaxjrPtjjGVPSWUg++9V4=; b=AllCAX8heHI5B0M6rm
	uaSDf4/DxlryL9aKMWSKG8xrdThIwsF0UzOUPYKhIEu1YCaVCbfQUg/R7Fx4GiZi
	zJfs2C8k0BgUyq8xI3c2XrEIOZHOHSy/8afrTgu1XvFxofxm+RE5zXWdOcCVKh6H
	Zb93DHSNEyOlUZ1u3TouaW65g=
Received: from SYPC (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXWG+fht9qNCbrCA--.16615S2;
	Tue, 27 Oct 2026 00:58:08 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] pinctrl: sunxi: request the per-bank supply optionally
Date: Tue, 27 Oct 2026 00:57:42 +0800
Message-ID: <20261026165742.1478383-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026152027.1417178-1-hsyysy@163.com>
References: <20261026152027.1417178-1-hsyysy@163.com>
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
X-CM-TRANSID:PygvCgBXWG+fht9qNCbrCA--.16615S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFW7AF4rCr1UtrW5trW7CFg_yoWrtF1xpr
	4fXryayr4rJFyxJw4xAw12yryS9a1xJa43CFykK345AFn8GFy3Jw1jkF4YkFs8Cr4kJr4Y
	vFyDZ34xGFn8X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07ULo7_UUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7QBckGrfhqBnzgAA3b

The per-bank "vcc-pX" supplies are optional in the device tree: the
binding documents them, but notes that many boards do not describe them.
sunxi_pmx_request() uses regulator_get() anyway, so the regulator core
falls back to a dummy regulator and warns for every bank that has no
supply:

  sun50i-h616-r-pinctrl 7022000.pinctrl: supply vcc-pl not found, using
  dummy regulator

The H616 R_PIO is such a controller, and its PL0/PL1 pins drive the
R_I2C bus, so every H616 board hits the warning during boot.

Use of_regulator_get_optional() instead.  A bank supply that is described
in the device tree is still acquired and enabled, as it powers the
physical VCC-Px rail, but one that is absent is skipped without a
warning.

The OF-only lookup matters here: regulator_get_optional() also falls back
to a global regulator-name lookup.  If a regulator with the same name as
an absent bank supply is registered later, a subsequent pin request in
that bank could acquire it and start the per-bank refcount at one, after
earlier pins in the bank had already been requested without a regulator.
Freeing any of those pins would then disable the supply while other pins
in the bank are still active.  Restricting the lookup to the pinctrl node
makes an absent supply permanent; record that state so later pin requests
do not retry the lookup.  The refcount therefore stays balanced.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---

Changes in v3:
- Use of_regulator_get_optional() instead of regulator_get_optional().
  The latter still performs a global regulator-name lookup, which can
  bind an unrelated regulator that appears after some pins were already
  requested and unbalance the per-bank refcount.
- Remember that a bank has no supply so later pin requests skip the
  lookup, and keep the existing no-regulator check in sunxi_pmx_free().
- Link to v2: https://lore.kernel.org/linux-gpio/20261026152027.1417178-1-hsyysy@163.com/
- Link to v1: https://lore.kernel.org/linux-gpio/20261026144751.1392715-1-hsyysy@163.com/
---
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 29 +++++++++++++++++++++++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 70099052d..d2345a85a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -913,23 +913,44 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 					    PINS_PER_BANK;
 	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
 	struct regulator *reg = s_reg->regulator;
+	struct device_node *np = dev_of_node(pctl->dev);
 	char supply[16];
 	int ret;
 
 	if (WARN_ON_ONCE(bank_offset >= ARRAY_SIZE(pctl->regulators)))
 		return -EINVAL;
 
+	if (s_reg->supply_absent)
+		return 0;
+
 	if (reg) {
 		refcount_inc(&s_reg->refcount);
 		return 0;
 	}
 
+	if (!np) {
+		s_reg->supply_absent = true;
+		return 0;
+	}
+
 	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
-	reg = regulator_get(pctl->dev, supply);
-	if (IS_ERR(reg))
+	/*
+	 * Use the OF-only lookup: regulator_get_optional() would also match
+	 * a same-named regulator from another device.  Such a regulator can
+	 * appear after some pins in this bank have already been requested,
+	 * which would unbalance the per-bank refcount.
+	 */
+	reg = of_regulator_get_optional(pctl->dev, np, supply);
+	if (IS_ERR(reg)) {
+		if (PTR_ERR(reg) == -ENODEV) {
+			s_reg->supply_absent = true;
+			return 0;
+		}
+
 		return dev_err_probe(pctl->dev, PTR_ERR(reg),
 				     "Couldn't get bank P%c regulator\n",
 				     'A' + bank);
+	}
 
 	ret = regulator_enable(reg);
 	if (ret) {
@@ -959,6 +980,10 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctldev, unsigned offset)
 					    PINS_PER_BANK;
 	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
 
+	/* The per-bank supply is optional, so this bank may not have one. */
+	if (!s_reg->regulator)
+		return 0;
+
 	if (!refcount_dec_and_test(&s_reg->refcount))
 		return 0;
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 8bd00c6ff..651249b23 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -162,6 +162,7 @@ struct sunxi_pinctrl_group {
 struct sunxi_pinctrl_regulator {
 	struct regulator	*regulator;
 	refcount_t		refcount;
+	bool			supply_absent;
 };
 
 struct sunxi_pinctrl {
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.0

