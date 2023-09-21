Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870C4B641
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 13:51:43 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1dc6195bf93so496492fac.1
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 06:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695304302; x=1695909102; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQnk/EukUl4gGn7jN6jFIM1Bdgyvc5pMRWDJFOFOqH4=;
        b=WqNqO2DuDK3LHJJ+md6Rglvw0NMvG+xlUjjxB3g8rcGbAGNWwBPkouoPt6vJ02bSga
         WuK8lsq9UomtOh8EWvjDA0jdq5dyR1+YqxP9I5seFtMwbliVb7YqxJQjsOf3wYZjF6OB
         gGPswOQ3vhC+wewNkDHiwo8ey9eiJy+8DkOdgUjSbW4mpzgjCC+JRJJawSgTz68UFd/l
         UzD8fpk79mhA9nv6FPNgeuu1pIR2vGIcogd8YshfjdcNVaQVSAfpLTfZARG/WdwNmE6u
         8TfifxQlzh62SuqU3m8Pw2RkiIbisgb7hPcj3s99VEbGbTaWL61I9IcVBB+yF/veOVr+
         RnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695304302; x=1695909102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQnk/EukUl4gGn7jN6jFIM1Bdgyvc5pMRWDJFOFOqH4=;
        b=eCaUbCgoW4GE3SStFyfOyn8b4Wfkidi6NSEnTWWg3M4CX8Mc673PSsskb6sUWXxIBQ
         mNask/xpgah/ikOXZqHer1EHVQ67co9BKGXSSK6ls0rJiqNidIlvZVTdE3CT7y/1VCwZ
         nDrRRIlRyLTNPNu7/mtkhxxUPLVKB3s7ZGXv1wz17bMC79Yc7J41zJBKu3IE+rBQK3w9
         ZKsuIL02MZo1b62O1GKraNPcH9fomxBWM77D2/7nICqSAPGSch7LElfr19kZfOjrtsH7
         8G6wZ2eu0XpcBHmSmYEpafXCd83HCqK6v7+R7sFTQxaVanqRGOP7eDC2+KPZELe49Gmx
         EGAA==
X-Gm-Message-State: AOJu0YyNCPpBOkTsINd4Z6FsynhaMybmDaPBnglInsXHDE2ZwDVoA2jW
	QcQa1zUvTju+ImNPSEW2NyELDiesgEs=
X-Google-Smtp-Source: AGHT+IGLbGu1Hl53B84DZYVc0hKVnYUWkHEkkbXYl9svuF2zdhPRlvJ1p4GV81ed7n4DuvYDgTXW5A==
X-Received: by 2002:a05:6871:6a7:b0:1d5:a3e5:ca1a with SMTP id l39-20020a05687106a700b001d5a3e5ca1amr5992821oao.16.1695304302133;
        Thu, 21 Sep 2023 06:51:42 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id z19-20020a056870e15300b001d7034bc222sm547064oaa.15.2023.09.21.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 06:51:41 -0700 (PDT)
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
Subject: [PATCH V5 0/4] Add Anbernic RG-Nano
Date: Thu, 21 Sep 2023 08:51:32 -0500
Message-Id: <20230921135136.97491-1-macroalpha82@gmail.com>
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
 .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 284 ++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |  35 +++
 4 files changed, 325 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts

-- 
2.34.1

