Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C48051A12A
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 17:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667728; cv=none; b=fCid9sBna6saUmutb8BcfLqVukh2ai+dBTsWesGEyl+IIjE+XcEULX21OyLJymdqtP742au8CK6B+tiQHW9o+2FjH7r6iJOukaTjqOFY/KhtG6Rx7sBnzV3wLBUtaCSGRNNobh9YcDx6Y88lu1f3IBpoDN9/jTlmTwSBaHVgQiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667728; c=relaxed/simple;
	bh=TBZYNnslEgmqiIFbP9mDmQG8f/Ol4S/uoq75IjbY8ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8RTeu5BQXwLBYe59QZiNpNJPyn4oC9fNKmwW6KmED1Y1zMGQirGyb55LfazZNjrCELi38dKN5ku4T/pD6TGV270miJrqn2hpV1wtEX8Tim8rrrPXLuJDkRrmA5mCkL6lnPjudgDS+PHyTTIzprLz0WIetMvcHKwzUyaPvks38M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak55fY4s; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak55fY4s"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccbd4773so446393fac.2
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 10:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667725; x=1790272525; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phbcC86CmmKUH9rw46P9WlcsDl/Y5d267n36zdxy5Pw=;
        b=Ak55fY4sUrgIxDoQ+56RQLRQusiQjRWabFCr8bLk7QLDzsl7TJmSP3rPBqHh23sxJi
         yExYVimEBdLfQyvc2hf5B/yNhKLSRWCPy4lrvtjk/vfOIUGq/Gk4qu2+5Ze4sbY19a/5
         s8SL5i/HQiKjyEtpSZtmo7l+qTzeIOv/jhLEHcqYhN7NmPQFY/4at7Vvx1vHjQG4TbGK
         1u2a3gSrJX9XSu9UpNAoikez3evh6Bao1CfvhkGgrZI/bVVUpcBXLVAjzw+AQ1wBTd/H
         l855F+pr8fIg5T62x/tNw14qSWGy2jyZ6pRkfQZnA7qCtrxXeVWBCUjo9ODfTeh8HUo9
         WfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667725; x=1790272525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phbcC86CmmKUH9rw46P9WlcsDl/Y5d267n36zdxy5Pw=;
        b=sNm/sxJiURCV1sTnyXxFnR/z84ASDDyqqr/bhMKErL5lcCDNCqiSq6SOvmaKXWviX6
         hcRlXvHCncK3YBjrnKIuucbDrMfpnapXw+douPEetJhs8tbkoiP0+rtcyEEAOMhPdZM0
         j48paLGn4qLPesZbDloM5E+oXn1+w+7ciryHdoE7PI3YLvR28A/Lay9b9uiKfwFz7fzN
         eATACDyfFbig7kkdZD76KfturAXOmMW2zrfwcF3+6eS5T6hiU/ETvY9JUH/0QqmKRFso
         Y2fbIaI5g1j9mXU+B2H1t/Y2KyGrh3MvyCFBB7inDDBDNL7NnvPITxEtGfMjCIEGI5il
         WYpg==
X-Forwarded-Encrypted: i=1; AKwUvBw49wfw5ylwlzqQU4gxsBrtiDN4uBszvZMlsbF4hQkmguepjr9/nM6JP1lGeFDCKqBIM29V0VIyUPXLOA==@lists.linux.dev
X-Gm-Message-State: AFuF++lXNkdJb1DbVZncOqM92c6BAz/DbPL4IwnmrndDDRGyyofCmSpw
	FvB7PZSNaBfhXavV61StdBzJi1HvR2iaSID1p1IZtCupndAzTY4WsZd8
X-Gm-Gg: AYBFou0pSADE5DAfnvThvD971XoDO1xtiEjbkaOemlUyKqVez1qiDbNxOMw12uqYjnz
	JKpnKZOwOgcaQpT+CzIZAMlA+h/AdhkyATc1qg5wRYcZzcYem+LcHrwg86m9vGZc3lh441Ukqvb
	OzJbk+AVH0vxF5GpilnX2986gAG/HI/IsQj1xOygSPuotcU7gqjbqdxqIpJ40J1zhcLOes9Af/t
	5SGv2vd2tGeU/lxENPL5WQ+IawHhVs6R7ypNDKztxtdHIN0YNdDgLRn07Pfpp0hSH7z1EEnP+Xi
	hRqA6u/fPbR6bGXV5nrD1BT0xhc9Q9qZuZYsx859L1Ub+Z/Ngp8y0kpr4QDMr6m2cZD24LeNYHG
	ov26BSfFyVqcwK3CJkEnVs908KdZObqcKqY10gHgOYm1EaLGwmM5XLEECv7XNTENg9V9CHIfkWg
	6Ry/YofSJvcqEFaIS2v6/vRK9CSB4a+xVEk2IflJqRJGfvCzewgIDmjgKRJAYR2Cb4R2vSQPDEh
	72RPz3x49OQUZOii9/CNq3IkxoFy91pbBQCuEcfhWFPdqsFXk/mmU8YdB/rLsoiLjn+AP/Rjzu6
	VpIweSc8WqsK5bAl4VW/1oWMbna/XTUxLp0jpxIhSNIunWKbxltA0I34tXPdPj1m12r1CePL6mU
	VJEmQCK2GxHbDcI4jsiAq
X-Received: by 2002:a05:6870:1696:b0:46a:c0ff:feab with SMTP id 586e51a60fabf-484752f7f6fmr6824911fac.6.1789667724804;
        Thu, 17 Sep 2026 10:55:24 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ab6c1f31sm578446fac.10.2026.09.17.10.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:55:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 17 Sep 2026 11:55:14 -0600
Subject: [PATCH net-next v3 3/3] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-submit-h616-emac1-v1-v3-3-62cb8316e19b@gmail.com>
References: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
In-Reply-To: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. It connects internally to the
co-packaged AC200 or AC300 EPHY and has no external PHY pins.

Add an EMAC1 variant using the dedicated register and enable only RMII.
Leave PHY initialization to the PHY driver instead of using the H3
internal-PHY controls. No RX or TX clock delays are configured for this
RMII-only variant.

Co-developed-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 4523a14f5e0c..1020168f1c3a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -81,6 +81,13 @@ static const struct reg_field sun8i_syscon_reg_field = {
 	.msb = 31,
 };
 
+/* EMAC1 clock register @ 0x34 in the "system control" address range */
+static const struct reg_field sun8i_syscon_reg_field_emac1 = {
+	.reg = 0x34,
+	.lsb = 0,
+	.msb = 31,
+};
+
 /* EMAC clock register @ 0x164 in the CCU address range */
 static const struct reg_field sun8i_ccu_reg_field = {
 	.reg = 0x164,
@@ -143,6 +150,13 @@ static const struct emac_variant emac_variant_h6 = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_h616_emac1 = {
+	.syscon_field = &sun8i_syscon_reg_field_emac1,
+	/* The co-packaged AC200/AC300 PHY does not use the H3 PHY controls. */
+	.soc_has_internal_phy = false,
+	.support_rmii = true,
+};
+
 #define EMAC_BASIC_CTL0 0x00
 #define EMAC_BASIC_CTL1 0x04
 #define EMAC_INT_STA    0x08
@@ -1276,6 +1290,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
 		.data = &emac_variant_a64 },
 	{ .compatible = "allwinner,sun50i-h6-emac",
 		.data = &emac_variant_h6 },
+	{ .compatible = "allwinner,sun50i-h616-emac1",
+		.data = &emac_variant_h616_emac1 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_dwmac_match);

-- 
2.53.0

