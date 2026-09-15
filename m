Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079C04CDA3A
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 19:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499021; cv=none; b=u6zpNNiEF2yX0LM09mVS6nv5+EBISXTiRoSPaVzV0OuS/dPUGVAzINaHDGkodToESTnDs1a8NUgPa82qmOSovNnmCY6e73H+a1nP6fQY+fBWn8CwoICOMwQ2ejAJjGrBtsFkM5fw/2eJUIjyqT0GbZFlePeno1oaBFX5GIZa+zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499021; c=relaxed/simple;
	bh=8Fq4P+2Ju4lSwhzSxj9aVcUt1KO3M3r6gAx7Y5yu310=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fO4ODJYJAXystJ5fTqrTDS7JhT08ifLw4BQiL/wiWlswrO8NF1gpudkokiLGg2EG9NmoFoXWPDF5Nmc/195XCoXfuYo0vY114BcIFsNyv8s5gp1ZySiUNaW+bNn4/rVOcMKN866o2lZ3v9DVlPaBTzria2JlLU3NURBapH49Qao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2QWpX6V; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2QWpX6V"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37dcfe9b2so89375b6e.2
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789499019; x=1790103819; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XXNu+ljv2q2jdXLpwbKTjv8fXsZBsxA93MzoFmASwE=;
        b=H2QWpX6VS43rTCEXXELUY5llZ1lq8KxZUc9vp7BvNA91MgU8YIG/xT1ZyMz5wrqoCo
         9jhuBM1oi6HtyDYmnz++id3ZBqH1ekqZBrDQ0FQM9MJqNOWaSdFKtqCNJACicKJcRkC6
         w2OC2BYYGf63+PPl+V+jpSf+QQ+76moUXLA5JrtzX4BjQ4xMN+Mp1nYtpw2HZpkq+s5a
         qhlAsW2QsXAsbEPpPARaK7SbNSYKxLkJPJaDpvWLLwQsr4UYk1Hm0qWzQe9XIElOamvS
         SfeT9/iUWqEWKe80Y6+/UREI6Y8+dqPEJGA8wzWFy/GCarUvbryY0VQiaUbjWI9T45Gu
         yxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499019; x=1790103819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XXNu+ljv2q2jdXLpwbKTjv8fXsZBsxA93MzoFmASwE=;
        b=yYxCGq+lS275uGapl89/NKLce4soKeJo30aYHudfHfR9t0GvRFhMn6O2uiGrob00rf
         Bt+QxJIayBsrgeDG0tis4IAsXIptgDhgZwu4T1KHIPBtPgS706lN9Zs3o7O1VcCzu8RZ
         rQKW8j9OCLQ3Eq/JEJpY0YSpuO1gZVVUnRRUm1nZYFBdRIJp3c4gTrN1EY024D8qf/4A
         nwXtC40dVqOzGAGfuy+KQ1l6E87VsnTjOPwAf+hL4XWwXls4PwecOFKCLTYbtN2QFQtA
         fNfN8Iyy35UH/L3I25naQHjlxBvUWFnUKPDyWTMC63JAxqF/SbUo2Uq0AqWVtwgKiMBI
         eKnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzELAbX9cRYBLL3N7vTpvVWpozPqvnZKa4ta1MsxiZlXX6WhdVA54oKPwW+MpMxQBb0H8hGBgi4Z7H2qA==@lists.linux.dev
X-Gm-Message-State: AFuF++muQbLl9S+cHRmLM0fFoJR1zxtZjxQsSKB9ZngSFEhrEZzGZss2
	9FX1wQtWGhTzHlnCXX+Y3129wBRZnimTXSdmaiQSubC16IbriwdXHjAG
X-Gm-Gg: AYBFou1BYJ/iKIRRWDf/2ie9KoO5ag/ko6ICjbPtxv1co0YaJMuQ1wT/ReES6rh8BU8
	/ffwUsLwVQ19UQjlRij72lUiGmPlFZoabG3sZaOkfQn/iJBl5ECitXUOfR97OWUnLPUH+1VCd3f
	nfHAwVA8nw6BlEdhdvRNoXV03fRWBPRrU+R6I3azqTvgk1BP/CW9Aq+0I+3ST6tXil9FJPVG4FE
	SSNSpn1SJYC6VsKl2Gp7IGoviA+8zUSjMa3vtRpBR45o+YPe5KDgs3ouvUstdwWQ8nUJvZwUU1K
	KV1cbvomTH/2kgOJR+wq7lNuKHmvi5aIJ6BWNGuhaJO0xjgwRmB3caqU4BWLVPjlnaEtGdrNMtD
	8wm8DuNS6alXFcR6tdwroiQwnjDW/gs++gooc6ugM63pQQ3ekn5mmeZHyXfIX8ksulyjYmdA40M
	iF3TyVWscCbHCQ17wjKTHmANAOwLKN2yeV64yeZaudcJ/d3QxEGVTYtME29/JyuDZJMGu3LS3fq
	zAxH0q5EGRpCQ/8bxWleCx0QWnUEOt7B99haQz4BeWEJ2uNu+XtSmm8mt/16wPiGVFaP1A4MZYD
	tql2GzShKH91RHnPesNYQKNans3c94H8XbuhNvvbZvsOJIdD2rZsrD0yWQTxu+oU5W7JoJZ/+qR
	RJBKpC0fottnX77ZWxjXImQ==
X-Received: by 2002:a05:6820:169e:b0:6aa:cce3:ab61 with SMTP id 006d021491bc7-6c53f555385mr8191833eaf.9.1789499018615;
        Tue, 15 Sep 2026 12:03:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842546a51bsm836569fac.0.2026.09.15.12.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 13:03:19 -0600
Subject: [PATCH net-next 2/2] net: stmmac: sun8i: add support for Allwinner
 H616 EMAC1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-submit-h616-emac1-v1-v1-2-195de0bb1f8a@gmail.com>
References: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
In-Reply-To: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Its EPHY is provided by a
companion AC200 or AC300 package rather than an internal PHY block.

Add an EMAC1 variant using the dedicated register and mark the PHY as
external. The register retains the standard five-bit RX and three-bit TX
clock delay chains, so expose their supported ranges to the shared
syscon setup.

Co-developed-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..fdc0c3384af8 100644
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
@@ -143,6 +150,18 @@ static const struct emac_variant emac_variant_h6 = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_h616_emac1 = {
+	.syscon_field = &sun8i_syscon_reg_field_emac1,
+	/*
+	 * The "internal PHY" is in a companion AC200 or AC300 package,
+	 * rather than on the H616 die.
+	 */
+	.soc_has_internal_phy = false,
+	.support_rmii = true,
+	.rx_delay_max = 31,
+	.tx_delay_max = 7,
+};
+
 #define EMAC_BASIC_CTL0 0x00
 #define EMAC_BASIC_CTL1 0x04
 #define EMAC_INT_STA    0x08
@@ -1278,6 +1297,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
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

