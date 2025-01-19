Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C26179BC
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jan 2025 19:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737316528; cv=none; b=EBwf5U8eND0BenMpleEcv1Fk+WeHO2MPhOArnRVQzoTMDFQlTXW89ACdwJDwQooCqMsFIiqjLe90zzViPa1AsWnuS7eEnCxR20+vbqS/kbop3HhHvDM4SC2aNFS2tM79ketl9N02gG67ADtex/dnyWj0eA6rgVYbERHtJAt+qDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737316528; c=relaxed/simple;
	bh=vewAH/H+iIRkgulT6AZeCY6N3AAfCo1orgGKwIyIZ0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnrfCVuOm75IE4FLGkoumfG0W8yVs0sPC1LOboiDgITLM9Wg5avtlZgCW/mSOrYzMcW719RxzErD+GLDHhHQ5Bt29xZoukZ7A0Vvyq3pQQUP7RhdI83pQUlScprdxcdlWjCVvslYjSal7N803t/KeX4OfZI0UZ7mLH6/sr1obhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfOlACTO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfOlACTO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso29541975e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Jan 2025 11:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737316525; x=1737921325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjgKM0tnNEx6uy+SqNo6Fx3FuTcVLLCPMN4YCTYGGd0=;
        b=RfOlACTOqompC1cHTS8ITbrHmDQLmuvLWUnaeb07UXCn6mKQ8kdUVAfj39XVyCfkaY
         BL35wLYce9g96ulMAedMLxeds9t4p8TgV17JSdf+lOcs4RjWlKwLeRlOdSakrzXWXkKU
         1pisTNivXZboG7z4H+kGiyFQN/GWlrHQZjIoa09oadEaC4IAW/hdbv7OMv5mU9wa70PK
         c9CzOVos/4ePGtFvuh0rErdq25B1A0EvkOk8bojCw2f3UJjYJ67zwg80SnOTSO6HAOuN
         imBxkzmOqKh98g/9AS/IYIIY3hFcPU913kDg/knCflyHBs1rsULCcFIuCoSsB1upUPK4
         6HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737316525; x=1737921325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjgKM0tnNEx6uy+SqNo6Fx3FuTcVLLCPMN4YCTYGGd0=;
        b=JHzpm70eef+4NtYHGjJWIrvc3L1wp7T4Pnp2UlzWQmwxJu9THSYkitE7fDjpxCz+Lf
         Lk4yMoCE3ns2AyPdKX9KO3D+Vaj6Ax4/d3oSpDcTzVyCQH7uwvsPmlavRgdz1VNv0mXC
         MYvQwLJTUoTypiH/kHjS1sQMAOLtATBYu2P9dOSaWRFJJq3jgRbTxSILlZMrmvViE+Ad
         c3CP8wP6Io7PcsItSy52d1wRCl5uMjGovHhTZ12ufdWYt+VZP7fvoU0gjjzlcpSYS8Da
         YhmHFqA25uzi4miQkWOmP9QM5TJp3yUWkilXtOxZFieNlAltWXD6D+LMHyDaqUwMcLVg
         RYMA==
X-Forwarded-Encrypted: i=1; AJvYcCWS16tLOkct/R1ARe0AsTpIP65NXE/KWk0INZEP7Yp2puTS7bAH9UYSkf1n/RjfA7i5pAxltSHzh5gM/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxGHV/mvhMmhsfp9JA3HWX6lGhx4BUtIvl5vQvcJNShCePxPUy
	sPzY/ngJR3rmEgJIqdJFziUvgCMVkd5XxQt8rDqa5B5AvZFNm72rAZAzcQ==
X-Gm-Gg: ASbGncuZGzbat2ld1+6tyuUKXKYutc0OjcsEvAIXPcgqlwtzDSV80H/WUlYQjujbM2R
	uV49eMiQUB3eYFu9Nj1vntidMI3kvwfoVbUjxeSmUvhyz4yiKPcy0bCtsyEKvPzRX1WNKHDsF0G
	RiZuhhx2NsLHab7etuE4hPt3lQsVVKQuRJ1on0ZXIx1ejVILN19lTYRf5aUB0XZhGc11x8uE6va
	1cG96Xgu3UYuv6g2yPSn0gAhGwWsEjV5736gcDVp8Hj1gwKESfe0HBL/qty9jRN0WL7Z5EQGmN9
	ogs4qHe5JWcyU+VOnyG51X/MrAi2Z1O4VWWfO5svM3ACbg==
