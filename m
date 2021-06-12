Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C630770
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Jun 2021 06:08:53 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 3-20020a05600c0243b029019f2f9b2b8aso9800696wmj.2
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Jun 2021 23:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1vmdsYEJnV2dwFRv8/7NMetUbLM3wiBW4E9pNtsShEw=;
        b=gWzuy3c+goU7ROuFazIyvhdHxyoLudVnOSQMFr0tEoTu1CbaoD+fY+m1t18QYyHaL3
         viUaEtGWpvFYyn/5n7AOf6TTQ8hlBYzB0A830ZlKk98nqOEIRv6nbKkdeFFxJ29Pt4Cb
         NeR8kWmkX26eCzr8nb6fdHmSzwjCc6yWn63L4BOcaawivWQrLdIAomlK9ndbYmkvAZwW
         BPtZhbMfN+0iMGGMG8ay/pg9X3l8HxfDErRV6GNcxJj+Bl5TR+uWDf85IOqgFGV5GV7i
         BksPHhoI5tc0XucmperEMq0rBLJ2Rsi9YGZScF1eY+TsDvBb/8iIo1MC5jQH83j4HmRU
         0isA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1vmdsYEJnV2dwFRv8/7NMetUbLM3wiBW4E9pNtsShEw=;
        b=aIDXr5h0Q9bC5M/aIuEiAIX7Vj7p9CpENbj2MMyGUBz2cg9KnT7dOMWqL8IvORmAPG
         jKLWiSTG0EaPMP8r6lYIygtkZf6SbrQ0lu5GSZqfhsmSRgAN/oxaLeMilA10YeK6zHre
         qjqTcJ1m/4SQNsPSfcljqkx/BiVt1/b0eF9XxO5hIxET35vFWqeRHUj8jWqFfFOSASLs
         UDTzUYxIp3FmoJ84D5rOdh7ncZcgiI5BMGDPM3T6KROh13iAkm20RUm5uAK/8Wtstg36
         j2V5f3p2ze8C0UgXdPu0mMQZhNtUbeBnO9Uysk/UGtp7QL+oHueCpIWmWVIcWsaCHyFH
         5qxw==
X-Gm-Message-State: AOAM5327UGfMsXQB113OLEkceRvUJPSRUIp5i1GBU1QcEWzc0I/8XTXm
	iF/p8M505TPZpfloIPQr0Cg=
X-Google-Smtp-Source: ABdhPJwN/xYvEjqKsF3tPmxUi1ufWUDif6DUNTeMK2DLIICbfGDZeNjVYRLQs1f/FKmR1CFxsjeiBw==
X-Received: by 2002:a1c:9804:: with SMTP id a4mr7130822wme.34.1623478132283;
        Fri, 11 Jun 2021 23:08:52 -0700 (PDT)
Received: from kista.localnet (cpe1-4-249.cable.triera.net. [213.161.4.249])
        by smtp.gmail.com with ESMTPSA id h15sm9229125wrq.88.2021.06.11.23.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 23:08:51 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com
Cc: jagan@amarulasolutions.com, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH] configs: OrangePi PC2: Update defaults
Date: Sat, 12 Jun 2021 08:08:51 +0200
Message-ID: <9487261.lNKWQbxSyI@kista>
In-Reply-To: <2418795.6bcLzA2rA2@kista>
References: <20210607174245.480188-1-jernej.skrabec@gmail.com> <2418795.6bcLzA2rA2@kista>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne sobota, 12. junij 2021 ob 07:50:27 CEST je Jernej =C5=A0krabec napisal(=
a):
> Dne ponedeljek, 07. junij 2021 ob 19:42:45 CEST je Jernej Skrabec=20
napisal(a):
> > OrangePi PC2 board has DRAM with ODT, so enable it. ZQ value is also
> > slightly different in vendor images, so update it as well. H5 SoC is
> > also connected to voltage regulator. It's default value is pretty low,
> > so in order to avoid instability, enable driver for it and set it to
> > appropriate voltage.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  configs/orangepi_pc2_defconfig | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defc=
onfig
> > index f72ffe27b26c..5e4cca793f53 100644
> > --- a/configs/orangepi_pc2_defconfig
> > +++ b/configs/orangepi_pc2_defconfig
> > @@ -3,13 +3,15 @@ CONFIG_ARCH_SUNXI=3Dy
> >  CONFIG_SPL=3Dy
> >  CONFIG_MACH_SUN50I_H5=3Dy
> >  CONFIG_DRAM_CLK=3D672
> > -CONFIG_DRAM_ZQ=3D3881977
> > -# CONFIG_DRAM_ODT_EN is not set
> > +CONFIG_DRAM_ZQ=3D4145117

I re-checked BSP DT and original ZQ value is correct. So this patch should=
=20
only enable ODT, which is really enabled in BSP and DRAM ICs support it.

Best regards,
Jernej

> >  CONFIG_MACPWR=3D"PD6"
> >  CONFIG_SPL_SPI_SUNXI=3Dy
> > +CONFIG_SPL_I2C_SUPPORT=3Dy
> >  CONFIG_DEFAULT_DEVICE_TREE=3D"sun50i-h5-orangepi-pc2"
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SUN8I_EMAC=3Dy
> > +CONFIG_SY8106A_POWER=3Dy
> > +CONFIG_SY8106A_VOUT1_VOLT=3D1100
>=20
> I'm not sure if voltage regulator adjustment needs to be enabled. By=20
default,=20
> it's set to 1.1 V using resistor divider. However, it can be still needed=
 if=20
> board is rebooted and OS set it to lower value before reboot.
>=20
> Best regards,
> Jernej
>=20
> >  CONFIG_USB_EHCI_HCD=3Dy
> >  CONFIG_USB_OHCI_HCD=3Dy
> >  CONFIG_USB_MUSB_GADGET=3Dy
> > --=20
> > 2.31.1
> >=20
> >=20
>=20
>=20
>=20


