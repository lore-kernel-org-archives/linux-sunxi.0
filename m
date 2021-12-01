Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041DE2C82
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Dec 2021 10:43:28 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id DDF09D95D6
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Dec 2021 10:42:27 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D299E40005;
	Wed,  1 Dec 2021 10:42:17 +0000 (UTC)
Date: Wed, 1 Dec 2021 11:42:15 +0100
From: Quentin Schulz <foss+kernel@0leil.net>
To: Evgeny Boger <boger@wirenboard.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/2] iio:adc:axp20x: add support for NTC thermistor
Message-ID: <20211201104215.usstwfbvrv7pamqp@fiqs>
References: <20211118141233.247907-1-boger@wirenboard.com>
 <20211118141233.247907-2-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118141233.247907-2-boger@wirenboard.com>

Hi Evgeny,

On Thu, Nov 18, 2021 at 05:12:32PM +0300, Evgeny Boger wrote:
> Most AXPxxx-based reference designs place a 10k NTC thermistor on a
> TS pin. When appropriately configured, AXP PMICs will inject fixed
> current (80uA by default) into TS pin and measure the voltage across a
> thermistor. The PMIC itself will by default compare this voltage with
> predefined thresholds  and disable battery charging whenever

They actually are configurable, we just don't have the knobs for this in
the kernel.

"In the diagram above, VTH/VTL refers to the high temperature threshold
and low temperature threshold, which is programmable via registers
REG38H/39H/3CH/3DH respectively. " in AXP209 datasheet, section
"Battery temperature detection".

> the battery is too hot or too cold.
> 
> Alternatively, the TS pin can be configured as general-purpose
> ADC input. This mode is not supported by the driver.
> 
> This patch allows reading the voltage on the TS pin. It can be then
> either processed by userspace or used by kernel consumer like hwmon
> ntc thermistor driver.
> 
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> ---
>  drivers/iio/adc/axp20x_adc.c | 45 +++++++++++++++++++++++++++++++-----
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/adc/axp20x_adc.c b/drivers/iio/adc/axp20x_adc.c
> index 3e0c0233b431..12d469a52cea 100644
> --- a/drivers/iio/adc/axp20x_adc.c
> +++ b/drivers/iio/adc/axp20x_adc.c
[...]
> +static int axp22x_adc_scale_voltage(int channel, int *val, int *val2)
> +{
> +	switch (channel) {
> +	case AXP22X_BATT_V:
> +		/* 1.1 mV per LSB */
> +		*val = 1;
> +		*val2 = 100000;
> +		return IIO_VAL_INT_PLUS_MICRO;
> +
> +	case AXP22X_TS_IN:
> +		/* 0.8 mV per LSB */
> +		*val = 0;
> +		*val2 = 800000;
> +		return IIO_VAL_INT_PLUS_MICRO;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
>  static int axp813_adc_scale_voltage(int channel, int *val, int *val2)
>  {
>  	switch (channel) {
[...]
> @@ -378,12 +415,7 @@ static int axp22x_adc_scale(struct iio_chan_spec const *chan, int *val,
>  {
>  	switch (chan->type) {
>  	case IIO_VOLTAGE:
> -		if (chan->channel != AXP22X_BATT_V)
> -			return -EINVAL;
> -
> -		*val = 1;
> -		*val2 = 100000;
> -		return IIO_VAL_INT_PLUS_MICRO;
> +		return axp22x_adc_scale_voltage(chan->channel, val, val2);
>  

I would have personally split the move to a separate
axp22x_adc_scale_voltage function in a separate commit. I was a bit
confused at first why in the diff above there was a AXP22X_BATT_V
addition since this commit is about AXP22X_TS_IN.

If the maintainers are ok with it, I don't mind too much.

I don't have the HW to test this, but changes look ok.

Reviewed-by: Quentin Schulz <foss+kernel@0leil.net>

Thanks!
Quentin