X-Google-Smtp-Source: AGHT+IEJqOW54W1lRxz+JIVbZP7UU3BMUnKuWPAYJ+8VVFyg2CQZQN7BF1ufsYBuU6gKRviNXE5zrA==
X-Received: by 2002:a05:600c:cc8:b0:434:fe3c:c662 with SMTP id 5b1f17b1804b1-438918f6027mr80369755e9.12.1737316524627;
        Sun, 19 Jan 2025 11:55:24 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c16610a0sm113827255e9.1.2025.01.19.11.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 11:55:24 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: u-boot@lists.denx.de, Andre Przywara <andre.przywara@arm.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, linux-sunxi@lists.linux.dev,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 0/3] sunxi: switch three SoC families to OF_UPSTREAM
Date: Sun, 19 Jan 2025 20:55:23 +0100
Message-ID: <4979410.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20250119164157.23648-1-andre.przywara@arm.com>
References: <20250119164157.23648-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 19. januar 2025 ob 17:41:53 Srednjeevropski standardni =C4=8Da=
s je Andre Przywara napisal(a):
> This series converts boards with the Allwinner F1C100s/F1C200s, A10, A10s
> and A13s SoCs over to OF_UPSTREAM. The .dts and .dtsi files were
> identical between the kernel and U-Boot repository, so this is a
> no-brainer.
> However there are four boards (tablets, I guess) that do not have a .dts
> file in the kernel repository. For now I kept them using the "old
> style", so they continue working. This requires to keep a copy of the
> SoC .dtsi file, I would be grateful for any advice as how to handle this
> situation best. Ideally we would submit the DTs to the kernel, but I
> don't know how feasible this is, given their age, the missing device
> availability and their basic DT nature.

Drop them? I don't think there is much value to have them in such
poor state. If there is interest, people can first use older version of
U-Boot and then follow proper procedure for including them.

Best regards,
Jernej

