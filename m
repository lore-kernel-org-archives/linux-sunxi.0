Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2654E399
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 21:26:02 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-56e0d6651fbso147409eaf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 14:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692825962; x=1693430762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aIyoSTL/FB8MNetWSTC9cFmRk++muUZvuEzBZZ3bfQE=;
        b=IbCU8zu8skSH60X4KflpBU/30wLKqAi7RNSp/db9+k0pSBLiUmiYm4tSJiF3f/a7dL
         Jh1tJiqjbgiACxhoNigbVsFr9EFyhSzjSYKQdinJHeA4fnHrABvn79GUy0DpokqP+CwY
         f1UUFeuPmuwXjuJsp6KO9KF9reqgOeV5jbJz178jnmNOWfwKX4cQAth9yBrYsydjyNaa
         QkhjOLvkpHPSy4l7PoYbQeH+AJAd19TZEnRNcF6TSiB1VOS4LDuP+9RqjgfUbD/cGlY9
         u3V2b5WH9sb16y5HR3uvIG0yhpglVVD4Cy2N96AO2mUvw5/WugYEZWvPpuu0OUWAO6pR
         +dWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692825962; x=1693430762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIyoSTL/FB8MNetWSTC9cFmRk++muUZvuEzBZZ3bfQE=;
        b=bkFmMZ5H4WSqKjMSgDnx5IjmlL3k4443wlZddJGkI/3u4VXKnZtlYRV9OG7ai3gu/7
         RZYOKLs/mdsDg3nM+ki1m45+cY/l4aaZ40QLB2JG8p4y+/Xw/8nYDj4WNJ3+vFtjZ6eV
         dsHTiYFZxZGme/HC9mmooyF86VOmaib70/MQ1VHBog+IA+2YbhR0ylXt+ZavxzygFiTA
         ISsxq1bwevnztLU8ChKpypNh+7LmdlSXIkTqY69N74P3sN6jvbAzU9+et7DshDtfoenH
         DmDdwBi7RS7ybBjJ52BGY/iEDzbVSPJXWSNDlpo6R2lBexXgUwGvERlMgFlCThznv5xj
         PL3w==
X-Gm-Message-State: AOJu0YwIzx/cXZXGI/4/dHwR5tzr+rO6q3xhTDLmZbWAggkWItqrhBOn
	4c5ayJILWjYEHQM4vB+91C1K9tLSfKfFNA==
X-Google-Smtp-Source: AGHT+IFDFTHyHKCkPJKv5SFjaBP2aiyq/lVoCKS3QgpI2XUR0Bcas9p9OpMCMj1bdxLLP4YCFVlt2g==
X-Received: by 2002:a05:6808:23c1:b0:3a7:7b7e:f309 with SMTP id bq1-20020a05680823c100b003a77b7ef309mr9401723oib.10.1692825961715;
        Wed, 23 Aug 2023 14:26:01 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id d26-20020a05680808fa00b003a1d29f0549sm771127oic.15.2023.08.23.14.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 14:26:01 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	jagan@edgeble.ai,
	heiko@sntech.de,
	uwu@icenowy.me,
	andre.przywara@arm.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	neil.armstrong@linaro.org,
	noralf@tronnes.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 0/8] Add Anbernic RG-Nano
Date: Wed, 23 Aug 2023 16:25:46 -0500
Message-Id: <20230823212554.378403-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG-Nano handheld gaming device

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
  dt-bindings: display: panel: mipi-dbi-spi: add Saef SF-TC154B
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
 .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 275 ++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |  31 ++
 8 files changed, 317 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts

-- 
2.34.1

