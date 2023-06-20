Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C682AB42
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Jun 2023 23:50:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B64E51063;
	Tue, 20 Jun 2023 16:51:25 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E794B3F59C;
	Tue, 20 Jun 2023 16:50:39 -0700 (PDT)
Date: Wed, 21 Jun 2023 00:50:00 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 mripard@kernel.org, uwu@icenowy.me, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, Chris Morgan
 <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/3] arm: dts: sun8i: V3s: Add pinctrl for pwm
Message-ID: <20230621005000.558b660c@slackpad.lan>
In-Reply-To: <20230620200022.295674-2-macroalpha82@gmail.com>
References: <20230620200022.295674-1-macroalpha82@gmail.com>
	<20230620200022.295674-2-macroalpha82@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Jun 2023 15:00:20 -0500
Chris Morgan <macroalpha82@gmail.com> wrote:

Hi Chris,

thanks for taking care of upstreaming, cute little device.

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add a default pinctrl for the pwm function.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>


> ---
>  arch/arm/boot/dts/sun8i-v3s.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
> index b001251644f7..e5977524abe2 100644
> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> @@ -414,6 +414,11 @@ mmc1_pins: mmc1-pins {
>  				bias-pull-up;
>  			};
>  
> +			pwm_pins: pwm-pins {
> +				pins = "PB4";
> +				function = "pwm0";
> +			};
> +
>  			spi0_pins: spi0-pins {
>  				pins = "PC0", "PC1", "PC2", "PC3";
>  				function = "spi0";
> @@ -441,6 +446,8 @@ pwm: pwm@1c21400 {
>  				     "allwinner,sun7i-a20-pwm";
>  			reg = <0x01c21400 0xc>;
>  			clocks = <&osc24M>;
> +			pinctrl-0 = <&pwm_pins>;
> +			pinctrl-names = "default";

How is this supposed to work with multiple channels? There is PWM1 on
PB5. If one wants to potentially use that, we would need to add a
reference to those pins here as well, and they would all be muxed to
PWM upon the PWM controller probing?

So while I see that it's the only output pin for PWM0, this might still
need to go into the board .dts, alongside the status = "okay"; line. So
each board would specify exactly the pins it needs (PWM0 only, PWM1
only, both or none).

Otherwise I compared this against the manual and Linux pinctrl driver,
it all matches up.

Cheers,
Andre

>  			#pwm-cells = <3>;
>  			status = "disabled";
>  		};

