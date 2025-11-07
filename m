Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932C931D366
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Nov 2025 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511429; cv=none; b=tygCGVlvuCeubLcY79sgtKEa1/7QerB3nWDZHBYRKncDaDnGUpqY3NrAf1UNK9/XKoVANrqMJ5cI14BD9/MP3UvPFuTmF2PE15Tc3hjidjum0A4wFimfNADgr3EGT7AI9v9Mv8P5tqRD2gpgBC3mPW12oHjrgnAl3ju+Cz06X7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511429; c=relaxed/simple;
	bh=RftDSrG8k9UKl5gPmTd6+qE6aIUSENSDbkOBTlUFJCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oqat4fLC4kAlhgzibA9nLX/GO4TOAdX1CyXGRv4yExvHbvK1E+KhQEgP8gvwv1O3CCEbPwiaRzq5k9ocNbG30Xw3flikUVybIHWUSKPvy2EzWgcdXSEIP4K2OoQyfP621f+eKKteEnhTm5zgkiRtNq8PcLRdD3B6hDswcJSWrbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZoiWpLzc; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZoiWpLzc"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429c7869704so463108f8f.2
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Nov 2025 02:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511423; x=1763116223; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IW9Ne798a3XGNxpeP/XYKMinJIQLw0sjHAkXdXk9L6c=;
        b=ZoiWpLzchq7HvFPwwbWo9I0a5JbsgfZE8bOdvVOTF3ogIxeEePxTZjYdkBaNGhC+/L
         lIZY818hiRStepQXWg5uMHbOYcNOaipnslEVPguvqs45GzjHGaeoUr3d2XSjgRwjYJed
         SeQ62/YK9jfQWD+7MR8/SYsbgONXaXsXNnVJu4UnEXuv6jnuUpnF22PNpScQbGiCCSHr
         znHCxR2G8UdiTgLiJDPLz06Pq84XUuQo5hjzexoAfXgnrOYiivYBPhGdbEpKbLM/uWGI
         ypv4NgmeEVabzEQgnU5sJJjDJalXpQK3SQobCFFNuHvtzEhRco0L0hOo66c7OAFnUvuW
         gsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511423; x=1763116223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IW9Ne798a3XGNxpeP/XYKMinJIQLw0sjHAkXdXk9L6c=;
        b=eRCPxxhf3nkXKt3FL4xEwXbYbQN81fD+jf0AabgzAot7SFma6KoVwVkuGbkIk3jiFf
         2gcajFXs0N0Z4AlhA/wtzTycSObjzmDNOJd9Nn33X+g/yIYqJ07m+cz1h/1Laud/23/y
         jrjarTJJuKYWtIxrcJnMZV5YY8C+xm63VowFofObQRtZugAf08RZIgOqKGa9mP0RzNqM
         GQTe+0+gsp6PTIVHPNAcPfJIjoS+qDGEqSVwcd4c6GKgbLl7d4pevn4hifTWsnm8bweJ
         P0OIFD8PF2hN2N1D1lSlfje8AkECIEzZ+uj6XBEnDk/8/jgqcxBQKJ4SZ06yYioqu+EK
         BoWA==
X-Forwarded-Encrypted: i=1; AJvYcCW4F2otBHOD87HyHetfqTOOvdGM6rlHL7O/S79eZ0Fboeu0FAe3Ntmst6CxA83qNevJP8+5kwLMARGKUA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZE4PQkvzY/ttopMooPnEoeJViCOKfNgU2ZHDOQ5QVate5K2Zo
	IlwW01JvmUY3n60lrbORC/Vm2c4Kla26uBYVaxbtsSjJ69YWHkzn8Lien828sjtYVoc=
