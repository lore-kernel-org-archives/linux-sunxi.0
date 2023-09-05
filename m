Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3EFDDD2
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Sep 2023 20:47:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 524A511FB;
	Tue,  5 Sep 2023 13:48:22 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 446B13F64C;
	Tue,  5 Sep 2023 13:47:43 -0700 (PDT)
Date: Tue, 5 Sep 2023 21:46:42 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Shengyu Qu
 <wiagn233@outlook.com>, Martin Botka <martin.botka1@gmail.com>, Matthew
 Croughan <matthew.croughan@nix.how>
Subject: Re: [PATCH v2] mfd: axp20x: Generalise handling without interrupt
Message-ID: <20230905214642.1127f7cf@slackpad.lan>
In-Reply-To: <22003475.EfDdHjke4D@archlinux>
References: <20230828213229.20332-1-andre.przywara@arm.com>
	<22003475.EfDdHjke4D@archlinux>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 05 Sep 2023 22:28:10 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

> On Monday, August 28, 2023 11:32:29 PM CEST Andre Przywara wrote:
> > At the moment we allow the AXP15060 and the AXP806 PMICs to omit the
> > interrupt line to the SoC, and we skip registering the PEK (power key)
> > driver in this case, since that crashes when no IRQ is described in the
> > DT node.
> > The IRQ pin potentially not being connected to anything does affect more
> > PMICs, though, and the PEK driver is not the only one requiring an
> > interrupt: at least the AC power supply driver crashes in a similar
> > fashion.
> >=20
> > Generalise the handling of AXP MFD devices when the platform tables
> > describe no interrupt, by allowing each device to specify an alternative
> > MFD list for this case. If no specific alternative is specified, we go
> > with the safe default of "just the regulators", which matches the curre=
nt
> > situation.
> >=20
> > This enables new devices using the AXP313a PMIC, but not connecting the
> > IRQ pin.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> > Changelog v2 .. v1:
> > - drop reordering approach, use separate cell lists
> >=20
> >  drivers/mfd/axp20x.c | 44 ++++++++++++++++++++++++--------------------
> >  1 file changed, 24 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> > index c03bc5cda080a..239e7f18956ae 100644
> > --- a/drivers/mfd/axp20x.c
> > +++ b/drivers/mfd/axp20x.c
> > @@ -1133,6 +1133,8 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
> >  	struct device *dev =3D axp20x->dev;
> >  	const struct acpi_device_id *acpi_id;
> >  	const struct of_device_id *of_id;
> > +	const struct mfd_cell *cells_no_irq =3D NULL;
> > +	int nr_cells_no_irq =3D 0;
> >=20
> >  	if (dev->of_node) {
> >  		of_id =3D of_match_device(dev->driver->of_match_table,  =20
> dev);
> > @@ -1207,14 +1209,15 @@ int axp20x_match_device(struct axp20x_dev *axp2=
0x)
> >  		 * if there is no interrupt line.
> >  		 */
> >  		if (of_property_read_bool(axp20x->dev->of_node,
> > -					  "x-powers,self- =20
> working-mode") &&
> > -		    axp20x->irq > 0) {
> > +					  "x-powers,self- =20
> working-mode")) {
> >  			axp20x->nr_cells =3D  =20
> ARRAY_SIZE(axp806_self_working_cells);
> >  			axp20x->cells =3D axp806_self_working_cells;
> >  		} else {
> >  			axp20x->nr_cells =3D ARRAY_SIZE(axp806_cells);
> >  			axp20x->cells =3D axp806_cells;
> >  		}
> > +		nr_cells_no_irq =3D ARRAY_SIZE(axp806_cells);
> > +		cells_no_irq =3D axp806_cells;
> >  		axp20x->regmap_cfg =3D &axp806_regmap_config;
> >  		axp20x->regmap_irq_chip =3D &axp806_regmap_irq_chip;
> >  		break;
> > @@ -1238,24 +1241,8 @@ int axp20x_match_device(struct axp20x_dev *axp20=
x)
> >  		axp20x->regmap_irq_chip =3D &axp803_regmap_irq_chip;
> >  		break;
> >  	case AXP15060_ID:
> > -		/*
> > -		 * Don't register the power key part if there is no  =20
> interrupt
> > -		 * line.
> > -		 *
> > -		 * Since most use cases of AXP PMICs are Allwinner  =20
> SOCs, board
> > -		 * designers follow Allwinner's reference design and  =20
> connects
> > -		 * IRQ line to SOC, there's no need for those variants  =20
> to deal
> > -		 * with cases that IRQ isn't connected. However,  =20
> AXP15660 is
> > -		 * used by some other vendors' SOCs that didn't connect  =20
> IRQ
> > -		 * line, we need to deal with this case.
> > -		 */
> > -		if (axp20x->irq > 0) {
> > -			axp20x->nr_cells =3D  =20
> ARRAY_SIZE(axp15060_cells);
> > -			axp20x->cells =3D axp15060_cells;
> > -		} else {
> > -			axp20x->nr_cells =3D  =20
> ARRAY_SIZE(axp_regulator_only_cells);
> > -			axp20x->cells =3D axp_regulator_only_cells;
> > -		}
> > +		axp20x->nr_cells =3D ARRAY_SIZE(axp15060_cells);
> > +		axp20x->cells =3D axp15060_cells;
> >  		axp20x->regmap_cfg =3D &axp15060_regmap_config;
> >  		axp20x->regmap_irq_chip =3D &axp15060_regmap_irq_chip;
> >  		break;
> > @@ -1263,6 +1250,23 @@ int axp20x_match_device(struct axp20x_dev *axp20=
x)
> >  		dev_err(dev, "unsupported AXP20X ID %lu\n", axp20x-
> >variant);
> >  		return -EINVAL;
> >  	}
> > +
> > +	/*
> > +	 * Use an alternative cell array when no interrupt line is  =20
> connected,
> > +	 * since IRQs are required by some drivers.
> > +	 * The default is the safe "regulator-only", as this works fine  =20
> without
> > +	 * an interrupt specified.
> > +	 */
> > +	if (axp20x->irq <=3D 0) {
> > +		if (cells_no_irq) {
> > +			axp20x->nr_cells =3D nr_cells_no_irq;
> > +			axp20x->cells =3D cells_no_irq;
> > +		} else {
> > +			axp20x->nr_cells =3D  =20
> ARRAY_SIZE(axp_regulator_only_cells);
> > +			axp20x->cells =3D axp_regulator_only_cells; =20
>=20
> axp806_cells (old value for AXP806_ID without irq) and=20
> axp_regulator_only_cells differs in id field. Is that an issue?

Yes, an annoying one, which led me to introduce the ability to let each
PMIC override this default. So the case AXP806_ID: above sets the local
variable cells_no_irq to axp806_cells, and the check above sees that it
has been changed from the NULL initialisation and uses that instead of
the default. At least that was my plan, let me know if I messed that
up somehow, or if it deserves more comments.

Cheers,
Andre

>=20
> Best regards,
> Jernej
>=20
> > +		}
> > +	}
> > +
> >  	dev_info(dev, "AXP20x variant %s found\n",
> >  		 axp20x_model_names[axp20x->variant]); =20
>=20
>=20
>=20
>=20
>=20

