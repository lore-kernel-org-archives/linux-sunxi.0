Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F2617CB
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jun 2022 00:47:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1157D6E;
	Sun, 26 Jun 2022 17:47:16 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C3293F5A1;
	Sun, 26 Jun 2022 17:47:15 -0700 (PDT)
Date: Mon, 27 Jun 2022 01:12:10 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de, "Milan P . =?UTF-8?B?U3RhbmnEhw==?="
 <mps@arvanta.net>, Samuel Holland <samuel@sholland.org>,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: usb: convert PHY GPIO functions to DM
Message-ID: <20220627011210.61636a26@slackpad.lan>
In-Reply-To: <20220608000604.3357-1-andre.przywara@arm.com>
References: <20220608000604.3357-1-andre.przywara@arm.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed,  8 Jun 2022 01:06:04 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

> The Allwinner USB PHY driver is still using the legacy GPIO interface,
> which is now implemented by the DM_GPIO compat functions.
> Those seem to have some design flaws, as setting the direction, then
> later setting the value will not work, if the DM_GPIO driver is
> implementing set_flags.
>=20
> Fix this by using the dm_ version of the direct GPIO interface, which
> uses struct gpio_desc structs to handle requested GPIOs, and actually
> keeps the flags we set earlier.
>=20
> This fixes USB operation on boards which need to toggle the VBUS supply
> via a GPIO, like the Teres-I laptop or the BananaPi M2 Berry board.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reported-by: Milan P. Stani=C4=87 <mps@arvanta.net>

Applied to sunxi/master, for v2022.07.

Cheers,
Andre

> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 59 +++++++++++++++------------
>  1 file changed, 33 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinne=
r/phy-sun4i-usb.c
> index 86c589a65fd..aef2cb8f6f8 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -125,9 +125,9 @@ struct sun4i_usb_phy_info {
> =20
>  struct sun4i_usb_phy_plat {
>  	void __iomem *pmu;
> -	int gpio_vbus;
> -	int gpio_vbus_det;
> -	int gpio_id_det;
> +	struct gpio_desc gpio_vbus;
> +	struct gpio_desc gpio_vbus_det;
> +	struct gpio_desc gpio_id_det;
>  	struct clk clocks;
>  	struct reset_ctl resets;
>  	int id;
> @@ -224,8 +224,8 @@ static int sun4i_usb_phy_power_on(struct phy *phy)
>  		initial_usb_scan_delay =3D 0;
>  	}
> =20
> -	if (usb_phy->gpio_vbus >=3D 0)
> -		gpio_set_value(usb_phy->gpio_vbus, SUNXI_GPIO_PULL_UP);
> +	if (dm_gpio_is_valid(&usb_phy->gpio_vbus))
> +		dm_gpio_set_value(&usb_phy->gpio_vbus, 1);
> =20
>  	return 0;
>  }
> @@ -235,8 +235,8 @@ static int sun4i_usb_phy_power_off(struct phy *phy)
>  	struct sun4i_usb_phy_data *data =3D dev_get_priv(phy->dev);
>  	struct sun4i_usb_phy_plat *usb_phy =3D &data->usb_phy[phy->id];
> =20
> -	if (usb_phy->gpio_vbus >=3D 0)
> -		gpio_set_value(usb_phy->gpio_vbus, SUNXI_GPIO_PULL_DISABLE);
> +	if (dm_gpio_is_valid(&usb_phy->gpio_vbus))
> +		dm_gpio_set_value(&usb_phy->gpio_vbus, 0);
> =20
>  	return 0;
>  }
> @@ -386,8 +386,8 @@ int sun4i_usb_phy_vbus_detect(struct phy *phy)
>  	struct sun4i_usb_phy_plat *usb_phy =3D &data->usb_phy[phy->id];
>  	int err =3D 1, retries =3D 3;
> =20
> -	if (usb_phy->gpio_vbus_det >=3D 0) {
> -		err =3D gpio_get_value(usb_phy->gpio_vbus_det);
> +	if (dm_gpio_is_valid(&usb_phy->gpio_vbus_det)) {
> +		err =3D dm_gpio_get_value(&usb_phy->gpio_vbus_det);
>  		/*
>  		 * Vbus may have been provided by the board and just turned off
>  		 * some milliseconds ago on reset. What we're measuring then is
> @@ -395,7 +395,7 @@ int sun4i_usb_phy_vbus_detect(struct phy *phy)
>  		 */
>  		while (err > 0 && retries--) {
>  			mdelay(100);
> -			err =3D gpio_get_value(usb_phy->gpio_vbus_det);
> +			err =3D dm_gpio_get_value(&usb_phy->gpio_vbus_det);
>  		}
>  	} else if (data->vbus_power_supply) {
>  		err =3D regulator_get_enable(data->vbus_power_supply);
> @@ -409,10 +409,10 @@ int sun4i_usb_phy_id_detect(struct phy *phy)
>  	struct sun4i_usb_phy_data *data =3D dev_get_priv(phy->dev);
>  	struct sun4i_usb_phy_plat *usb_phy =3D &data->usb_phy[phy->id];
> =20
> -	if (usb_phy->gpio_id_det < 0)
> -		return usb_phy->gpio_id_det;
> +	if (!dm_gpio_is_valid(&usb_phy->gpio_id_det))
> +		return -1;
> =20
> -	return gpio_get_value(usb_phy->gpio_id_det);
> +	return dm_gpio_get_value(&usb_phy->gpio_id_det);
>  }
> =20
>  void sun4i_usb_phy_set_squelch_detect(struct phy *phy, bool enabled)
> @@ -454,35 +454,42 @@ static int sun4i_usb_phy_probe(struct udevice *dev)
>  		if (data->cfg->missing_phys & BIT(i))
>  			continue;
> =20
> -		phy->gpio_vbus =3D sunxi_name_to_gpio(info->gpio_vbus);
> -		if (phy->gpio_vbus >=3D 0) {
> -			ret =3D gpio_request(phy->gpio_vbus, "usb_vbus");
> +		ret =3D dm_gpio_lookup_name(info->gpio_vbus, &phy->gpio_vbus);
> +		if (ret =3D=3D 0) {
> +			ret =3D dm_gpio_request(&phy->gpio_vbus, "usb_vbus");
>  			if (ret)
>  				return ret;
> -			ret =3D gpio_direction_output(phy->gpio_vbus, 0);
> +			ret =3D dm_gpio_set_dir_flags(&phy->gpio_vbus,
> +						    GPIOD_IS_OUT);
> +			if (ret)
> +				return ret;
> +			ret =3D dm_gpio_set_value(&phy->gpio_vbus, 0);
>  			if (ret)
>  				return ret;
>  		}
> =20
> -		phy->gpio_vbus_det =3D sunxi_name_to_gpio(info->gpio_vbus_det);
> -		if (phy->gpio_vbus_det >=3D 0) {
> -			ret =3D gpio_request(phy->gpio_vbus_det, "usb_vbus_det");
> +		ret =3D dm_gpio_lookup_name(info->gpio_vbus_det,
> +					  &phy->gpio_vbus_det);
> +		if (ret =3D=3D 0) {
> +			ret =3D dm_gpio_request(&phy->gpio_vbus_det,
> +					      "usb_vbus_det");
>  			if (ret)
>  				return ret;
> -			ret =3D gpio_direction_input(phy->gpio_vbus_det);
> +			ret =3D dm_gpio_set_dir_flags(&phy->gpio_vbus_det,
> +						    GPIOD_IS_IN);
>  			if (ret)
>  				return ret;
>  		}
> =20
> -		phy->gpio_id_det =3D sunxi_name_to_gpio(info->gpio_id_det);
> -		if (phy->gpio_id_det >=3D 0) {
> -			ret =3D gpio_request(phy->gpio_id_det, "usb_id_det");
> +		ret =3D dm_gpio_lookup_name(info->gpio_id_det, &phy->gpio_id_det);
> +		if (ret =3D=3D 0) {
> +			ret =3D dm_gpio_request(&phy->gpio_id_det, "usb_id_det");
>  			if (ret)
>  				return ret;
> -			ret =3D gpio_direction_input(phy->gpio_id_det);
> +			ret =3D dm_gpio_set_dir_flags(&phy->gpio_id_det,
> +						GPIOD_IS_IN | GPIOD_PULL_UP);
>  			if (ret)
>  				return ret;
> -			sunxi_gpio_set_pull(phy->gpio_id_det, SUNXI_GPIO_PULL_UP);
>  		}
> =20
>  		if (data->cfg->dedicated_clocks)

