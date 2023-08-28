Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EBF12B86
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 18:19:52 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1c4b4c40281so2454017fac.1
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 11:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693246792; x=1693851592; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uPIXJhPu2X8m2txJVpiaWX2oUV0sHJhqCmozZ4S/pdU=;
        b=fD8PmC0+70Riz8sP093WtVt2Bg1EkwoBkC4/zqqOWCXLuHyUzzDKK1k1V/UqjbtRzw
         sdqSzJndGGyXFH5o1k75noAmXbrEpKQdFpcTWuYbr9f3ifiUfXrR5yHKC5CSILaQdPrA
         fYwQvtOhM3SRYfSMZq7h41PNBP6FFYLAuWWKdHiAxCaX9gQLjQjVIHXhdTyu70qsRcrs
         0KcXVHMctQo7wdlPwgp3oY52pl5HTNww1Xo9o/U4YHORRtzzWA5WskDFzsDWEag9kn1e
         IC8xwPfWn1x8kxEHhR6Y43gGQlFhOhwDUXBr7ipVOlJnFW9HH7D1+JJiVkCGOOZtFFWu
         htdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693246792; x=1693851592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPIXJhPu2X8m2txJVpiaWX2oUV0sHJhqCmozZ4S/pdU=;
        b=hH8x3CpiAinXXTcRgToLFswbBmosjz8qnYp/JJHvSX+hhMqjYaSiOfstzZPlbcwgnF
         inellLcEBfStoHPs+LMAsG4+lqaZzSHplRujwEiIxLJdyDR/bPinN4EuZFkYtau4mRT2
         ZVGjldzq9kyFfZqnkt9Cs3SI7AZamGXM2W3wtICKWx7o5bg0FDeRDHhVm5gLBEtz+BE8
         FE+Otd6pov+Naxdngt9XxYUwAtbkmtM8RFZnTrB/puWSCtxfTHzaof/Ar6sq78TjyhZO
         M9KbELq6VPu8qYk9Gh8pxhJuJ12uenYQVd9eT2u0VkLv7A2bnPFuK4MCw9P31oXVeJsh
         jH+A==
X-Gm-Message-State: AOJu0YwhmdfYLiXmxylCPkeiMILha5kvTl+warpbg2Coom37bvrz2yXB
	37eTwDVw0k4/7ELIp2adQlH9OFem0Hi1dw==
X-Google-Smtp-Source: AGHT+IEbZDjV/2eRM8CJYeGP2th9r2jDnUcAK42bxqYB+XGxVoi/KNSZvdqWSYc/4pBb/MM5iCGdOw==
X-Received: by 2002:a05:6870:e747:b0:1c4:d01e:48b0 with SMTP id t7-20020a056870e74700b001c4d01e48b0mr258400oak.6.1693246791635;
        Mon, 28 Aug 2023 11:19:51 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id g10-20020a9d620a000000b006b99f66444bsm3695927otj.71.2023.08.28.11.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 11:19:51 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	airlied@gmail.com,
	andre.przywara@arm.com,
	conor+dt@kernel.org,
	daniel@ffwll.ch,
	heiko@sntech.de,
	jagan@edgeble.ai,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	noralf@tronnes.org,
	robh+dt@kernel.org,
	sam@ravnborg.org,
	samuel@sholland.org,
	uwu@icenowy.me,
	wens@csie.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V4 0/8] Add Anbernic RG-Nano
Date: Mon, 28 Aug 2023 13:19:33 -0500
Message-Id: <20230828181941.1609894-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG-Nano handheld gaming device

Changes since V3:
 - Added PHY to the OHCI and EHCI nodes. Note that the PHY driver
   currently forces the PHY to host mode always; a correction to
   the PHY driver or removal of the phy values from the OHCI and EHCI
   nodes are necessary to get otg mode working properly.
 - Disabled SoC RTC in favor of external clock. The SoC RTC is not
   set up correctly in hardware and runs fast, whereas the external RTC
   keeps accurate time. This matches the BSP.
 - Added labels to GPIO pins to aid in readability.

Changes since V2:
 - Add display support.
 - Add USB host support.
 - Removed CPU frequency and voltage parameters, as CPU regulator may
   be tied into additional areas that need further testing.
 - Added regulator names back, as they appear to have been accidentally
   dropped in v2.
 - Updated notes to denote all hardware tested and working.

Changes since V1:
 - Added additional pwm pin configs to sun8i-v3s.dtsi and removed
   default config for pwm0 in lieu of defining it for each board.
 - Noted in patch notes that additional hardware of UART debug port,
   USB port (in gadget mode) also work, and that USB host mode does
   not work.
 - Identified GPIO responsible for enabling external speaker amplifier
   and defined it, allowing onboard audio to work.
 - Removed ac_power_supply node.
 - Set regulator min and max values to the same value as defined in the
   schematics.
 - Removed definition for reg_ldo1. This regulator is hardware
   configured so the value did not affect anything, however the driver
   must be updated to support the correct value of 3.3v in this case.
 - Removed usb0_id_det-gpios as I cannot confirm these are correct.

Chris Morgan (8):
  dt-bindings: vendor-prefixes: document Saef Technology
  dt-bindings: display: panel: mipi-dbi-spi: add Saef  SF-TC154B
  arm: dts: sun8i: V3s: Add pinctrl for pwm
  dt-bindings: usb: Add V3s compatible string for EHCI
  dt-bindings: usb: Add V3s compatible string for OHCI
  ARM: dts: sun8i: v3s: add EHCI and OHCI to v3s dts
  dt-bindings: arm: sunxi: add Anbernic RG-Nano
  ARM: dts: sunxi: add support for Anbernic RG-Nano

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../display/panel/panel-mipi-dbi-spi.yaml     |   1 +
 .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 284 ++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |  35 +++
 8 files changed, 330 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts

-- 
2.34.1

