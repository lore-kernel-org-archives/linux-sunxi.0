Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AC6437E
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Mar 2022 09:38:56 +0000 (UTC)
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N4Qbu-1o82Om1p0Y-011Qnd for <linux-sunxi@lists.linux.dev>; Tue, 08 Mar 2022
 10:38:54 +0100
Received: by mail-wr1-f52.google.com with SMTP id h15so3133665wrc.6
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Mar 2022 01:38:54 -0800 (PST)
X-Gm-Message-State: AOAM5334K92TyDqb+hV04sQTVgGswrsPb3pIGaAdRE/3OHy5HLVYRR9h
	3FbbLp/QgiqCDmMPtey7I6wfawPWBGa28MXkn6I=
X-Google-Smtp-Source: ABdhPJxo54mRJkzudcax91VzsIifg7BnKSlOiViFsWSbWLDpZO+Tik8hGd0ehAFU2LrwrU2FCNCuGn556SDuP8dgAl4=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr11499158wri.219.1646732333821; Tue, 08
 Mar 2022 01:38:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220307143421.1106209-1-andre.przywara@arm.com> <20220307143421.1106209-14-andre.przywara@arm.com>
In-Reply-To: <20220307143421.1106209-14-andre.przywara@arm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 8 Mar 2022 10:38:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1FxfZj0=T=cvLNfagP+c_d+SEYYuV30+-UTU+B+HVXmQ@mail.gmail.com>
Message-ID: <CAK8P3a1FxfZj0=T=cvLNfagP+c_d+SEYYuV30+-UTU+B+HVXmQ@mail.gmail.com>
Subject: Re: [PATCH 13/14] ARM: configs: sync multi_v5_defconfig from savedefconfig
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh+dt@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, 
	Icenowy Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	George Hilliard <thirtythreeforty@gmail.com>, DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:QEYDVK0NTykh4TtqVG1D+WdjmmBqXOpMi4tQA7tvyAGnxlEtYvU
 PhjYh+H/wsquHnuF3TiwFrxz6Dd2QyWYEDbT7n5R1fUKEsk+hy71DWkpih+yHDPaG9FmyJu
 L/6wD58emFq6er5Fx1O7+0zdfDc8zA+7LyA6bezaYIVlpnZ8BB70pcUshk6xWaiHZ2tkAE8
 s7WzVxyKYbWlvE2Rkw3Pg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rAu3iZtGp9M=:cd3Tps/7Df2P1pUb/sJ2zI
 ilYhlyjmD4swJjMwGvHoPW1183qAPsaAblQyKTwSJ/XXx8fkH2BAO8opLvJ5x38gFH4vnzhdr
 nDnLK6fdABxFsJn274yE3SibCPbEsgwE/g6sbt/0sjrY5ZrHxYc4XY5yy9wGqHt1+hiJgT6Su
 tJVDyA8hzSbxmlZ6sLO2adRHtYXblCjS5+LkYoAtBpJaz3kyPMV4Pmdbg2Pz/QV50b34UuLWX
 xBPgJZ+yet/Y6JihFbEiFhdAKDGi5M715NMEqeXV+NouWxV/vmfy3aSzDp0ZhoRijD8eURhNa
 oOQ22dAloZhx+0INW6dNKWVMnvkmjdxoB53+GXdNo3kCb+V0SUbwpo56HBz30+7Eti5VRu692
 iuGIEJpO6hS6up91UezN3sJ07JVKMFjIrqz5udgF8PLvB8WMqRniz3A9hAXtG16DO7dUuKS+b
 xLwSfy5vixHE1wtXK1IGGkq9Jgbl7zk0l23ULvxu+PJi04NSbOumey9Ww5mI8lC6i9h+w2DUi
 rUSk6u9l6bR3z9MTusOCgU/FPPl0bvEPAGdU+GKNehwUHptq9Hx7XIhYxORYtT+siwEenOyLq
 V3e+UeBfEScQUpff+CuntQm/EYRv0mOMStjJKu6WiNN7MO/98JqvgGByDYcu5RQ8XvBmD8JXU
 sonSY5RyFFpXH6mSuYhW7I+SsZzjWkHEfxBXnUObO5ul4aojI6jnO30sKc/fFkosr5KDMV5Ug
 2yTvrgwZpaIMIrML/xmK5XnSv5590yP44JaJPT2T3DalIUsg7dFgy/jzbCivMEYQes/+X6VeP
 SsIhFhwJ2fdQSlspiYdnbGNVZOvmcUOxgMiG2PQRhlvQpc4BSU=

On Mon, Mar 7, 2022 at 3:34 PM Andre Przywara <andre.przywara@arm.com> wrote:
>
> Some Kconfig options have changed, some other platforms have been
> removed.

Please split this up into logical chunks: list the platforms that were removed
and remove only the lines corresponding to those platforms in one patch,
do functional changes in separate patches each with a reason for doing them,
and cleanups (moving lines to match the savedefconfig output, removing lines
that are now the default) in one final patch.

>  CONFIG_AEABI=y
>  CONFIG_HIGHMEM=y
> -CONFIG_ZBOOT_ROM_TEXT=0x0
> -CONFIG_ZBOOT_ROM_BSS=0x0
>  CONFIG_ARM_APPENDED_DTB=y
>  CONFIG_ARM_ATAG_DTB_COMPAT=y
>  CONFIG_CPU_FREQ=y

These were not removed, what happened here is that 'savedefconfig'
no longer produces the lines because they now match the defaults.

> @@ -159,7 +151,6 @@ CONFIG_I2C_ASPEED=m
>  CONFIG_I2C_AT91=y
>  CONFIG_I2C_IMX=y
>  CONFIG_I2C_MV64XXX=y
> -CONFIG_I2C_NOMADIK=y
>  CONFIG_SPI=y
>  CONFIG_SPI_ATMEL=y
>  CONFIG_SPI_IMX=y

This one is still there. Not sure why it's no longer enabled.

>  CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_MEDIA_SUPPORT=y
>  CONFIG_MEDIA_CAMERA_SUPPORT=y
> -CONFIG_V4L_PLATFORM_DRIVERS=y
> -CONFIG_VIDEO_ASPEED=m
> -CONFIG_VIDEO_ATMEL_ISI=m
>  CONFIG_DRM=y
>  CONFIG_DRM_ATMEL_HLCDC=m
> -CONFIG_DRM_PANEL_SIMPLE=y
> -CONFIG_DRM_PANEL_EDP=y
>  CONFIG_DRM_ASPEED_GFX=m
> -CONFIG_FB_IMX=y
> -CONFIG_FB_ATMEL=y
> -CONFIG_BACKLIGHT_ATMEL_LCDC=y

This doesn't look right at all. If you want to disable graphics support,
please do that in a separate patch and explain why we can't have those
any more. Are you running into problems with the vmlinux size?

>  CONFIG_LIBCRC32C=y
>  CONFIG_DEBUG_INFO=y
> -CONFIG_DEBUG_FS=y
>  CONFIG_MAGIC_SYSRQ=y
> +CONFIG_DEBUG_FS=y
>  CONFIG_DEBUG_KERNEL=y
>  # CONFIG_SCHED_DEBUG is not set
>  # CONFIG_DEBUG_PREEMPT is not set

This should probably go along with the ZBOOT_ROM change, it's
only cosmetic.

        Arnd
