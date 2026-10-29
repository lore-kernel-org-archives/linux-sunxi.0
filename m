Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294641;
	b=A8ecsWN2R/jch9Jx9aewoHMOwDAi9FZvrtEaPehOVlIo3m148jR9LKYrDb7r9bpGrnqU
	 d0fVjkLyXSykxJTpELcPLpNvXKX59aUhO6nJXrAkn7KE9pWB4+Nt1kyO/tULhiGtbq5fG
	 3BpZsDB7DHKIzSzrTYf72d8LjTJRDfNEWGccAImTXvmYo7aER1M7ibcbXvY/7ycq/baLo
	 8Krblv+aW+AYkleoN1fTrln6vQzv+6neMtalkj9/260ZcjhnTKqSyKYDfL9Yrr0rWxkAM
	 mUc8W7BSEwXEAZ/Y2mSnRXSw0ndmkxAr14KJOxLGKWRAW+h2OEZlQeNvfEXzi7DH8fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vlmh38oDhVKFUzUtt9cRV3aHc0FM1WeWFLP0ZtSzi/k=;
	b=Df7v3tCz6sGS14hMtxaM0dUOeJt0kx7MOPEl1pa9/qdcArRg5TB6hyupkqdwmSKZz722
	 HfcsgNEcZhPbMODpwfA6Sw++JOBQ5Nr67CIijE2PtqvypRrzoYXyptcPK0cwqh1k4MbSE
	 qAKW1re1WKGAjx4k5CobocQKptX6WaL7KM9Zs+IH7KaZVI+MIJJN0EiIDe/BWPS0/QNdJ
	 5nOfiQYGf0VXVgFCdg3bbVhfi9XTx5W8e5Wk1cCVwPMWu/FOCh2jPHZ85ZvnOzLgCodFx
	 xllAWuSanSVFAeWezqyJVdutFjCjf176KnMzDGqSUWJTNXELSX1q6/wX0FONLOU1Wvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJsnoL+K;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4927F606A335
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 17:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4927F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJsnoL+K
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7cc81984fceso720246137.0
        for <linux-sunxi@lists.linux.dev>; Thu, 29 Oct 2026 10:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294640; x=1793899440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vlmh38oDhVKFUzUtt9cRV3aHc0FM1WeWFLP0ZtSzi/k=;
        b=pJsnoL+K3KUGELHy9sE2w2GtyuqTDVgEeUbw07iy9OI429WnzlmsNLLUB0PRZoVlw+
         tFnFFhmukEq88v1KVojO8mshIjy4IqDt9B1Q1ZIUIKk7l6Qh94THKRDBvNcKK9wPErUJ
         c2jjeGZ47y5y3bOY5x5s0Fwsw5vWBpDrH3O01Cr8db14dAHNPJznAKMFGsj3wtpcUjSw
         r2/qQRLPVVP/E+lGeFncYOn/cypbI2sVciEo93PQgVSfkwQ5rXEYSDx7B3dNaBBGL+VD
         3GuQw0D+ws4e8cAEy8KxccMdpXOaBgGzAV2IDLJ5KGETEN5n2PIoy1LBfpcY8NwOkXsg
         C93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294640; x=1793899440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vlmh38oDhVKFUzUtt9cRV3aHc0FM1WeWFLP0ZtSzi/k=;
        b=pEwK8j07sH12Ag9BHKQ2MpYfwf1K0y2p1hHcgI4aleqm93GH6Jwg2p4AQ5JiVjdUur
         3fHy6L/syM5tRHRpBMQboGsgnLFF5jlZDQW8kfINiWhAjEvYa9RJLpYvXicoG+cNCykh
         1OpvodH8zUO530lEUae5uYFPvo4zvDHorV925jY10jJMqHyH2+NHAsRdM6u4w1u4rH3U
         iWPCVon2fxbkzJhXsL5kJe1cP/S1yZ06j9MjUZAeO/6XKS6sCH/bkhhEMC0h3dhHDIWw
         E1NA39XeuPQmav/Q9sfwjDUGcnJKqonFJl/FaTfSJiVIy9fsmtYr7P19BiAxNVW1iw4Z
         d31A==
X-Forwarded-Encrypted: i=1; AKwUvBxvx3KWXkONnJdtKeRjamyPi85l+k0OpAKVJbT5besMAVEQSEo6TczwfeVTp8xNwkTnqW9LKjawVer60g==@lists.linux.dev
X-Gm-Message-State: AFq9FYK+cGiPFTsWsAk++Csx0lrmAzs4TBZQ5fHUr8oSanZwAftAteVN
	U0Ief5z5YstviWNVAWdM4eA7oOWlc2jsmNKqVWoJh0UUN5VIXCsHFehVgZEY5Ddsdsw=
