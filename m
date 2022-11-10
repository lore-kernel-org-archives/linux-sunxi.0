Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2516185E
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Nov 2022 12:07:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D71F1FB;
	Thu, 10 Nov 2022 04:07:31 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EC553F534;
	Thu, 10 Nov 2022 04:07:23 -0800 (PST)
Date: Thu, 10 Nov 2022 12:07:20 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel
 Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, Kishon Vijay
 Abraham I <kishon@ti.com>
Subject: Re: [PATCH v3 10/11] phy: sun4i-usb: Replace types with explicit
 quirk flags
Message-ID: <20221110120720.7fe272b2@donnerap.cambridge.arm.com>
In-Reply-To: <bab3f8068d3ac26fc38048d0d540261d8e94053a.camel@icenowy.me>
References: <20221106154826.6687-1-andre.przywara@arm.com>
	<20221106154826.6687-11-andre.przywara@arm.com>
	<D8382138-8943-46F7-B6A6-F83DF98E26AE@icenowy.me>
	<Y2ype6fU6nKyIH1w@matsya>
	<bab3f8068d3ac26fc38048d0d540261d8e94053a.camel@icenowy.me>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Nov 2022 19:40:58 +0800
Icenowy Zheng <uwu@icenowy.me> wrote:

Hi,

> =E5=9C=A8 2022-11-10=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 13:04 +0530=EF=
=BC=8CVinod Koul=E5=86=99=E9=81=93=EF=BC=9A
> > On 06-11-22, 23:54, Icenowy Zheng wrote: =20
> > >=20
> > >=20
> > > =E4=BA=8E 2022=E5=B9=B411=E6=9C=886=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=
=8D=8811:48:25, Andre Przywara
> > > <andre.przywara@arm.com> =E5=86=99=E5=88=B0: =20
> > > > So far we were assigning some crude "type" (SoC name, really) to
> > > > each
> > > > Allwinner USB PHY model, then guarding certain quirks based on
> > > > this.
> > > > This does not only look weird, but gets more or more cumbersome
> > > > to
> > > > maintain.
> > > >=20
> > > > Remove the bogus type names altogether, instead introduce flags
> > > > for each
> > > > quirk, and explicitly check for them.
> > > > This improves readability, and simplifies future extensions.
> > > >=20
> > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > > ---
> > > > drivers/phy/allwinner/phy-sun4i-usb.c | 50 ++++++++--------------
> > > > -----
> > > > 1 file changed, 15 insertions(+), 35 deletions(-)
> > > >=20
> > > > diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c
> > > > b/drivers/phy/allwinner/phy-sun4i-usb.c
> > > > index 51fb24c6dcb3..422129c66282 100644
> > > > --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> > > > +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> > > > @@ -99,27 +99,17 @@
> > > > #define DEBOUNCE_TIME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0msecs_=
to_jiffies(50)
> > > > #define POLL_TIME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0msecs_to_jiffies(250)
> > > >=20
> > > > -enum sun4i_usb_phy_type {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun4i_a10_phy,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun6i_a31_phy,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun8i_a33_phy,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun8i_a83t_phy,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun8i_h3_phy,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun8i_r40_phy,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun8i_v3s_phy,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun50i_a64_phy,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun50i_h6_phy,
> > > > -};
> > > > -
> > > > struct sun4i_usb_phy_cfg {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int num_phys;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int hsic_index;
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum sun4i_usb_phy_type =
type;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 disc_thresh;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 hci_phy_ctl_cle=
ar;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 phyctl_offset;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool dedicated_cloc=
ks;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool phy0_dual_rout=
e;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool phy2_is_hsic; =20
> > >=20
> > > Maybe use a `int hsic_phy` instead? But the problem is this
> > > practice is
> > > assuming USB0 could not be HSIC -- although USB0 is usually OTG. =20
> >=20
> > why should it be int.. dont think hsic_phy is improvement over
> > phy2_is_hsic? =20
>=20
> Yes because it may express phy1_is_hsic, etc (although this kind of
> thing hadn't happened yet).

Yeah, I tried to not interpret too much into this, instead just named it
as it is used today. I don't have any insight into the A83T PHY or in
Allwinner's plans regarding this. So far this seems like a one-off hack
that is needed for this particular PHY on this particular SoC.
It it code-internal anyway, so we can change it at any time later should
the need arise.

If people like another name better, I am of course happy to use that.

Cheers,
Andre

>=20
> >  =20
> > >  =20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool siddq_in_base;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool poll_vbusen;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int missing_phys;
> > > > };
> > > >=20
> > > > @@ -251,7 +241,7 @@ static void sun4i_usb_phy_passby(struct
> > > > sun4i_usb_phy *phy, int enable)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SUNXI_AHB_INCRX_ALIGN_EN | SUNXI_ULPI_BYPASS_=
EN;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* A83T USB2 is HSI=
C */
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (phy_data->cfg->type =
=3D=3D sun8i_a83t_phy && phy->index
> > > > =3D=3D 2)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (phy_data->cfg->phy2_=
is_hsic && phy->index =3D=3D 2)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bits |=3D SUNXI_EHCI_HS_FORCE |
> > > > SUNXI_HSIC_CONNECT_INT |
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0SUNXI_HSIC;
> > > >=20
> > > > @@ -295,8 +285,7 @@ static int sun4i_usb_phy_init(struct phy
> > > > *_phy)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(val, phy->pmu + REG_HCI_PHY_CTL);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > >=20
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (data->cfg->type =3D=
=3D sun8i_a83t_phy ||
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data-=
>cfg->type =3D=3D sun50i_h6_phy) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (data->cfg->siddq_in_=
base) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (phy->index =3D=3D 0) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0val =3D readl(data->base + data->cfg- =20
> > > > >phyctl_offset); =20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0val |=3D PHY_CTL_VBUSVLDEXT;
> > > > @@ -340,8 +329,7 @@ static int sun4i_usb_phy_exit(struct phy
> > > > *_phy)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sun4i_usb_ph=
y_data *data =3D
> > > > to_sun4i_usb_phy_data(phy);
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (phy->index =3D=
=3D 0) {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (data->cfg->type =3D=3D sun8i_a83t_phy ||
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->cfg->type =3D=3D sun50i_h6=
_phy) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (data->cfg->siddq_in_base) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0void __iomem *phyctl =3D data->base +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0data->cfg->phyctl_offset;
> > > >=20
> > > > @@ -414,9 +402,8 @@ static bool sun4i_usb_phy0_poll(struct
> > > > sun4i_usb_phy_data *data)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * vbus using the N=
_VBUSEN pin on the pmic, so we must
> > > > poll
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * when using the p=
mic for vbus-det _and_ we're driving
> > > > vbus.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((data->cfg->type =3D=
=3D sun6i_a31_phy ||
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 data->cfg->type =3D=3D sun8i_a33_phy) &&
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data-=
>vbus_power_supply && data- =20
> > > > >phys[0].regulator_on) =20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (data->cfg->poll_vbus=
en && data->vbus_power_supply &&
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data-=
>phys[0].regulator_on)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return true;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
> > > > @@ -861,7 +848,6 @@ static int sun4i_usb_phy_probe(struct
> > > > platform_device *pdev)
> > > >=20
> > > > static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 1,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun4i_a10_phy,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.disc_thresh =3D 3,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phyctl_offset =3D =
REG_PHYCTL_A10,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D true,
> > > > @@ -869,7 +855,6 @@ static const struct sun4i_usb_phy_cfg
> > > > suniv_f1c100s_cfg =3D {
> > > >=20
> > > > static const struct sun4i_usb_phy_cfg sun4i_a10_cfg =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 3,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun4i_a10_phy,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.disc_thresh =3D 3,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phyctl_offset =3D =
REG_PHYCTL_A10,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D false,
> > > > @@ -877,7 +862,6 @@ static const struct sun4i_usb_phy_cfg
> > > > sun4i_a10_cfg =3D {
> > > >=20
> > > > static const struct sun4i_usb_phy_cfg sun5i_a13_cfg =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 2,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun4i_a10_phy,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.disc_thresh =3D 2,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phyctl_offset =3D =
REG_PHYCTL_A10,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D false,
> > > > @@ -885,15 +869,14 @@ static const struct sun4i_usb_phy_cfg
> > > > sun5i_a13_cfg =3D {
> > > >=20
> > > > static const struct sun4i_usb_phy_cfg sun6i_a31_cfg =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 3,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun6i_a31_phy,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.disc_thresh =3D 3,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phyctl_offset =3D =
REG_PHYCTL_A10,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D true,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.poll_vbusen =3D true,
> > > > };
> > > >=20
> > > > static const struct sun4i_usb_phy_cfg sun7i_a20_cfg =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 3,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun4i_a10_phy,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.disc_thresh =3D 2,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phyctl_offset =3D =
REG_PHYCTL_A10,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D false,
> > > > @@ -901,31 +884,31 @@ static const struct sun4i_usb_phy_cfg
> > > > sun7i_a20_cfg =3D {
> > > >=20
> > > > static const struct sun4i_usb_phy_cfg sun8i_a23_cfg =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 2,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun6i_a31_phy,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.disc_thresh =3D 3,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phyctl_offset =3D =
REG_PHYCTL_A10,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D true,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.poll_vbusen =3D true,
> > > > };
> > > >=20
> > > > static const struct sun4i_usb_phy_cfg sun8i_a33_cfg =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 2,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun8i_a33_phy,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.disc_thresh =3D 3,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phyctl_offset =3D =
REG_PHYCTL_A33,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D true,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.poll_vbusen =3D true,
> > > > };
> > > >=20
> > > > static const struct sun4i_usb_phy_cfg sun8i_a83t_cfg =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 3,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hsic_index =3D 2,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun8i_a83t_phy,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phyctl_offset =3D =
REG_PHYCTL_A33,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D true,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.siddq_in_base =3D true,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phy2_is_hsic =3D true,
> > > > };
> > > >=20
> > > > static const struct sun4i_usb_phy_cfg sun8i_h3_cfg =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 4,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun8i_h3_phy,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.disc_thresh =3D 3,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phyctl_offset =3D =
REG_PHYCTL_A33,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D true,
> > > > @@ -935,7 +918,6 @@ static const struct sun4i_usb_phy_cfg
> > > > sun8i_h3_cfg =3D {
> > > >=20
> > > > static const struct sun4i_usb_phy_cfg sun8i_r40_cfg =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 3,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun8i_r40_phy,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.disc_thresh =3D 3,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phyctl_offset =3D =
REG_PHYCTL_A33,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D true,
> > > > @@ -945,7 +927,6 @@ static const struct sun4i_usb_phy_cfg
> > > > sun8i_r40_cfg =3D {
> > > >=20
> > > > static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 1,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun8i_v3s_phy,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.disc_thresh =3D 3,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phyctl_offset =3D =
REG_PHYCTL_A33,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D true,
> > > > @@ -955,16 +936,15 @@ static const struct sun4i_usb_phy_cfg
> > > > sun8i_v3s_cfg =3D {
> > > >=20
> > > > static const struct sun4i_usb_phy_cfg sun20i_d1_cfg =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 2,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun50i_h6_phy,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phyctl_offset =3D =
REG_PHYCTL_A33,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D true,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hci_phy_ctl_clear =
=3D PHY_CTL_SIDDQ,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phy0_dual_route =
=3D true,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.siddq_in_base =3D true,
> > > > };
> > > >=20
> > > > static const struct sun4i_usb_phy_cfg sun50i_a64_cfg =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 2,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun50i_a64_phy,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.disc_thresh =3D 3,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phyctl_offset =3D =
REG_PHYCTL_A33,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D true,
> > > > @@ -974,11 +954,11 @@ static const struct sun4i_usb_phy_cfg
> > > > sun50i_a64_cfg =3D {
> > > >=20
> > > > static const struct sun4i_usb_phy_cfg sun50i_h6_cfg =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_phys =3D 4,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D sun50i_h6_phy,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phyctl_offset =3D =
REG_PHYCTL_A33,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dedicated_clocks =
=3D true,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phy0_dual_route =
=3D true,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.missing_phys =3D B=
IT(1) | BIT(2),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.siddq_in_base =3D true,
> > > > };
> > > >=20
> > > > static const struct of_device_id sun4i_usb_phy_of_match[] =3D { =20
> >  =20
>=20

