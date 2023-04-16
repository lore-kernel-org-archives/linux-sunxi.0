Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F86E7B
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Apr 2023 00:24:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 550BE1063;
	Sat, 15 Apr 2023 17:25:28 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DC203F587;
	Sat, 15 Apr 2023 17:24:42 -0700 (PDT)
Date: Sun, 16 Apr 2023 01:24:21 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jonathan McDowell <noodles@earth.li>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ARM: dts: sun5i: chip: Enable bluetooth
Message-ID: <20230416012421.255bfd19@slackpad.lan>
In-Reply-To: <f26d11e613df7bd55822ff3fb7689e36bf9e4f7a.1681580558.git.noodles@earth.li>
References: <cover.1681580558.git.noodles@earth.li>
	<f26d11e613df7bd55822ff3fb7689e36bf9e4f7a.1681580558.git.noodles@earth.li>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 15 Apr 2023 18:46:03 +0100
Jonathan McDowell <noodles@earth.li> wrote:

> The C.H.I.P has an rtl8723bs device with the bluetooth interface hooked
> up on UART3. Support for this didn't exist in mainline when the DTS was
> initially added, but it does now, so enable it.
> 
> Signed-off-by: Jonathan McDowell <noodles@earth.li>
> ---
>  arch/arm/boot/dts/sun5i-r8-chip.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun5i-r8-chip.dts b/arch/arm/boot/dts/sun5i-r8-chip.dts
> index fd37bd1f3920..4d72a181d8aa 100644
> --- a/arch/arm/boot/dts/sun5i-r8-chip.dts
> +++ b/arch/arm/boot/dts/sun5i-r8-chip.dts
> @@ -255,6 +255,10 @@ &uart3 {
>  	pinctrl-0 = <&uart3_pg_pins>,
>  		    <&uart3_cts_rts_pg_pins>;
>  	status = "okay";
> +
> +	bluetooth {
> +		compatible = "realtek,rtl8723bs-bt";
> +	}

As the kernel test robot already pointed out, there is a semicolon
missing here.
Otherwise looks good (dt-validate passes), but don't know if there are
any wakeup GPIOs connected (can't seem to find a schematic?).

Cheers,
Andre


>  };
>  
>  &usb_otg {

