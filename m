Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA15A2F80
	for <linux-sunxi@lists.linux.dev>; Sat, 22 May 2021 21:37:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04539101E;
	Sat, 22 May 2021 14:37:04 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B5903F719;
	Sat, 22 May 2021 14:37:02 -0700 (PDT)
Date: Sat, 22 May 2021 22:36:49 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Andreas Rehn <rehn.andreas86@gmail.com>, Icenowy Zheng <icenowy@aosc.io>
Cc: mripard@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Linux ARM
 Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: dts: sun8i: v3s: enable emac for zero Dock
Message-ID: <20210522223649.23f6da58@slackpad.fritz.box>
In-Reply-To: <20210522205039.179486-1-rehn.andreas86@gmail.com>
References: <20210522205039.179486-1-rehn.andreas86@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 May 2021 22:50:39 +0200
Andreas Rehn <rehn.andreas86@gmail.com> wrote:

> dwmac-sun8i supports v3s and
> Licheepi-zero Dock provides an ethernet port

As the other boards do it, and since we only take .dts files unchanged
into U-Boot: please add the alias here as well.

Icenowy, can you confirm that this works?

Cheers,
Andre

> 
> Signed-off-by: Andreas Rehn <rehn.andreas86@gmail.com>
> ---
>  arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
> index db5cd0b8574b..2d78b7a52fd3 100644
> --- a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
> +++ b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
> @@ -94,3 +94,8 @@ button-800 {
>  		voltage = <800000>;
>  	};
>  };
> +
> +&emac {
> +	allwinner,leds-active-low;
> +	status = "okay";
> +};