X-Gm-Gg: ASbGncsBk+wg8CXqiCd7jxXlQFBlOaHWcRoco6bgE438PVLyY7i6V4R5TyPZFUgMIpm
	1X+1IvPQwcqTu63hWYKWiKSPh2XFGvS4GJ7axawEzfAkkUtuGABueAztNaYMh0U7xXy/tsUNAUn
	N5kSADyO6mkmRe0zO+0h0D9fZIK815YCqgTqy6tDseFj1mMqlnl3R6igg9T6YLztm+le+fzdo7R
	WmN/JRKwA4aRaEMj2R5FCLaggoZhs5bTtNIMNNpx42Sli3F1JvFIexKalbR0JXpvlIRn9BoLOf7
	iOVZJGet/cosrduCrbkFw90+1ERDHiKtn11DlT/EZbymc3bIutMNwHOiVL2C9XRXXjbvQVzAOuw
	UtkTkEOIpUxA8u9QM+3PXztFn+YJ0RpzVL4iXAwhdecVIoNX+7s5BMR0qeqU+eSPgk79K
X-Google-Smtp-Source: AGHT+IFpqCax/etL7YBonMLg2ghpNqRSdt4/QfKEmo1jIIOiobsAbC9IeCXpm6YbnXbm7t+dRlK3qQ==
X-Received: by 2002:a05:6000:2281:b0:429:d0b8:3856 with SMTP id ffacd0b85a97d-42ae5ae9a85mr2017744f8f.51.1762511422545;
        Fri, 07 Nov 2025 02:30:22 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:30:21 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 07 Nov 2025 11:29:56 +0100
Subject: [PATCH v5 6/8] net: stmmac: qcom-ethqos: split power management
 context into a separate struct
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcom-sa8255p-emac-v5-6-01d3e3aaf388@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4943;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ywDusXCc0OEyB5wkP2D4YZe7bremgDjiZGqRKKOTVlo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDcooPdaWdkZYBpIqDN6krbrfnLAWwPEOzzFyR
 U1Tk5rFI3OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KKAAKCRARpy6gFHHX
 ci1lD/4+AT7dU1HBmrr8PjQeodm6MvtLEav8Abl9riaivkbDRx15PVsGELihnHkbjdpg1MParOR
 b5KBKQ2oPDv6J/bHgN4t8VE4ajPD44Q4JRQRo4t8d8tQKhoqXcLB1/w2/CWKh+t8nl1U1wbg8b2
 xT5YCI+0LsAmZiBv0rONgy5tcUPGjI5Ol5hSRnkDB6ayDtyuOHxoFyeu1qIbUBQ8KXeal6qnaSN
 A16vSNpYTiimlRmRi1PnCvzGiwsjMZhtQlKI0oHfvmHv0j5fuG5QZ2pXGOBRWcpXj7aMwEeZC8J
 32lYUsK/Oe/n6ZACnmkb4Vd/wr4JkJmCZASlybIicztOmwJRlsWQFeEjRw46SQ9rwMI058nafVM
 RVVihMDiXfaZ7c+QJC4LArooLYL4rUON8trJWqttcHF1z5h8GUpf9vaHvLAnYxNzktDgPCRk6wB
 F8ia9vqeKgXzCPI1bwVkAK4ZoiNyVa4dj7fRhSXK5NEVMEDpjm/jz2sBNghesTlA8tygwv9RptM
 VVC3HfZU8u0JOHWbmxeV32AlfXZMZYW5XvatyZ7DvyPhSXkYpY98GrBYcBERLuoEsHgj0MQ89O+
 yfWHtNssClSVg4Jhzj8jDDCu8cqLzl4xsOzKK/XhE0vD8O7Uk1koz0kKSjet1+BqJLlR+qnqvsI
 cIbKYkqiRTcRbIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 46 ++++++++++++----------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 1f00556bbad997e2ec76b521cffe2eb14fabb79e..09f122062dec87aa11804af2769ddff4964e6596 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,17 +105,21 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	unsigned int link_clk_rate;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	unsigned int link_clk_rate;
-	struct clk *link_clk;
-	struct phy *serdes_phy;
-	int serdes_speed;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
+	int serdes_speed;
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -181,9 +185,9 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+		ethqos->pm.link_clk_rate = rate * 2;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	clk_set_rate(ethqos->pm.link_clk, ethqos->pm.link_clk_rate);
 }
 
 static void
@@ -639,7 +643,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
+		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
 	}
 }
@@ -708,23 +712,23 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
 }
 
 static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
@@ -733,7 +737,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -746,7 +750,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -843,9 +847,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -856,9 +860,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
@@ -880,7 +884,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.51.0

