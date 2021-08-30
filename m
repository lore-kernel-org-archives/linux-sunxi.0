Received: from ssq0.pkh.me (laubervilliers-656-1-228-164.w92-154.abo.wanadoo.fr [92.154.28.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA9172
	for <linux-sunxi@lists.linux.dev>; Mon, 30 Aug 2021 00:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pkh.me; s=selector1;
	t=1630284778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=npBp7WbmtiPU0EE4g71XUbLHJkGWHeertqZ8nJ2kRIE=;
	b=Lrs7RFgCixbAMl3bNXhHrXkNCs53EwjDnTAsK7arnbLjXrvUQAVMWuWHASRwVBw91FwiPD
	o6mlQmbv/bbXOpnIzf0LbM5u/amPkVNW0nP8T0NOGfnn3F/FJilvo+24XC9EVwlbXkG/z8
	zT2ie4/WhlLblWtZ+Wsgg9nsQdmgh/g=
Received: from localhost (ssq0.pkh.me [local])
	by ssq0.pkh.me (OpenSMTPD) with ESMTPA id 9b1de0ac;
	Mon, 30 Aug 2021 00:52:57 +0000 (UTC)
Date: Mon, 30 Aug 2021 02:52:57 +0200
From: =?utf-8?B?Q2zDqW1lbnQgQsWTc2No?= <u@pkh.me>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Willy Liu <willy.liu@realtek.com>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: sunxi H5 DTB fix for realtek regression
Message-ID: <YSwr6YZXjNrdKoBZ@ssq0.pkh.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

Commit bbc4d71d63549bcd003a430de18a72a742d8c91e ("net: phy: realtek: fix
rtl8211e rx/tx delay config") broke the network on the NanoPI NEO 2 board
(RTL8211E chip).

Following what was suggested by Andrew Lunn for another hardware¹, I tried
the following diff:

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts
index 02f8e72f0cad..05486cccee1c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts
@@ -75,7 +75,7 @@ &emac {
        pinctrl-0 = <&emac_rgmii_pins>;
        phy-supply = <&reg_gmac_3v3>;
        phy-handle = <&ext_rgmii_phy>;
-       phy-mode = "rgmii";
+       phy-mode = "rgmii-id";
        status = "okay";
 };


...which fixed the issue. This was tested on v5.11.4 but the patch applies
cleanly on stable so far.

I'm sorry for not sending a proper patch: I unfortunately have very little
clue about what I'm doing here so it's very hard for me to elaborate a
proper commit description.

Best regards,

[1]: https://www.spinics.net/lists/netdev/msg692731.html

-- 
Clément B.