X-Gm-Gg: AYBFou05Yj8pgusf8aL+BY/mzWs7Zg8PTtWF14ARXfnrzw5kj2rkarXTSIw5tjuS/nx
	F0JyRPww4kt7x+0ZYkwaWi+LMfLm5Klc5KuSOdXzBhojmAemSOOmcdmSGGmlvGNEkjVjuFN18nX
	I1LXk4pcnTm0vxOLEo6z/2P8zeGQfN9PolnTeIwGqnnEa9qo+jHx/XRsUsexLi/hJ8a+7IMt3QD
	s95e83/83y9oVVZNSVKD1sbvRCxZBLZoheAWMYf9LIF47rnXWCn/RvRhkjp6HeAYxTJt9wdZC9a
	O1IZstSC/6vjiyxOhadgkM3VsoaJqPXTLLdQpY2HsRBGwnZCS5JAXYbudlI3DDyABhTrvF3qZI5
	17PiUxHpzsiULWUTPlIpuBNrfABmEQ3WG+G1OhKXS6K0YTkj1eZ2oBoRGTAYgIWxLk+PBebfFmv
	B/18hm+VG2SElwB2M8LWp+54ArXIEVY5ytzslf2eFQjHTqMe89sUfO/s87mb2z9tW9ePvMR8UXa
	SZM7RLCR9+IrlPYK271BlROolCtEWaEWTECLxDIM5tHMukIWeVV319kW4CtD4wL1eT87RUKGckY
	Rh4vIWVZdwLXTGxvXV25MG1tFmJkueeCsJ3xX05oveB7mUJKShlK+g2r3szR/LMelEaCzue2wYf
	mQkwMBNCKBMi1Yz7WuivRocDbTt9vI0coWLTN
X-Received: by 2002:a05:6102:3e8d:b0:7a5:7282:1994 with SMTP id ada2fe7eead31-7d03a50a85cmr2383203137.7.1793294640169;
        Thu, 29 Oct 2026 10:24:00 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d32a48sm9907357137.9.2026.10.29.10.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:23:59 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] phy: sun4i-usb: clear SIDDQ before the PHY reset on A733
Date: Thu, 29 Oct 2026 14:23:25 -0300
Message-ID: <20261029172325.3425046-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
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

sun4i_usb_phy_init() deasserts the PHY reset first and clears SIDDQ in
the PMU HCI_PHY_CTL register afterwards. The order comes from the H3
support and the reason for it isn't documented.

On a Cubie A7Z (A733), the Wi-Fi module on USB1 sometimes came up
at full speed on the OHCI companion and failed enumeration with -62.
This happened in 3 of 40 warm boots with a separate local PHY tuning
change applied.

With that tuning disabled, the current order failed once in 31 warm
boots. Clearing SIDDQ before releasing reset had no failures in 60
warm boots in the same interleaved run, or in 10 cold boots.
Why the order matters is not understood.

The vendor BSP clears SIDDQ while the PHY is still in reset, in its
common host path.

Add a config flag for the early clear and set it only for the A733,
whose config is otherwise the D1 one. The other SoCs keep the current
order: the manuals don't specify one and they weren't tested.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 35 +++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 839856c09e30..4d067d97c5a6 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -105,6 +105,7 @@ struct sun4i_usb_phy_cfg {
 	bool phy0_dual_route;
 	bool needs_phy2_siddq;
 	bool siddq_in_base;
+	bool siddq_before_reset;
 	bool poll_vbusen;
 	int missing_phys;
 };
@@ -253,6 +254,19 @@ static void sun4i_usb_phy_passby(struct sun4i_usb_phy *phy, int enable)
 	writel(reg_value, phy->pmu);
 }
 
+static void sun4i_usb_phy_clear_hci_phy_ctl(struct sun4i_usb_phy *phy)
+{
+	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
+	u32 val;
+
+	if (!phy->pmu || !data->cfg->hci_phy_ctl_clear)
+		return;
+
+	val = readl(phy->pmu + REG_HCI_PHY_CTL);
+	val &= ~data->cfg->hci_phy_ctl_clear;
+	writel(val, phy->pmu + REG_HCI_PHY_CTL);
+}
+
 static int sun4i_usb_phy_init(struct phy *_phy)
 {
 	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
@@ -270,6 +284,10 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		return ret;
 	}
 
+	/* Some SoCs want SIDDQ cleared while the PHY is still in reset. */
+	if (data->cfg->siddq_before_reset)
+		sun4i_usb_phy_clear_hci_phy_ctl(phy);
+
 	ret = reset_control_deassert(phy->reset);
 	if (ret) {
 		clk_disable_unprepare(phy->clk2);
@@ -321,11 +339,8 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		clk_disable_unprepare(phy2->clk2);
 	}
 
-	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {
-		val = readl(phy->pmu + REG_HCI_PHY_CTL);
-		val &= ~data->cfg->hci_phy_ctl_clear;
-		writel(val, phy->pmu + REG_HCI_PHY_CTL);
-	}
+	if (!data->cfg->siddq_before_reset)
+		sun4i_usb_phy_clear_hci_phy_ctl(phy);
 
 	if (data->cfg->siddq_in_base) {
 		if (phy->index == 0) {
@@ -1013,6 +1028,15 @@ static const struct sun4i_usb_phy_cfg sun50i_h616_cfg = {
 	.siddq_in_base = true,
 };
 
+static const struct sun4i_usb_phy_cfg sun60i_a733_cfg = {
+	.phyctl_offset = REG_PHYCTL_A33,
+	.dedicated_clocks = true,
+	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
+	.phy0_dual_route = true,
+	.siddq_in_base = true,
+	.siddq_before_reset = true,
+};
+
 static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-usb-phy", .data = &sun4i_a10_cfg },
 	{ .compatible = "allwinner,sun5i-a13-usb-phy", .data = &sun5i_a13_cfg },
@@ -1029,6 +1053,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	  .data = &sun50i_a64_cfg},
 	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
 	{ .compatible = "allwinner,sun50i-h616-usb-phy", .data = &sun50i_h616_cfg },
+	{ .compatible = "allwinner,sun60i-a733-usb-phy", .data = &sun60i_a733_cfg },
 	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",
 	  .data = &suniv_f1c100s_cfg },
 	{ },
-- 
2.43.0

