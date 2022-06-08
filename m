Received: from fx.arvanta.net (static-213-198-238-194.adsl.eunet.rs [213.198.238.194])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974AB17D4
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Jun 2022 10:30:08 +0000 (UTC)
Received: from m1 (kcl.arvanta.net [10.5.1.8])
	by fx.arvanta.net (Postfix) with ESMTP id 71F9923982;
	Wed,  8 Jun 2022 12:30:00 +0200 (CEST)
Date: Wed, 8 Jun 2022 12:30:28 +0200
From: Milan =?utf-8?Q?P=2E_Stani=C4=87?= <mps@arvanta.net>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
	Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: usb: convert PHY GPIO functions to DM
Message-ID: <YqB6RPUJuyYx/Qwy@m1>
References: <20220608000604.3357-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220608000604.3357-1-andre.przywara@arm.com>

Hi,

it works fine. Thank you.

On Wed, 2022-06-08 at 01:06, Andre Przywara wrote:
> The Allwinner USB PHY driver is still using the legacy GPIO interface,
> which is now implemented by the DM_GPIO compat functions.
> Those seem to have some design flaws, as setting the direction, then
> later setting the value will not work, if the DM_GPIO driver is
> implementing set_flags.
> 
> Fix this by using the dm_ version of the direct GPIO interface, which
> uses struct gpio_desc structs to handle requested GPIOs, and actually
> keeps the flags we set earlier.
> 
> This fixes USB operation on boards which need to toggle the VBUS supply
> via a GPIO, like the Teres-I laptop or the BananaPi M2 Berry board.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reported-by: Milan P. Stanić <mps@arvanta.net>
Tested-by: Milan P. Stanić <mps@arvanta.net>
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 59 +++++++++++++++------------
>  1 file changed, 33 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> index 86c589a65fd..aef2cb8f6f8 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -125,9 +125,9 @@ struct sun4i_usb_phy_info {
>  
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
>  		initial_usb_scan_delay = 0;
>  	}
>  
> -	if (usb_phy->gpio_vbus >= 0)
> -		gpio_set_value(usb_phy->gpio_vbus, SUNXI_GPIO_PULL_UP);
> +	if (dm_gpio_is_valid(&usb_phy->gpio_vbus))
> +		dm_gpio_set_value(&usb_phy->gpio_vbus, 1);
>  
>  	return 0;
>  }
> @@ -235,8 +235,8 @@ static int sun4i_usb_phy_power_off(struct phy *phy)
>  	struct sun4i_usb_phy_data *data = dev_get_priv(phy->dev);
>  	struct sun4i_usb_phy_plat *usb_phy = &data->usb_phy[phy->id];
>  
> -	if (usb_phy->gpio_vbus >= 0)
> -		gpio_set_value(usb_phy->gpio_vbus, SUNXI_GPIO_PULL_DISABLE);
> +	if (dm_gpio_is_valid(&usb_phy->gpio_vbus))
> +		dm_gpio_set_value(&usb_phy->gpio_vbus, 0);
>  
>  	return 0;
>  }
> @@ -386,8 +386,8 @@ int sun4i_usb_phy_vbus_detect(struct phy *phy)
>  	struct sun4i_usb_phy_plat *usb_phy = &data->usb_phy[phy->id];
>  	int err = 1, retries = 3;
>  
> -	if (usb_phy->gpio_vbus_det >= 0) {
> -		err = gpio_get_value(usb_phy->gpio_vbus_det);
> +	if (dm_gpio_is_valid(&usb_phy->gpio_vbus_det)) {
> +		err = dm_gpio_get_value(&usb_phy->gpio_vbus_det);
>  		/*
>  		 * Vbus may have been provided by the board and just turned off
>  		 * some milliseconds ago on reset. What we're measuring then is
> @@ -395,7 +395,7 @@ int sun4i_usb_phy_vbus_detect(struct phy *phy)
>  		 */
>  		while (err > 0 && retries--) {
>  			mdelay(100);
> -			err = gpio_get_value(usb_phy->gpio_vbus_det);
> +			err = dm_gpio_get_value(&usb_phy->gpio_vbus_det);
>  		}
>  	} else if (data->vbus_power_supply) {
>  		err = regulator_get_enable(data->vbus_power_supply);
> @@ -409,10 +409,10 @@ int sun4i_usb_phy_id_detect(struct phy *phy)
>  	struct sun4i_usb_phy_data *data = dev_get_priv(phy->dev);
>  	struct sun4i_usb_phy_plat *usb_phy = &data->usb_phy[phy->id];
>  
> -	if (usb_phy->gpio_id_det < 0)
> -		return usb_phy->gpio_id_det;
> +	if (!dm_gpio_is_valid(&usb_phy->gpio_id_det))
> +		return -1;
>  
> -	return gpio_get_value(usb_phy->gpio_id_det);
> +	return dm_gpio_get_value(&usb_phy->gpio_id_det);
>  }
>  
>  void sun4i_usb_phy_set_squelch_detect(struct phy *phy, bool enabled)
> @@ -454,35 +454,42 @@ static int sun4i_usb_phy_probe(struct udevice *dev)
>  		if (data->cfg->missing_phys & BIT(i))
>  			continue;
>  
> -		phy->gpio_vbus = sunxi_name_to_gpio(info->gpio_vbus);
> -		if (phy->gpio_vbus >= 0) {
> -			ret = gpio_request(phy->gpio_vbus, "usb_vbus");
> +		ret = dm_gpio_lookup_name(info->gpio_vbus, &phy->gpio_vbus);
> +		if (ret == 0) {
> +			ret = dm_gpio_request(&phy->gpio_vbus, "usb_vbus");
>  			if (ret)
>  				return ret;
> -			ret = gpio_direction_output(phy->gpio_vbus, 0);
> +			ret = dm_gpio_set_dir_flags(&phy->gpio_vbus,
> +						    GPIOD_IS_OUT);
> +			if (ret)
> +				return ret;
> +			ret = dm_gpio_set_value(&phy->gpio_vbus, 0);
>  			if (ret)
>  				return ret;
>  		}
>  
> -		phy->gpio_vbus_det = sunxi_name_to_gpio(info->gpio_vbus_det);
> -		if (phy->gpio_vbus_det >= 0) {
> -			ret = gpio_request(phy->gpio_vbus_det, "usb_vbus_det");
> +		ret = dm_gpio_lookup_name(info->gpio_vbus_det,
> +					  &phy->gpio_vbus_det);
> +		if (ret == 0) {
> +			ret = dm_gpio_request(&phy->gpio_vbus_det,
> +					      "usb_vbus_det");
>  			if (ret)
>  				return ret;
> -			ret = gpio_direction_input(phy->gpio_vbus_det);
> +			ret = dm_gpio_set_dir_flags(&phy->gpio_vbus_det,
> +						    GPIOD_IS_IN);
>  			if (ret)
>  				return ret;
>  		}
>  
> -		phy->gpio_id_det = sunxi_name_to_gpio(info->gpio_id_det);
> -		if (phy->gpio_id_det >= 0) {
> -			ret = gpio_request(phy->gpio_id_det, "usb_id_det");
> +		ret = dm_gpio_lookup_name(info->gpio_id_det, &phy->gpio_id_det);
> +		if (ret == 0) {
> +			ret = dm_gpio_request(&phy->gpio_id_det, "usb_id_det");
>  			if (ret)
>  				return ret;
> -			ret = gpio_direction_input(phy->gpio_id_det);
> +			ret = dm_gpio_set_dir_flags(&phy->gpio_id_det,
> +						GPIOD_IS_IN | GPIOD_PULL_UP);
>  			if (ret)
>  				return ret;
> -			sunxi_gpio_set_pull(phy->gpio_id_det, SUNXI_GPIO_PULL_UP);
>  		}
>  
>  		if (data->cfg->dedicated_clocks)
> -- 
> 2.35.3
> 
