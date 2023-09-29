Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FC4C8CE
	for <linux-sunxi@lists.linux.dev>; Fri, 29 Sep 2023 14:44:57 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6c0a42a469dso8462196a34.2
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Sep 2023 07:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695998696; x=1696603496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=01y5cNCvPfb4OYfK837xZCqnHz3VLWbPQC7xgt5H0hY=;
        b=Kw+YYzV9o5wfcYBHpaYwZjJJ5wKybjUkCOM1lt+ySbYPB2TTR76+wQlhBaKcSFqvc2
         ZYFsQMTQnqI+OhBnk5Qb91NBNgkxiFymdv3Flk5ycvaVffELzdv4873qOuwPjBwzxcsb
         t2mh/ytcgiLwkFBaiaTFUqLkJ9EFg8xdUDp6nHNk1AJRFbuF3vxm8O7rLfiLpdMPGwdN
         GqUJdD5Vqgz19ywdW7qwm2ZqrqoPoYjQyHOVu76n3JcUCezQjUrJzIC5WUcuAqfzrV/v
         8UOAQg4ktStIZPlHv+2T5uTTpagRuDAlpH8sRK/XH7vVOCvG6hfi+yqS+i4U2J3y/q8P
         xIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695998696; x=1696603496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01y5cNCvPfb4OYfK837xZCqnHz3VLWbPQC7xgt5H0hY=;
        b=vROjvQzD6935OD31AmZeJpdEcWKwds7KwlKufH4q5HiGAWm+57jjVLd+UAJ5HUuuLc
         sUWDzFinJ/EpjksZgst321Q4EJ+ANdg/zh+2hVUvM7jBJEB7DDcdBIDI7bYh7ZxSkDcP
         E4hrGCA7PU4XYWCIcICczfS0pwxYBwHBxMFwoPg1nWcwvrLbuTmYhobqR+5W7a978HSf
         YVoVZzvjKFRvvMEFBmkavFHq281kB6mIt0t9BK4h39U5U9jdFXhO60tlCacUnCD67zDO
         yc7nHyPeR8HTc8ZMRRmE3QYAZ95LAj3zxE5rSrmv+0EMcsVIonjNkyiZxbR4DpdnISLL
         EtlQ==
X-Gm-Message-State: AOJu0Yzf/QMs1j9IYABiDcrMtX7siPLbuDHWwrUB3LwR0rzy7MXUZFDK
	MBuaBRHkGeZfENS4r53I9zAc6h6yiWE=
X-Google-Smtp-Source: AGHT+IGQY5b4wIfQSmEpUS1OvVhEEtNueVAhRKUSvWsaW7sBuL6FsYyljX1MHvy7nxV1C0XW/1Uh7Q==
X-Received: by 2002:a9d:6a50:0:b0:6bc:8cd2:dd9c with SMTP id h16-20020a9d6a50000000b006bc8cd2dd9cmr4976738otn.36.1695998696296;
        Fri, 29 Sep 2023 07:44:56 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id q19-20020a9d6653000000b006b753685cc5sm3012619otm.79.2023.09.29.07.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:44:55 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	uwu@icenowy.me,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	andre.przywara@arm.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V6 0/4] Add Anbernic RG-Nano
Date: Fri, 29 Sep 2023 09:44:37 -0500
Message-Id: <20230929144441.3409-1-macroalpha82@gmail.com>
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

Changes since V5:
 - Removed references to "driver" in comments in device tree.

Changes since V4:
 - Rebased off main branch as some patches had been pulled into main.
 - Re-enabled the internal RTC based on advice from maintainers.
 - Removed "clocks" property from internal RTC based on advice from
 - maintainers.
 - Gave external RTC alias of rtc0 and internal RTC alias of rtc1 so
   priority would be given to the external RTC. The external RTC keeps
   accurate time, while the internal RTC lost 8 hours for me in a 24
   hour period.

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

Chris Morgan (4):
  arm: dts: sun8i: V3s: Add pinctrl for pwm
  ARM: dts: sun8i: v3s: add EHCI and OHCI to v3s dts
  dt-bindings: arm: sunxi: add Anbernic RG-Nano
  ARM: dts: sunxi: add support for Anbernic RG-Nano

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 276 ++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |  35 +++
 4 files changed, 317 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts

-- 
2.34.1

