Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A3D611B
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Sep 2023 20:47:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CF0B143D;
	Mon,  4 Sep 2023 13:48:05 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AD6C3F793;
	Mon,  4 Sep 2023 13:47:24 -0700 (PDT)
Date: Mon, 4 Sep 2023 21:46:23 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 airlied@gmail.com, conor+dt@kernel.org, daniel@ffwll.ch, heiko@sntech.de,
 jagan@edgeble.ai, jernej.skrabec@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org,
 neil.armstrong@linaro.org, noralf@tronnes.org, robh+dt@kernel.org,
 sam@ravnborg.org, samuel@sholland.org, uwu@icenowy.me, wens@csie.org, Chris
 Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V4 3/8] arm: dts: sun8i: V3s: Add pinctrl for pwm
Message-ID: <20230904214623.5528e002@slackpad.lan>
In-Reply-To: <20230828181941.1609894-4-macroalpha82@gmail.com>
References: <20230828181941.1609894-1-macroalpha82@gmail.com>
	<20230828181941.1609894-4-macroalpha82@gmail.com>
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

On Mon, 28 Aug 2023 13:19:36 -0500
Chris Morgan <macroalpha82@gmail.com> wrote:

Hi,

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add pinctrl nodes for pwm0 and pwm1.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Thanks for the changes, looks good now:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> index 3b9a282c2746..c87476ea31e2 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> @@ -414,6 +414,18 @@ mmc1_pins: mmc1-pins {
>  				bias-pull-up;
>  			};
>  
> +			/omit-if-no-ref/
> +			pwm0_pin: pwm0-pin {
> +				pins = "PB4";
> +				function = "pwm0";
> +			};
> +
> +			/omit-if-no-ref/
> +			pwm1_pin: pwm1-pin {
> +				pins = "PB5";
> +				function = "pwm1";
> +			};
> +
>  			spi0_pins: spi0-pins {
>  				pins = "PC0", "PC1", "PC2", "PC3";
>  				function = "spi0";

