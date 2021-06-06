Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697AB70
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Jun 2021 16:18:33 +0000 (UTC)
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MKKdD-1m4zE02lyR-00Lo5m for <linux-sunxi@lists.linux.dev>; Sun, 06 Jun 2021
 18:18:31 +0200
Received: by mail-wr1-f41.google.com with SMTP id i94so9552965wri.4
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Jun 2021 09:18:31 -0700 (PDT)
X-Gm-Message-State: AOAM532mH38xkYpAZSmiDwhoKKB35h8HDbCRUmELuy+fIuaHsPG8xf6a
	h+CI0SOx4VC3vJHn28WPjhs/XQQmmqVMqAsmytg=
X-Google-Smtp-Source: ABdhPJx9dKNalsIrm0Lf+lcVcT23HpzJ96dWZFvRiQpmmC6lCKzyeQIjKu301k2n374UAlf86nYIV+I5I0wPvzdJTug=
X-Received: by 2002:a5d:5084:: with SMTP id a4mr13649030wrt.286.1622996311239;
 Sun, 06 Jun 2021 09:18:31 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org> <1622970249-50770-15-git-send-email-guoren@kernel.org>
In-Reply-To: <1622970249-50770-15-git-send-email-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 6 Jun 2021 18:16:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0yHEGH8=o_TQ+ajRn53j+mHxYxqyYLPXnUe=YWkTHDBw@mail.gmail.com>
Message-ID: <CAK8P3a0yHEGH8=o_TQ+ajRn53j+mHxYxqyYLPXnUe=YWkTHDBw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/11] riscv: soc: Allwinner D1 GMAC driver only
 for temp use
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
	Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>, Drew Fustini <drew@beagleboard.org>, 
	liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
	Corentin Labbe <clabbe@baylibre.com>, Samuel Holland <samuel@sholland.org>, 
	Icenowy Zheng <icenowy@aosc.io>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	Michael Walle <michael@walle.cc>, Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:66G9BBHOFxbIJ5kQNGF9WWONFXvVbICsLDDXn9GZ3IyWuGiBMb9
 X20wTkhfRsrrZziCPX30SQtb105wxiDHyig6bC1ERYesuAqTtwY2yyM+YwiFfuiUfpqBLSC
 ZZHROoUWBNAPzSzswpibq/muPKHYkoUOdSjTz4bCqVSEqTMloDolkUUaIHOR9rkUc7CCAXz
 RVazbXYyUORHJxRKolq4w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:N95D26Oy3UY=:A6XZ1pzw+6JQxThnjHOjqJ
 ysmSNQY9GQh54yAJRWrTl2VHcUHYURUwrH9WtZb1JAGE+Tn99Px2fE2PnuFYCjZoIv+nAQ/Lq
 kWGUuwYi2gHAzFBnn2IrhNA6K/uMxdbfrw/iFXhTfHA3x954YPC87KiHMonCjH2atSSsNCx+c
 JbOzToel6iMtwiRDnBz2GezbVg6T39KpxCCuYaY40RulGyMcMqs8EfPXErRwdoXH8I881MNaC
 gcti4CXC9zHhHN13ZTVob2i14YFqaXuTWoWLEeaXGNOUZRucc4zbnouL0iIC6pcyDoCMYRiIA
 xq1uZbFm0TVuDCclQGwO5Pig+iN4e2xRcFsIyFKHEumjdUegwTnlwXgZtqangURLsl/XlENwK
 v/8c1qGf01It5czMR6HHQyVwUjBuccC4QS10Poa0SJ08kgOM2LovBU+x2xoG/1SPpa7SU16AN
 010mbJAG4ZE8ISbVRIbtPyVc+OjeUPaMKfspP72uSMTThkkZXIJcB3vCOSuk+NhKL2AIrwszT
 qz2521Ko1LHqAVItL6u26M765AjX+z6u7D8gl3YHRPgn0FVWoqWZFDvCoCRbs+Uf2Fy8AmgNT
 SaE8Umod/e8tZF/Ag3mO6eKDfxazYFhF1RG3kyYeTpOMh3IPqr3rlmTPL2DidjoPU2iqVi8hf
 BMmneSC+VB1QT63HeYYaykT9w8lCZdF63qPuQRv52GYlYWQ==

On Sun, Jun 6, 2021 at 11:04 AM <guoren@kernel.org> wrote:

> diff --git a/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts b/a=
rch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> index cd9f7c9..31b681d 100644
> --- a/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> +++ b/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> @@ -11,7 +11,7 @@
>         compatible =3D "allwinner,d1-nezha-kit";
>
>         chosen {
> -               bootargs =3D "console=3DttyS0,115200";
> +               bootargs =3D "console=3DttyS0,115200 rootwait init=3D/sbi=
n/init root=3D/dev/nfs rw nfsroot=3D192.168.101.200:/tmp/rootfs_nfs,v3,tcp,=
nolock ip=3D192.168.101.23";

These are not board specific options, they should be set by the bootloader
according to the network environment. It clearly doens't belong
into this patch .

>                 stdout-path =3D &serial0;
>         };
>
> diff --git a/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi b/arch/riscv=
/boot/dts/allwinner/allwinner-d1.dtsi
> index 11cd938..d317e19 100644
> --- a/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> @@ -80,5 +80,21 @@
>                         clocks =3D <&dummy_apb>;
>                         status =3D "disabled";
>                 };
> +
> +               eth@4500000 {
> +                       compatible =3D "allwinner,sunxi-gmac";
> +                       reg =3D <0x00 0x4500000 0x00 0x10000 0x00 0x30000=
30 0x00 0x04>;
> +                       interrupts-extended =3D <&plic 0x3e 0x04>;
> +                       interrupt-names =3D "gmacirq";
> +                       device_type =3D "gmac0";
> +                       phy-mode =3D "rgmii";
> +                       use_ephy25m =3D <0x01>;
> +                       tx-delay =3D <0x03>;
> +                       rx-delay =3D <0x03>;
> +                       gmac-power0;
> +                       gmac-power1;
> +                       gmac-power2;
> +                       status =3D "okay";
> +               };

Before you add this in the dts file, the properties need to be documented i=
n
the binding file. The "allwinner,sunxi-gmac" identifier does not appear to
be specific enough here, and the properties don't match what dwmac uses,
which would make it unnecessarily hard to change to the other driver
later on without breaking compatibility to old dtb files.

> +++ b/drivers/net/ethernet/allwinnertmp/sunxi-gmac-ops.c
> @@ -0,0 +1,690 @@
> +/*
> + * linux/drivers/net/ethernet/allwinner/sunxi_gmac_ops.c
> + *
> + * Copyright =C2=A9 2016-2018, fuzhaoke
> + *             Author: fuzhaoke <fuzhaoke@allwinnertech.com>
> + *
> + * This file is provided under a dual BSD/GPL license.  When using or
> + * redistributing this file, you may do so under either license.

Are you sure this is the correct copyright information and "fuzhaoke" is
the copyright holder for this file? If this is derived from either the
designware
code or the Linux stmmac driver, the authors should be mentioned,
and the license be compatible with the original license terms.

Andre already commented on the driver quality and code duplication, those a=
re
also show-stoppers, but the unclear license terms and dt binding compatibil=
ity
are even stronger reasons to not get anywhere close to this driver.

        Arnd
