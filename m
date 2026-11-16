Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826578;
	b=hUP4ww826kwjI1eJzV/I3lnHZ32dMV6/SYzKMnv/MdPjR94Wp4zkeypcRAlCyA7hGTZw
	 ZVwlVfvqc3sXYz7+AEhOyzgKpxZcBKTWBxN4rlc3GZ0FLsPH8kHFUnuhMx9s+fhx1uSRw
	 SufPdrKE2mVRqHRIkvo7Vb7PTnnvqyqHT8gZx1C6E42C4jIN23Na/kH4aDcrpVZ2Z31JL
	 MLm0BgXRxDjies/PmJKxWIRd8cCKZGlBl0vAjWzp24kWDTr/TdNUItU0BRNnfGamn0+Zx
	 HY56NM26+P1BS89HqX+ronSEhj09cJW17cyR1mImFE3zHLMDp0fPlSCZmNuAehraFwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mXHs4M+7tfkoIg4sYbiMPquQrDZ3R0cBJAsjaurMG7I=;
	b=en/H87wShEmHaGm0vtjoiIWJmm7Wwi4NkNiNPm710Ecpp72Dsjmm3ybevB8Yt2FXKbIM
	 F7ALAVQ2cyEiRUkHwAJ5tKWcNZypkMGYCP17oJ456WYQF6eFwntZXymkGFhoT9SF4PCuO
	 HxRiuJfPGZy8FAFfLYo7JcQR/iqSnn0GgebRtTpT6PQ/5NxiMx8CdgNXtsC12n+IJ1xKa
	 fwtcNMU8Sb4LRkOCS8qNF3GL9Q5EJ+07dqXx6nh98/mq1GGtqx4Hh/Ek9H3GQpZcrTCpR
	 kCrwgoR4uID6xZT2ra87n8WozZEeqvOmDXBKj0noDLrm+vaZY7MW1zKopLLX56LJ7WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OzglBkNs;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AFE606A329
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 10:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31AFE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OzglBkNs
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b4d543b6b6so3874707b3.3
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 02:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826577; x=1795431377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXHs4M+7tfkoIg4sYbiMPquQrDZ3R0cBJAsjaurMG7I=;
        b=OzglBkNs2geMRctFYRD4GcN6pl9itztevwhvJ2969jCq6h9gAaP76mmj0pbns8370O
         LE81zNEo5VtEaUz+6PGVGbmmnsEHnjniz2sudOH7CxVstU62rhIW+PrOaDws/nJc09qv
         zVFMjD95q2Lb7Vj2x/uXT2Of6xKflnHKBeuQFfUjxY2MLl4C41AC+i6uYSXCAm4iG/FC
         bHGO36rEBM56wqDwiHoZLlG+C8jvhJDNnR1KSEMEhV4tleeKx0CRWS65qoFhVQRG8TDp
         PX7y7XPp3kO0rceirNMqKNrylmyYwn+Fp3fM/xWNbAsBmsXjG9Gx4GMwbX1RQItUyz9u
         Sxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826577; x=1795431377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXHs4M+7tfkoIg4sYbiMPquQrDZ3R0cBJAsjaurMG7I=;
        b=ljVwrCzUOMkXXHw9SyTbzDB7sQV8zUM+VOmESHsGK2l+1gDmiGb5SRL/Y0ImqV3VxB
         7Cw1t2kbfBZq1niojm7FYqcd5Oh8PrHNORYHzySrmhCjHnks/UYYDHLU5YXrCpm/muWE
         Sm4x4YHr2KLAJ/5QMQwNEDXghCRTX0g+WoEfLL3wtoAl9FBNYybEuoaOJzL8ER+dvdhh
         5HNnhPh0iqY+7L1uLFQaM1Bpa6CyDXYJW36EyuQeqKiqoXX+j0mxaxEKV2SKKWSV3zYa
         ilGmKku8EYIZDFZGxEGfU+WPPxSTEaC1ANYR98pp1pljEY5hWsgi5238DJB2Dew55sHN
         tQRg==
X-Forwarded-Encrypted: i=1; AL+hErHXQdMCnJv3Def5nr78r0Vmr7Y4m6Ec7jQSJUQXEqwKOY4srZ/a08MiDiAfgfkEm6as8W0tPnUTyDxlug==@lists.linux.dev
X-Gm-Message-State: APuU4Z9bCSCgOCKSP64zt4LyXyp8JW6SWfcfEzJt/27urpPpvNRxb26d
	A/VpC2I3jVIm3q9IWA7KGmrqyroVfUJiRkcB9Rqsl/yZogrTnEavjFYx
X-Gm-Gg: AZFdTZfo4lXUMlZoVWdXwWt8roDQlR9+WzGN9jSvslvDuPBi/oHSd14ZFSxJVYKDTT5
	8yLz+hVd+6wxup63xkS53Vt1HD1KBYUbw46QeUdnyuj7J/GR5FDMXDTU5axpof2b+MUwOgMoM7t
	cFlCnrluRhpe+BjsicyzI3jSdVb9LZ235hunYlQr+z/F5uQ4N6b0beXBSt4FpEhX0q4wHP0vODG
	K4+6I9tdzo3SKoTbXkm7KFEBnHR0fi8a7Tk9eYChjAfrOfG2VSc3l/RLjWtws5vLeHlcw4Na0Iu
	DWzu+THSj8eux0WToMFwsXILCEjTyBI0ji2TSezkgR1cdiFR6k/kdjEwgUGBeZdp7P4dDyJQMuS
	D+zzXxzL22uhVnOQZfSbmtBADApzLt0BNCF50TFnf9NB05sbkNM6gzKpNQxXcqTCgnd/t1h1Spl
	cHiYhX9Qu3BpsVv9vItYs14QCkczUo5Ns33lwuFv9knr2joXOK4/f010xT18U4PR2CtM0cGS7uf
	ypBR988BQThSr7zFk4Z0vtoUWn8FJj8FGf688iwxGS7tPqzQkoxgMOKdZolz8yWXo5NRlhuEMVw
	d87ayxicNUKCrWRdnJp7+lRRfaVdGljcVXrWAD1pS/QqUPm+g7/5B1O+HbXacwmwaItmuczx+3O
	dq2Xc6HdYQf22aj37oua3qZiPWf4cMbn84jP5
X-Received: by 2002:a05:690c:fcd:b0:8b4:cc58:7901 with SMTP id 00721157ae682-8b4cc5882e4mr22480827b3.8.1794826577207;
        Mon, 16 Nov 2026 02:56:17 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa41:8a69:2b8b:32cb:351d:f30d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm82274987b3.1.2026.11.16.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:56:16 -0800 (PST)
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
Subject: [PATCH v2 2/2] phy: sun4i-usb: clear SIDDQ before the PHY reset on A733
Date: Mon, 16 Nov 2026 07:55:44 -0300
Message-ID: <20261116105544.669029-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
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
index e2fbf8ccf99e..c918085a9281 100644
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
 		clk_disable_unprepare(phy->clk2);
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

