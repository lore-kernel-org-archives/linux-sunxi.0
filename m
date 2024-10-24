Received: from thales.epochal.quest (thales.epochal.quest [51.222.15.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A4F1F76B9
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Oct 2024 17:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.222.15.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729789790; cv=none; b=r+bo7O21yIWt1aGljmtCjh9xcYcY0lZCNSC+YQ7Qd59lMHMHJJdfFd9jD8802/9uTwg6CBX1E9tbr3/W4owudf6lgnlSOmUTdRw9AdjZ+B28VEutE3WMMPeqhCww+5CAMEBS3uVZvPdePBfRg1oZBb3P0/RihPTrF6Kbw78Wv1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729789790; c=relaxed/simple;
	bh=FH09cfs2D/eTLSS+cO6Kkfb54K4fYoxC6N0jK4Y1o38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8xNiLtPR1GPvwBfsempFyWBp4Lw3DCY6JtTXQYVAgfcfu+jDLCsdSi80k2nKYX7vKWr8AkS6B6TcwMmr8/SeoSZLxBqjoR0wv4bVLZmXO9OBSjaX+0O23n0SdnqZsuprAKrZ3eUzmmF+ZK1GxsWDMQ6pi3D76WLcGHQfO3v7vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest; spf=pass smtp.mailfrom=epochal.quest; dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b=bBAsoLfA; arc=none smtp.client-ip=51.222.15.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=epochal.quest
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b="bBAsoLfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1729789785;
	bh=FH09cfs2D/eTLSS+cO6Kkfb54K4fYoxC6N0jK4Y1o38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bBAsoLfA8Xr8/ymGhdlRzh7wD6MaTfs+sSVd7UkyXRmhfIO+ZH9IeAl5UQrOJsfCu
	 BAV00mWamykjITl8MViMv08vXtYZvcJyx8x3pTQ9hWLJjyX2p3SLvcHxx7mLNULIGa
	 99+JcSKt6UUf4uYqTowPeo9IzKQ0uuTJyXtU5N3KjTLjFUx2Hs4i5kjUbVQPPEN8E5
	 Z8ebFUldvG0reYFdBejn99W8mJCunTX4VpVFBTT9EX6tQOHxc/61GNCNbivA4BSHbA
	 WZi/bY6oJLsSz9A4Q8uo048ppkl6q9ZSS2RMYnjbQiG2vKWa9kThlsTW7vZoYy792J
	 75AaHJpmNx31Q==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Yangtao Li <frank@allwinnertech.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Parthiban <parthiban@linumiz.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <treding@nvidia.com>,
	Maxime Ripard <mripard@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH 06/13] phy: sun4i-usb: add support for A100 USB PHY
Date: Thu, 24 Oct 2024 14:05:24 -0300
Message-ID: <20241024170540.2721307-7-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yangtao Li <frank@allwinnertech.com>

Add support for a100's usb phy, which with 2 PHYs.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
[masterr3c0rd@epochal.quest: modified to use quirk flags]
Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index b0f19e950601..a3942b2ee90b 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -1006,6 +1006,16 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 	.phy0_dual_route = true,
 };
 
+static const struct sun4i_usb_phy_cfg sun50i_a100_cfg = {
+	.num_phys = 2,
+	.disc_thresh = 3,
+	.phyctl_offset = REG_PHYCTL_A33,
+	.dedicated_clocks = true,
+	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
+	.phy0_dual_route = true,
+	.siddq_in_base = true,
+};
+
 static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
 	.num_phys = 4,
 	.phyctl_offset = REG_PHYCTL_A33,
@@ -1040,6 +1050,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	{ .compatible = "allwinner,sun20i-d1-usb-phy", .data = &sun20i_d1_cfg },
 	{ .compatible = "allwinner,sun50i-a64-usb-phy",
 	  .data = &sun50i_a64_cfg},
+	{ .compatible = "allwinner,sun50i-a100-usb-phy", .data = &sun50i_a100_cfg },
 	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
 	{ .compatible = "allwinner,sun50i-h616-usb-phy", .data = &sun50i_h616_cfg },
 	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",
-- 
2.47.0

