Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com [136.143.188.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E010E17CA
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 05:57:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1665554218; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mloh0ibFlg0M3CTi/pTvKnlTWyaVPFK9P24woQAdz2W1dNF+Slbbl4W4xeaO2y0xZ6oj1KhRyG8nlBdMadeQONk2+zWfxH2ZEInfMgvLC9cKPz1vr3dI/5YUWfQ44xaBSmJdac0uA5SHuq7xE7Le4p/jOHi266Lqi7se0ahruqA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1665554218; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=df6Xu76n1FVOURXTtgq2s5GbTnkxSycxj4BBQsHU8Ho=; 
	b=JXlybDcYyYJkW/Oi5Twp4tBT8zh/fHLrFLajiIuNXErTo86JHDhbZYHT+Ej8mFRLwuXshvrWFQWSQHp5LW4kM6E8W1GCykkxZZdCHwCZC+XFMQeULZyuU0miaDzgBgNIrwiJwJjdeC+2rsvZfWVDDXPa4wMAanoaimQLYWKbYLo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1665554218;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=df6Xu76n1FVOURXTtgq2s5GbTnkxSycxj4BBQsHU8Ho=;
	b=T0zTCB12iNwCpnSb9Z1v53Zdlr7y0/8yyBKrZWVGQrezH7ySYm1ETrPmlTHmYuqW
	QbCsr6XZNbNY6mDX9yPRMKm8NgyIdLqsgG2pBln1YK2BGrccyPVrNwQB8xXuPU02Egt
	bNXfXbcBWewpjf4od/srHWc+/pB2VObj2NOL3CWc=
Received: from edelgard.fodlan.icenowy.me (112.94.102.144 [112.94.102.144]) by mx.zohomail.com
	with SMTPS id 1665554216256518.0177473419566; Tue, 11 Oct 2022 22:56:56 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 04/10] phy: sun4i-usb: add support for the USB PHY on F1C100s SoC
Date: Wed, 12 Oct 2022 13:55:56 +0800
Message-Id: <20221012055602.1544944-5-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221012055602.1544944-1-uwu@icenowy.me>
References: <20221012055602.1544944-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The F1C100s SoC has one USB OTG port connected to a MUSB controller.

Add support for its USB PHY.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes since v1.

 drivers/phy/allwinner/phy-sun4i-usb.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 3a3831f6059a..2f94cb77637b 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -109,6 +109,7 @@ enum sun4i_usb_phy_type {
 	sun8i_v3s_phy,
 	sun50i_a64_phy,
 	sun50i_h6_phy,
+	suniv_f1c100s_phy,
 };
 
 struct sun4i_usb_phy_cfg {
@@ -859,6 +860,14 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg = {
+	.num_phys = 1,
+	.type = suniv_f1c100s_phy,
+	.disc_thresh = 3,
+	.phyctl_offset = REG_PHYCTL_A10,
+	.dedicated_clocks = true,
+};
+
 static const struct sun4i_usb_phy_cfg sun4i_a10_cfg = {
 	.num_phys = 3,
 	.type = sun4i_a10_phy,
@@ -988,6 +997,8 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-usb-phy",
 	  .data = &sun50i_a64_cfg},
 	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
+	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",
+	  .data = &suniv_f1c100s_cfg },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sun4i_usb_phy_of_match);
-- 
2.37.1

