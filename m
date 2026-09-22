Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B9C35203C
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 00:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790037935; cv=none; b=MypctD8Zqb7+ryBHQl7cSY73URyamII3FkzkYUL/HdTOzYCo9HjkWUEQSWl4eZ5cRD4NZyQy9XywnSQmW6mgsTyH75YKd6fl7rxJks8NuJn1skyknLKXnGTYHHNik7O1WS1wwDHSBGT4XsRydw8ufdy5GOHiDsqcwOp1iFDeZ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790037935; c=relaxed/simple;
	bh=e9hk5Tsdquyr+5avHPEA7bcfLf2nOdnHsiLzbvu4On4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=grD7W9BLcN5lF1YA4PAI8ZLDZoT7KvdA0pLMjcdYTGbZhsUbK0AOJjJS+8OmoYUC5X8G6yJQjS9iQNozEVGtUVGBK07mf2z4Nd2GeqMeR40s/VU1jr7dtTr8z0FSbTz/zKf49d3fwdOrI65gstxtHxsFMaKoDOESxLwKHAKvHro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rhIZS39D; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rhIZS39D"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c13f2685f2so1996591b6e.1
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 17:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790037931; x=1790642731; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFndLx5Yqc+lsDlrSDVoBXxkYOfQ85XX/QivbJQF5Mw=;
        b=rhIZS39Dt+44Iqhtxv/iYgdjTgCzftPzEHI5j58DvpkFhbqwG6AhaY5qfvOen2Dea3
         PEgRBCEIvcwBhz4uUKs3Y9IUCDDaujNMs0fYqFpQUzeTAMrNLai7P4zJ/sxNJhz2ByU4
         dZ8e35OzQFZQq00Z2RqgZUQoHq76WxcjrJMCYUrweGZrxFe6wE0C/loxe8w7IQpJUsoM
         2dAzZGAVt0Y/ZwQtTuSaTj6RqTY4q0vOv8J12OxBsTElj1YY+crWW54oSdUaedvzs8S9
         N2E8WhBFXwaLZHrCW0DvBMKFDJtzQXTuuAL/JVv1nKGJgzZedvjIk3RHedOHafiKu7pN
         ZHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790037931; x=1790642731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFndLx5Yqc+lsDlrSDVoBXxkYOfQ85XX/QivbJQF5Mw=;
        b=T5POkv1ln5TfX+vFl2r8GLJWKTZ7b8h6hlSOJJmEuK9t/qgBYdc0efGGh+tLk3ge4v
         dtUgblzAmeCfLv7XMF930Ynu8hf90cUjMKdMepEXdsfev1K939ApxoCOFBnYNGcg3rqG
         aYBLsEn2XaJouR2gPeC2W9sOOzGu6dKn1wdwCjkDliAaI2WZ9+pTN82tQs8JCFppJq5b
         gZ8Oo15H19lpOz9E1KqiIG8wSw6AVLWn3IdzZ0h0lkBVw1mKs6eKtqOkaYGlO6R3HIbn
         YTPR3Z1XFQkql/e9uXeXUEsB0L6c/GxPZSyIqs6a3Plm09zrV1CfmyclalnuOkRonX2w
         VL8g==
X-Forwarded-Encrypted: i=1; AKwUvBzkP2UHoirOT6swlQxEjSc99bdPazEypSMrqsfRX4HdBE3CJn0I6PKEQJWm43h3v9pMnn2h+p9OMU8C8Q==@lists.linux.dev
X-Gm-Message-State: AFuF++mH8BD85uwPQ/hGuyUjIulubmCgw9YuJ9L+Y4QEA5lMpZo5BPNw
	iwTznRkxvgdB4aA0Gph118N98GjRs9bVQ312HRCVNpRsuFZr7nBY4aeL2Y1XdHtG
X-Gm-Gg: AYBFou0N8QwjvIcmEvBr7m8h1R45m5whs+bGkAQ4zx3lrlnrxhvEJcra/pGSx0cw8Mp
	zIzOrij5Lh6TPRYgYE6LM0SPCElSbHGk+yCbNmo+VUQ3WFw4vEbsEPIu3GMzhsV9ncjrdVTwwNJ
	5GJUzVBuc8VDB9PwiQ9rS/Z79BHdz+xCP51BAWQLT/sqb2l5Adr0u0SDvrAGShsAMJ1EhYjJPps
	GXmAWvjMyHaOa7elxMuP97nP8wPT8CqWf0lY9KuFAkxLjkiwKZsRyBrAPdDdxLuZg62pjFDWEX1
	LL1iKA1L8en02M1b9RhOL2/7yyK5OHQDbOPCRm0vcFKsfkMkjC38qAseZ4mg1GOxOKTXZEv4Czj
	e4mwdL1b7sieBPKrOm1k9BA9vgITPpDQ3iVTXZysB4GlpznkhUGvA9bSY58x8FGAtIkSmUfw4Dy
	Hdx3m+LYG9xdXsb+TmVU5yQgce5D9FSjathJc/Q+ybbZfTrqR08Sc3ZGwJgRzh28b7n/kf987cC
	AA0buNefSYoy0R2lluXrUPyo6HCOBzuweWaylwJzuRURbIagdivRHEe0YjjjygX40FpJRZr0UOF
	U8Ddo+CazUCmd5yygHxZV4VSVjz6R83zvpnsNNdgAkyedbUQKEDWDSMmbLlrTNsCVXSG34ls8Y1
	JHyTBd3/vOicU2rJNt1nF2xnnu0/4Nhjg
X-Received: by 2002:a05:6808:1701:b0:4b9:a8ac:487 with SMTP id 5614622812f47-4ccf91570e3mr11567524b6e.37.1790037931601;
        Mon, 21 Sep 2026 17:45:31 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d4bb6be7b3sm60201b6e.0.2026.09.21.17.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:45:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 18:45:26 -0600
Subject: [PATCH net-next v5 3/3] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-submit-h616-emac1-v1-v5-3-ada661ed9e9b@gmail.com>
References: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
In-Reply-To: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: Alastair D'Silva <alastair@d-silva.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
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
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 9598c386bb21..0ea1860cf203 100644
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
@@ -1277,6 +1291,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
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

