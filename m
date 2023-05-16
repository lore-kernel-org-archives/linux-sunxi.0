Received: from the.earth.li (the.earth.li [93.93.131.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D9B101D5
	for <linux-sunxi@lists.linux.dev>; Tue, 16 May 2023 17:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
	s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KbcQkYKNRCHyuXFCuS3kkLD2pB2ybnzz6U+C/4pf2yo=; b=CKgH460/CO2JV+oflOuijS3r5q
	6vIPnY51LwvOvEthIh3DFtITt3uPivgwuC7GNCxIiORdo06NXt9khGgUuzMizF3Tm7PXKapoBWD12
	EA3JDVVx8WNN73SejQX4RNgQZGAuwWP+DWyFaoIRml/UvOQwmNfTVHF2KkHXwxIftWU9ASBjEx5/S
	qUzecZonZeN8e3VqtxIq4wEVavhAvPJVw6wJLVjylHA0I/jqq85+darZ5v+x1aoDzGJtMxjSN8mxC
	P00c7jBoleNHGiiv2ri2R0IAb9WMMgTlciXVDV4nadQi+H8ln8rSJ+AIefjdCWEj0V7q9MKEn6Jas
	H3Utr+Bg==;
Received: from [2001:4d48:ad59:1403::16a3] (helo=earth.li)
	by the.earth.li with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <noodles@earth.li>)
	id 1pyymh-00GMwv-FJ; Tue, 16 May 2023 18:48:27 +0100
Date: Tue, 16 May 2023 18:48:21 +0100
From: Jonathan McDowell <noodles@earth.li>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>, andy.shevchenko@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 5/5] ARM: dts: axp209: Add iio-hwmon node for internal
 temperature
Message-ID: <a0f48e6d799ce7f95cd536cf9e13b18d73c920d4.1684258957.git.noodles@earth.li>
References: <cover.1683719613.git.noodles@earth.li>
 <cover.1684258957.git.noodles@earth.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1684258957.git.noodles@earth.li>

This adds a DT node to hook up the internal temperature ADC to the
iio-hwmon driver. The various voltage + current ADCs are consumed and
exposed by their respective drivers, but this is not and is always
available. Naming chosen to match the axp20x_ prefix the power sensors
use.

Signed-off-by: Jonathan McDowell <noodles@earth.li>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/axp209.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/axp209.dtsi b/arch/arm/boot/dts/axp209.dtsi
index ca240cd6f6c3..469d0f7d5185 100644
--- a/arch/arm/boot/dts/axp209.dtsi
+++ b/arch/arm/boot/dts/axp209.dtsi
@@ -48,6 +48,13 @@
  * http://dl.linux-sunxi.org/AXP/AXP209%20Datasheet%20v1.0_cn.pdf
  */
 
+/ {
+	pmic-temp {
+		compatible = "iio-hwmon";
+		io-channels = <&axp_adc 4>; /* Internal temperature */
+	};
+};
+
 &axp209 {
 	compatible = "x-powers,axp209";
 	interrupt-controller;
-- 
2.39.2

