Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9079A70
	for <linux-sunxi@lists.linux.dev>; Wed, 26 May 2021 23:16:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E0C413A1;
	Wed, 26 May 2021 16:16:33 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6847D3F719;
	Wed, 26 May 2021 16:16:32 -0700 (PDT)
Date: Thu, 27 May 2021 00:16:14 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Andreas Rehn <rehn.andreas86@gmail.com>
Cc: mripard@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 rfried.dev@gmail.com, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: dts: sun8i: v3s: enable emac for zero Dock
Message-ID: <20210527001614.2edfc630@slackpad.fritz.box>
In-Reply-To: <20210525173159.183415-1-rehn.andreas86@gmail.com>
References: <20210522205039.179486-1-rehn.andreas86@gmail.com>
	<20210525173159.183415-1-rehn.andreas86@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 May 2021 19:31:59 +0200
Andreas Rehn <rehn.andreas86@gmail.com> wrote:

> dwmac-sun8i supports v3s and
> Licheepi-zero Dock provides an ethernet port
> furthermore, align nodes in alphabetical order
> 
> Signed-off-by: Andreas Rehn <rehn.andreas86@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> Changes in v3:
> 	- align nodes in alphabetical order
> Changes in v2:
> 	- add ethernet0 alias.
>  .../boot/dts/sun8i-v3s-licheepi-zero-dock.dts   | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
> index db5cd0b8574b..752ad05c8f83 100644
> --- a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
> +++ b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
> @@ -49,16 +49,18 @@ / {
>  	compatible = "licheepi,licheepi-zero-dock", "licheepi,licheepi-zero",
>  		     "allwinner,sun8i-v3s";
>  
> +	aliases {
> +		ethernet0 = &emac;
> +	};
> +
>  	leds {
>  		/* The LEDs use PG0~2 pins, which conflict with MMC1 */
>  		status = "disabled";
>  	};
>  };
>  
> -&mmc1 {
> -	broken-cd;
> -	bus-width = <4>;
> -	vmmc-supply = <&reg_vcc3v3>;
> +&emac {
> +	allwinner,leds-active-low;
>  	status = "okay";
>  };
>  
> @@ -94,3 +96,10 @@ button-800 {
>  		voltage = <800000>;
>  	};
>  };
> +
> +&mmc1 {
> +	broken-cd;
> +	bus-width = <4>;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	status = "okay";
> +};

