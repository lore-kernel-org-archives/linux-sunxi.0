Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B9233D1
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Mar 2022 11:40:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1228C1042;
	Mon, 21 Mar 2022 04:40:47 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81A8A3F66F;
	Mon, 21 Mar 2022 04:40:45 -0700 (PDT)
Date: Mon, 21 Mar 2022 11:39:58 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Petr =?UTF-8?B?xaB0ZXRpYXI=?= <ynezz@true.cz>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy
 Zheng <icenowy@aosc.io>, Jesse Taube <mr.bossman075@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: A20-OLinuXino-LIME2 network regression [Was: [PATCH v2 1/5]
 sunxi: move non-essential code out of s_init()]
Message-ID: <20220321113958.7e32066d@slackpad.lan>
In-Reply-To: <20220320221031.GA20535@meh.true.cz>
References: <20220201014116.25864-1-andre.przywara@arm.com>
	<20220201014116.25864-2-andre.przywara@arm.com>
	<20220320221031.GA20535@meh.true.cz>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 20 Mar 2022 23:10:31 +0100
Petr =C5=A0tetiar <ynezz@true.cz> wrote:

Hi Petr,

> Andre Przywara <andre.przywara@arm.com> [2022-02-01 01:41:12]:
>=20
> > Since we have an SPL, which is called right after s_init(), move those
> > calls to our board_init_f() function. As we overwrite this only for
> > the SPL, this has the added benefit of not doing this setup *again*
> > shortly afterwards, when running U-Boot proper. =20
>=20
> something didn't went as expected, since this commit has broken ethernet =
on my
> A20-OLinuXino-LIME2:

Thanks for the report, much appreciated! And yes, there is a
regression, I figured this myself already the other week. I sent
https://lore.kernel.org/u-boot/20220316005443.16260-1-andre.przywara@arm.co=
m/

Can you check whether this fixes it for you? Then reply with a
Tested-by:? I will then send the PR in the next days, so that 2022.04
should be fine.

Thanks!
Andre

>=20
>  U-Boot SPL 2022.04-rc4-00052-g2a243d9bd62f (Mar 20 2022 - 22:57:07 +0100)
>  DRAM: 1024 MiB
>  CPU: 912000000Hz, AXI/AHB/APB: 3/2/2
>  Trying to boot from FEL
>=20
>=20
>  U-Boot 2022.04-rc4-00052-g2a243d9bd62f (Mar 20 2022 - 22:57:07 +0100) Al=
lwinner Technology
>=20
>  CPU:   Allwinner A20 (SUN7I)
>  Model: Olimex A20-OLinuXino-LIME2-eMMC
>  DRAM:  1 GiB
>  Core:  38 devices, 19 uclasses, devicetree: separate
>  WDT:   Not starting watchdog@1c20c90
>  MMC:   mmc@1c0f000: 0, mmc@1c11000: 1
>  Loading Environment from FAT... Unable to read "uboot.env" from mmc0:1...
>  Unknown monitor
>  Unknown monitor
>  In:    serial
>  Out:   serial
>  Err:   serial
>  Allwinner mUSB OTG (Peripheral)
>  Net:   Could not get PHY for ethernet@1c50000: addr 1
>=20
> Reverting this commit fixes it:
>=20
>  Net:   eth0: ethernet@1c50000, eth1: usb_ether
>=20
> Cheers,
>=20
> Petr

