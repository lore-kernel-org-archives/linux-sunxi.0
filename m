Received: from smtp-out.xnet.cz (smtp-out.xnet.cz [178.217.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A1F48D0
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Mar 2022 13:05:21 +0000 (UTC)
Received: from meh.true.cz (meh.true.cz [108.61.167.218])
	(Authenticated sender: petr@true.cz)
	by smtp-out.xnet.cz (Postfix) with ESMTPSA id 800163ED0;
	Tue,  8 Mar 2022 13:55:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=true.cz; s=xnet;
	t=1646744145; bh=IQtZfpMDBgNq+XqyyqcXkjpmhkMzPfrWtiIPXWEftkA=;
	h=From:To:Cc:Subject:Date;
	b=V5hxtIpNw/RdC4vprgPE1HhlvLfGbHUa5Tk2RyGpT+nY+b83oDxPMgcfj4vD6ZE2q
	 8y7IzJPJQwUvH1syMkj1OUpsAUlQW7EpTcSAfeQXMqxKkLgOhM/sr0aWclNPacgOy+
	 WTW7GwtOyIUCkK40klQ4OwlNiRTIeS5XFZVDaazY=
Received: 
	by meh.true.cz (OpenSMTPD) with ESMTP id 78341216;
	Tue, 8 Mar 2022 13:55:20 +0100 (CET)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>,
	stable@vger.kernel.org,
	=?UTF-8?q?Bastien=20Roucari=C3=A8s?= <rouca@debian.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "ARM: dts: sun7i: A20-olinuxino-lime2: Fix ethernet phy-mode"
Date: Tue,  8 Mar 2022 13:55:30 +0100
Message-Id: <20220308125531.27305-1-ynezz@true.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reverts commit 55dd7e059098ce4bd0a55c251cb78e74604abb57 as it
breaks network on my A20-olinuxino-lime2 hardware revision "K" which has
Micrel KSZ9031RNXCC-TR Gigabit PHY. Bastien has probably some previous
hardware revisions which were based on RTL8211E-VB-CG1 PHY and thus this
fix was working on his board.

Cc: stable@vger.kernel.org
Cc: Bastien Roucariès <rouca@debian.org>
References: https://github.com/openwrt/openwrt/issues/9153
References: https://github.com/OLIMEX/OLINUXINO/blob/master/HARDWARE/A20-OLinuXino-LIME2/hardware_revision_changes_log.txt
Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
index ecb91fb899ff..8077f1716fbc 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
@@ -112,7 +112,7 @@ &gmac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac_rgmii_pins>;
 	phy-handle = <&phy1>;
-	phy-mode = "rgmii-id";
+	phy-mode = "rgmii";
 	status = "okay";
 };
 