>=20
> I compiled all boards with and without this series applied: the
> resulting u-boot.dtb files were always identical.
>=20
> Please have a look!
>=20
> Cheers,
> Andre
>=20
> Andre Przywara (3):
>   suniv: switch Allwinner F1Cx00 boards to OF_UPSTREAM
>   sunxi: switch Allwinner A10 boards to OF_UPSTREAM
>   sunxi: switch Allwinner A10s/A13 boards to OF_UPSTREAM
>=20
>  arch/arm/dts/Makefile                         |  48 +--
>  arch/arm/dts/sun4i-a10-a1000.dts              | 255 -------------
>  arch/arm/dts/sun4i-a10-ba10-tvbox.dts         | 151 --------
>  arch/arm/dts/sun4i-a10-chuwi-v7-cw0825.dts    | 159 --------
>  arch/arm/dts/sun4i-a10-cubieboard.dts         | 255 -------------
>  arch/arm/dts/sun4i-a10-dserve-dsrv9703c.dts   | 218 -----------
>  arch/arm/dts/sun4i-a10-gemei-g9.dts           | 192 ----------
>  arch/arm/dts/sun4i-a10-hackberry.dts          | 140 -------
>  arch/arm/dts/sun4i-a10-hyundai-a7hd.dts       | 115 ------
>  arch/arm/dts/sun4i-a10-inet1.dts              | 229 -----------
>  arch/arm/dts/sun4i-a10-inet97fv2.dts          | 203 ----------
>  arch/arm/dts/sun4i-a10-inet9f-rev03.dts       | 357 ------------------
>  .../dts/sun4i-a10-itead-iteaduino-plus.dts    | 126 -------
>  arch/arm/dts/sun4i-a10-jesurun-q5.dts         | 181 ---------
>  arch/arm/dts/sun4i-a10-marsboard.dts          | 182 ---------
>  arch/arm/dts/sun4i-a10-mini-xplus.dts         | 144 -------
>  arch/arm/dts/sun4i-a10-mk802.dts              | 144 -------
>  arch/arm/dts/sun4i-a10-mk802ii.dts            | 111 ------
>  arch/arm/dts/sun4i-a10-olinuxino-lime.dts     | 225 -----------
>  arch/arm/dts/sun4i-a10-pcduino.dts            | 200 ----------
>  arch/arm/dts/sun4i-a10-pcduino2.dts           |  67 ----
>  arch/arm/dts/sun4i-a10-pov-protab2-ips9.dts   | 206 ----------
>  arch/arm/dts/sun4i-a10-topwise-a721.dts       | 242 ------------
>  arch/arm/dts/sun5i-a10s-auxtek-t003.dts       | 137 -------
>  arch/arm/dts/sun5i-a10s-auxtek-t004.dts       | 149 --------
>  arch/arm/dts/sun5i-a10s-mk802.dts             | 127 -------
>  arch/arm/dts/sun5i-a10s-olinuxino-micro.dts   | 272 -------------
>  arch/arm/dts/sun5i-a10s-r7-tv-dongle.dts      | 118 ------
>  arch/arm/dts/sun5i-a10s-wobo-i5.dts           | 195 ----------
>  arch/arm/dts/sun5i-a10s.dtsi                  | 173 ---------
>  arch/arm/dts/sun5i-a13-difrnce-dit4350.dts    |  50 ---
>  .../dts/sun5i-a13-empire-electronix-d709.dts  | 190 ----------
>  .../dts/sun5i-a13-empire-electronix-m712.dts  |  51 ---
>  arch/arm/dts/sun5i-a13-hsg-h702.dts           | 182 ---------
>  arch/arm/dts/sun5i-a13-inet-98v-rev2.dts      |  50 ---
>  arch/arm/dts/sun5i-a13-licheepi-one.dts       | 214 -----------
>  arch/arm/dts/sun5i-a13-olinuxino-micro.dts    | 141 -------
>  arch/arm/dts/sun5i-a13-olinuxino.dts          | 247 ------------
>  .../dts/sun5i-a13-pocketbook-touch-lux-3.dts  | 258 -------------
>  arch/arm/dts/sun5i-a13-q8-tablet.dts          |  80 ----
>  arch/arm/dts/sun5i-a13-utoo-p66.dts           | 116 ------
>  arch/arm/dts/sun5i-a13.dtsi                   | 118 ------
>  arch/arm/dts/sun5i-gr8-chip-pro.dts           | 238 ------------
>  arch/arm/dts/sun5i-gr8-evb.dts                | 333 ----------------
>  arch/arm/dts/sun5i-gr8.dtsi                   | 126 -------
>  arch/arm/dts/sun5i-r8-chip.dts                | 282 --------------
>  arch/arm/dts/sun5i-r8.dtsi                    |  47 ---
>  .../dts/sun5i-reference-design-tablet.dtsi    | 194 ----------
>  arch/arm/dts/suniv-f1c100s-licheepi-nano.dts  |  73 ----
>  arch/arm/dts/suniv-f1c100s.dtsi               | 330 ----------------
>  arch/arm/dts/suniv-f1c200s-lctech-pi.dts      |  76 ----
>  arch/arm/dts/suniv-f1c200s-popstick-v1.1.dts  |  81 ----
>  arch/arm/mach-sunxi/Kconfig                   |   3 +
>  configs/A10-OLinuXino-Lime_defconfig          |   2 +-
>  configs/A10s-OLinuXino-M_defconfig            |   2 +-
>  configs/A13-OLinuXinoM_defconfig              |   2 +-
>  configs/A13-OLinuXino_defconfig               |   2 +-
>  configs/Ampe_A76_defconfig                    |   1 +
>  configs/Auxtek-T003_defconfig                 |   2 +-
>  configs/Auxtek-T004_defconfig                 |   2 +-
>  configs/CHIP_defconfig                        |   2 +-
>  configs/CHIP_pro_defconfig                    |   2 +-
>  configs/Chuwi_V7_CW0825_defconfig             |   2 +-
>  configs/Cubieboard_defconfig                  |   2 +-
>  configs/Empire_electronix_d709_defconfig      |   2 +-
>  configs/Empire_electronix_m712_defconfig      |   2 +-
>  configs/Hyundai_A7HD_defconfig                |   2 +-
>  configs/Linksprite_pcDuino_defconfig          |   2 +-
>  configs/Marsboard_A10_defconfig               |   2 +-
>  configs/Mele_A1000_defconfig                  |   2 +-
>  configs/Mini-X_defconfig                      |   2 +-
>  configs/UTOO_P66_defconfig                    |   2 +-
>  configs/Wobo_i5_defconfig                     |   2 +-
>  configs/ba10_tv_box_defconfig                 |   2 +-
>  configs/difrnce_dit4350_defconfig             |   2 +-
>  configs/dserve_dsrv9703c_defconfig            |   2 +-
>  configs/iNet_3F_defconfig                     |   1 +
>  configs/iNet_3W_defconfig                     |   1 +
>  configs/iNet_86VS_defconfig                   |   1 +
>  configs/inet1_defconfig                       |   2 +-
>  configs/inet97fv2_defconfig                   |   2 +-
>  configs/inet98v_rev2_defconfig                |   2 +-
>  configs/inet9f_rev03_defconfig                |   2 +-
>  configs/jesurun_q5_defconfig                  |   2 +-
>  configs/lctech_pi_f1c200s_defconfig           |   2 +-
>  configs/licheepi_nano_defconfig               |   2 +-
>  configs/mk802_a10s_defconfig                  |   2 +-
>  configs/mk802_defconfig                       |   2 +-
>  configs/mk802ii_defconfig                     |   2 +-
>  configs/pov_protab2_ips9_defconfig            |   2 +-
>  configs/q8_a13_tablet_defconfig               |   2 +-
>  configs/r7-tv-dongle_defconfig                |   2 +-
>  configs/sunxi_Gemei_G9_defconfig              |   2 +-
>  93 files changed, 45 insertions(+), 8832 deletions(-)
>  delete mode 100644 arch/arm/dts/sun4i-a10-a1000.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-ba10-tvbox.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-chuwi-v7-cw0825.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-cubieboard.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-dserve-dsrv9703c.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-gemei-g9.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-hackberry.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-hyundai-a7hd.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-inet1.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-inet97fv2.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-inet9f-rev03.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-itead-iteaduino-plus.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-jesurun-q5.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-marsboard.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-mini-xplus.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-mk802.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-mk802ii.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-olinuxino-lime.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-pcduino.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-pcduino2.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-pov-protab2-ips9.dts
>  delete mode 100644 arch/arm/dts/sun4i-a10-topwise-a721.dts
>  delete mode 100644 arch/arm/dts/sun5i-a10s-auxtek-t003.dts
>  delete mode 100644 arch/arm/dts/sun5i-a10s-auxtek-t004.dts
>  delete mode 100644 arch/arm/dts/sun5i-a10s-mk802.dts
>  delete mode 100644 arch/arm/dts/sun5i-a10s-olinuxino-micro.dts
>  delete mode 100644 arch/arm/dts/sun5i-a10s-r7-tv-dongle.dts
>  delete mode 100644 arch/arm/dts/sun5i-a10s-wobo-i5.dts
>  delete mode 100644 arch/arm/dts/sun5i-a10s.dtsi
>  delete mode 100644 arch/arm/dts/sun5i-a13-difrnce-dit4350.dts
>  delete mode 100644 arch/arm/dts/sun5i-a13-empire-electronix-d709.dts
>  delete mode 100644 arch/arm/dts/sun5i-a13-empire-electronix-m712.dts
>  delete mode 100644 arch/arm/dts/sun5i-a13-hsg-h702.dts
>  delete mode 100644 arch/arm/dts/sun5i-a13-inet-98v-rev2.dts
>  delete mode 100644 arch/arm/dts/sun5i-a13-licheepi-one.dts
>  delete mode 100644 arch/arm/dts/sun5i-a13-olinuxino-micro.dts
>  delete mode 100644 arch/arm/dts/sun5i-a13-olinuxino.dts
>  delete mode 100644 arch/arm/dts/sun5i-a13-pocketbook-touch-lux-3.dts
>  delete mode 100644 arch/arm/dts/sun5i-a13-q8-tablet.dts
>  delete mode 100644 arch/arm/dts/sun5i-a13-utoo-p66.dts
>  delete mode 100644 arch/arm/dts/sun5i-a13.dtsi
>  delete mode 100644 arch/arm/dts/sun5i-gr8-chip-pro.dts
>  delete mode 100644 arch/arm/dts/sun5i-gr8-evb.dts
>  delete mode 100644 arch/arm/dts/sun5i-gr8.dtsi
>  delete mode 100644 arch/arm/dts/sun5i-r8-chip.dts
>  delete mode 100644 arch/arm/dts/sun5i-r8.dtsi
>  delete mode 100644 arch/arm/dts/sun5i-reference-design-tablet.dtsi
>  delete mode 100644 arch/arm/dts/suniv-f1c100s-licheepi-nano.dts
>  delete mode 100644 arch/arm/dts/suniv-f1c100s.dtsi
>  delete mode 100644 arch/arm/dts/suniv-f1c200s-lctech-pi.dts
>  delete mode 100644 arch/arm/dts/suniv-f1c200s-popstick-v1.1.dts
>=20
>=20




