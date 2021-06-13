Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BCE72
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Jun 2021 23:25:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BA686D;
	Sun, 13 Jun 2021 16:25:39 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 732593F70D;
	Sun, 13 Jun 2021 16:25:38 -0700 (PDT)
Date: Mon, 14 Jun 2021 00:25:31 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] configs: OrangePi PC2: Update defaults
Message-ID: <20210614002531.4b3f5ab9@slackpad.fritz.box>
In-Reply-To: <2418795.6bcLzA2rA2@kista>
References: <20210607174245.480188-1-jernej.skrabec@gmail.com>
	<2418795.6bcLzA2rA2@kista>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 12 Jun 2021 07:50:27 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne ponedeljek, 07. junij 2021 ob 19:42:45 CEST je Jernej Skrabec napisal=
(a):
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
> >  CONFIG_MACPWR=3D"PD6"
> >  CONFIG_SPL_SPI_SUNXI=3Dy
> > +CONFIG_SPL_I2C_SUPPORT=3Dy
> >  CONFIG_DEFAULT_DEVICE_TREE=3D"sun50i-h5-orangepi-pc2"
> >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> >  CONFIG_SUN8I_EMAC=3Dy
> > +CONFIG_SY8106A_POWER=3Dy
> > +CONFIG_SY8106A_VOUT1_VOLT=3D1100 =20
>=20
> I'm not sure if voltage regulator adjustment needs to be enabled. By defa=
ult,=20
> it's set to 1.1 V using resistor divider. However, it can be still needed=
 if=20
> board is rebooted and OS set it to lower value before reboot.

Yeah, I had a similar train of thoughts: originally I though we don't
need it, because of the resistor divider providing a good default
voltage. But indeed if we reset from a lower p-state (either by chance
or because of say the powersave governor being active), I really see the
lowest voltage (1.0V) being still set in when back in U-Boot, which
could lead to instabilities if the CPU runs at the 816 MHz we set the
PLL to.
So enabling the regulator sounds indicated, as we set the CPU frequency
as well. This is especially critical when the OS doesn't use DVFS.

Because of this I am inclined to take the regulator part now.

For the ODT change, I will queue this for the next release.

Thanks,
Andre.

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
> >  =20
>=20
>=20
>=20

