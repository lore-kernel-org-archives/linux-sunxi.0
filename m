Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D772F9FE
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jan 2025 06:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737527620; cv=none; b=ftRMeL+NfPgkS92a0gMW500MZsqGSlQ1XBh8hUJlIIUUX0TFbrB+D8PlZCS5rG/tGFO7QNfXUwoGBvaLuxozFfUmRx9mHf87BhBOI2HTWe9HDG/6zaod0FPH0QDhoHDCJaRW3AWSTSKxSvEUTSyGVuHhzPjq9Q2QtTTTY3gWpMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737527620; c=relaxed/simple;
	bh=WZP3afLZxbvfIVaUGFnp9EexdzwFpaGLTlFjdLJzHSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEF7UttHZeFhx1txElhueisA9w+r9tNOyC4HCnXBrh1czhimvleMhj1oM6D2UHBYeYucHCzQRe8nGZ0HAnBVUy98anPAfue3lzxxRj06xQOpQGj5ffm7GnwKdkttvPayeE2RVxM9lAtcJUOF5vjUcMJEVsVdOjAN2+4ZVmYdoN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gUxg3vLN; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gUxg3vLN"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85bad9e0214so2956719241.3
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Jan 2025 22:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737527616; x=1738132416; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hN3le1Uh02Ww1MPOkKJLbs/Fn+sO3rMP8blM5lmHJ8Q=;
        b=gUxg3vLNYFi2mT/4A/f4F2yKFvapMNsNCsIYNhF9s5s3JTsEQbS0mhw0ClZzAt7rQl
         1wqElyBmE6CeggtGkJIJ5xz+D0vYp7SKd6l5gBYZaYmVqVQeYPd8loqlfdWx/eYipW/s
         13SA+onf612BRlOb2y+T0BJRvhD3Qr47Q5rSdji3sPh9CZMe0eI7hfN5RoACOUyPjsvD
         zHjoSmGsieMnL+VtE9PzsC+TCWZEzjuSspwCkqzvgXiAtLelKDdp9MAMZ6QbBV24KV0+
         ISeyaVd0UcSru4l+QmWLJWFumnIWEx9oUNJ+uuTSW5hp47xIrJYKeAbhSjbTiIf9BrBi
         yw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737527616; x=1738132416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hN3le1Uh02Ww1MPOkKJLbs/Fn+sO3rMP8blM5lmHJ8Q=;
        b=JZJwN+S5gEMiQKdiaXFpyBFJZkK5g7JHkcj666rIOAx0pdVT+m4mON/wTv7TiMU+IW
         b8UVtz50GKS89xuDm1PfStg/oCetw8ViCuBKq+3/JdCV7cV4jie3EkUF7Avp9u8noYZ5
         4oVClXo7zJZG+HCdXzTkuiLimr7H/CBFAH8gSkrXnBCyz5lG0RYYMquMmAIvF9+7+8nW
         UWvpdK54UHrg4UslAQtVZJFvdyt8UDnjy6PtFWxj80Kd+iP4NTnCv0Gbnlr38gkZhW+E
         BfU3YWqKnVW8vGD61Gq0ZtKF51YBpHdSaQrknozemxVf4XJJJGwkiD4YcHccHqZuLJpl
         T+rA==
X-Forwarded-Encrypted: i=1; AJvYcCXGVBOL0AzS1HXAfNJ3IhRsVNRUY0Tz+JuakDeSVcj7m5r/iVX/6tXXlhSQhvVeyfwRWmUWUozFcMUlsA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyah3vqbHYAiF/WWKrRXG74Y3Ki4mBVRoybKCl28+kE5KJHvbxY
	+R5JUMADzN45AYlJTAXIRx71bOrGzwkiVuBk2pfdkv8zUADHaqKsFo4uU86W+UqroVDI5htExVX
	NiTNN/LMiuK7AMifWkTjEg7g38QRnudmfMSBTeg==
X-Gm-Gg: ASbGncu72vGQTNEwa0nhv/+5IV+XCvCH7aAaJN8nNkSlmJeVQ9lnkzwi4qINoO/s6qp
	zXF0XKpXdriARqMWyH3ZQPI5i7VOXBmp855W948CxIQ11oy9kE/vYVw==
X-Google-Smtp-Source: AGHT+IEr3SG4rv4YBgQv13mMWQWvWSkDJTEC+zP4qRLjaY62XigyNMPI0c6ME3YOvOvhTrLx2eDt05cistl14q4cg0A=
X-Received: by 2002:a05:6102:1627:b0:4b4:e7e7:56cc with SMTP id
 ada2fe7eead31-4b69099c6c7mr15943265137.0.1737527615835; Tue, 21 Jan 2025
 22:33:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250119164157.23648-1-andre.przywara@arm.com>
In-Reply-To: <20250119164157.23648-1-andre.przywara@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 22 Jan 2025 12:03:24 +0530
X-Gm-Features: AWEUYZmrH1_m21E94ADwNkStaor4Go5F_sVqi0nbnL_eLLDf574IXAgwGu4ci8w
Message-ID: <CAFA6WYNAW_KTK5Evs0e_d0c3g4uDOVOZ6dbeF0LhVhX3tUrZDw@mail.gmail.com>
Subject: Re: [PATCH 0/3] sunxi: switch three SoC families to OF_UPSTREAM
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, 
	Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

On Sun, 19 Jan 2025 at 22:13, Andre Przywara <andre.przywara@arm.com> wrote:
>
> This series converts boards with the Allwinner F1C100s/F1C200s, A10, A10s
> and A13s SoCs over to OF_UPSTREAM. The .dts and .dtsi files were
> identical between the kernel and U-Boot repository, so this is a
> no-brainer.

Glad to see this series especially the diffstat.

> However there are four boards (tablets, I guess) that do not have a .dts

Can you share the board names you refer to here?

> file in the kernel repository. For now I kept them using the "old
> style", so they continue working. This requires to keep a copy of the
> SoC .dtsi file,

Is the SoC .dtsi file present in dts/upstream? If yes then it is
better to not maintain a local copy for them as the local .dts board
files are able to include SoC .dtsi file from dts/upstream directory
too.

> I would be grateful for any advice as how to handle this
> situation best. Ideally we would submit the DTs to the kernel, but I
> don't know how feasible this is, given their age, the missing device
> availability and their basic DT nature.

Lets have only local board .dts files for them including other
dependencies from dts/upstream tree. This will at least give folks who
care about these boards a chance to uprev the corresponding DTs.

-Sumit

>
> I compiled all boards with and without this series applied: the
> resulting u-boot.dtb files were always identical.
>
> Please have a look!
>
> Cheers,
> Andre
>
> Andre Przywara (3):
>   suniv: switch Allwinner F1Cx00 boards to OF_UPSTREAM
>   sunxi: switch Allwinner A10 boards to OF_UPSTREAM
>   sunxi: switch Allwinner A10s/A13 boards to OF_UPSTREAM
>
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
>
> --
> 2.46.2
>
