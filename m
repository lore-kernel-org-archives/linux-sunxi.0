Received: from the.earth.li (the.earth.li [93.93.131.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A11101D7
	for <linux-sunxi@lists.linux.dev>; Tue, 16 May 2023 17:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
	s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+jmwZ/VQPKLzXqOASuQptTiU2AfHtoEzL3jUEy1Vj6w=; b=Y5ulmajI5rjxBoJ2o1WiWxvcmQ
	5Y6FtHAZG+Jp0o3S4nRPUrFbwWPon1WB1tL0E1eDUcin0/nMILlYdQqzIDno6kAB67Y26WPh7qMph
	6SmxMNjxKDjVq2xnXotIa5C4e5Ij3TPSpErqTb9IvW9HmUasx9AE2a5OhIn0NCMbO5xzVVoDzn01f
	tLBP2kcILngvV6MaMHSf6HodAR3JP2lURXjgrGBbyCVOObLU26sFt9ftRQI0WVI4OUWOZ3fx9Q2Mv
	1UgHjAame9umTP/5DSx2xS/xssugcDtAf/VfP6H1S9Nzmr4s5/1Lw+nizACpH1FJBnTLeG4jcNHgd
	0HRMWNvA==;
Received: from [2001:4d48:ad59:1403::16a3] (helo=earth.li)
	by the.earth.li with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <noodles@earth.li>)
	id 1pyylJ-00GMpP-9P; Tue, 16 May 2023 18:47:01 +0100
Date: Tue, 16 May 2023 18:46:55 +0100
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
Subject: [PATCH v3 0/5] Minor device-tree additions for C.H.I.P
Message-ID: <cover.1684258957.git.noodles@earth.li>
References: <cover.1683719613.git.noodles@earth.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683719613.git.noodles@earth.li>

This small patch series adds some improvements for the C.H.I.P DTS,
enabling bluetooth, exporting the PMIC temperature details via iio-hwmon
and finally adding the appropriate base pinmux info for an external MMC
card. As a pre-requisite for the Bluetooth it also adds support to the
AXP209 driver for GPIO3, which is the Bluetooth device wakeup line.

v3:
- Add Reviewed-By/Acked-Bys
- Drop redundant else
- Switch to GENMASK/decimal values for GPIO3 function defs
v2:
- Fix missing ; on bluetooth stanza in DTS
- Add device/host wake GPIOs for Bluetooth device
- Add omit-if-no-ref on the port E pinmux stanza
- Rename axp20x_temp to pmic-temp
- Add AXP209 GPIO3 support

Jonathan McDowell (5):
  dt-bindings: gpio: Add GPIO3 for AXP209 GPIO binding schema
  pinctrl: axp209: Add support for GPIO3 on the AXP209
  ARM: dts: sun5i: chip: Enable bluetooth
  ARM: dts: sun5i: Add port E pinmux settings for mmc2
  ARM: dts: axp209: Add iio-hwmon node for internal temperature

 .../bindings/gpio/x-powers,axp209-gpio.yaml   |  1 +
 arch/arm/boot/dts/axp209.dtsi                 |  7 ++++
 arch/arm/boot/dts/sun5i-r8-chip.dts           |  6 +++
 arch/arm/boot/dts/sun5i.dtsi                  |  9 ++++
 drivers/pinctrl/pinctrl-axp209.c              | 42 +++++++++++++++++++
 5 files changed, 65 insertions(+)

-- 
2.39.2

