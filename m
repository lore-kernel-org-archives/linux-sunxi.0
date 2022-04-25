Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1637C
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 06:50:09 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.riseup.net", Issuer "R3" (not verified))
	by mx1.riseup.net (Postfix) with ESMTPS id 4KmwTT3SqczDqPv;
	Sun, 24 Apr 2022 23:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1650869037; bh=9QTUQsz7p3LgCyGvQcd0KqFtKCU9hMDTBzgllMOejBs=;
	h=From:To:Cc:Subject:Date:From;
	b=NHw16rVcEtBkzoOUhSx66Dq1KF9ku7xVlnLjJ9u57e5wo6iBbtPCIHLFaQDCpcVKP
	 x6S3Xh888DsE15hnrtpI2XXzLNHb+ELVaK06HfPYuzUR2ZXd6rx7R4kWe4yTgrddW3
	 O7GHTgp+hFVZWiKrz5+IkZMJ9bVQ82tk/nrokhZ8=
X-Riseup-User-ID: 8391CEFFC40D3B73A696D390F795B1501AF17B3A5691C965BCF9AC962B91551A
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews1.riseup.net (Postfix) with ESMTPSA id 4KmwTQ0hNjz5vY4;
	Sun, 24 Apr 2022 23:43:53 -0700 (PDT)
From: Dang Huynh <danct12@riseup.net>
To: Dang Huynh <danct12@riseup.net>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: sunxi: nanopi: Remove input-name property
Date: Mon, 25 Apr 2022 13:42:32 +0700
Message-Id: <20220425064231.243482-1-danct12@riseup.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This property doesn't seem to exist in the documentation nor
in source code, but for some reason it is defined in a bunch
of device trees.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
This patch is a split of this treewide patch [1] to ease the 
maintainers. 

[1]: https://patchwork.kernel.org/patch/12633497/

 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi b/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
index fc45d5aaa67f..a9f749f49beb 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
@@ -75,7 +75,6 @@ led-1 {
 
 	r_gpio_keys {
 		compatible = "gpio-keys";
-		input-name = "k1";
 
 		k1 {
 			label = "k1";
-- 
2.36.0

