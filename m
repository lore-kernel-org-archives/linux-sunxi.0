Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA2F8474
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Nov 2022 21:42:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B1F22B;
	Fri, 25 Nov 2022 13:42:25 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DF6D3F587;
	Fri, 25 Nov 2022 13:42:17 -0800 (PST)
Date: Fri, 25 Nov 2022 21:40:50 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/2] ARM: dts: sunxi: Fix GPIO LED node names
Message-ID: <20221125214050.711997f1@slackpad.lan>
In-Reply-To: <20221125195401.61642-1-samuel@sholland.org>
References: <20221125195401.61642-1-samuel@sholland.org>
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

On Fri, 25 Nov 2022 13:54:00 -0600
Samuel Holland <samuel@sholland.org> wrote:

Hi Samuel,

> These board devicetrees fail to validate because the gpio-leds schema
> requires its child nodes to have "led" in the node name.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

That looks alright, though the comment in the binding says that we
should just have led-0, led-1 instead, so just (hex) numbers. The
"status" name is also in the label, so we wouldn't lose information.

Actually, also "label" is deprecated, in favour of "color" and
"function", shall this be fixed on the way? Or is there anything that
breaks (older kernels) when removing the label property? 

Cheers,
Andre

> ---
> 
>  arch/arm/boot/dts/sun5i-gr8-chip-pro.dts | 2 +-
>  arch/arm/boot/dts/sun5i-r8-chip.dts      | 2 +-
>  arch/arm/boot/dts/sun6i-a31s-sina31s.dts | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> index a32cde3e32eb..3222f1490716 100644
> --- a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> +++ b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> @@ -70,7 +70,7 @@ chosen {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		status {
> +		led-status {
>  			label = "chip-pro:white:status";
>  			gpios = <&axp_gpio 2 GPIO_ACTIVE_HIGH>;
>  			default-state = "on";
> diff --git a/arch/arm/boot/dts/sun5i-r8-chip.dts b/arch/arm/boot/dts/sun5i-r8-chip.dts
> index 4bf4943d4eb7..303191c926c2 100644
> --- a/arch/arm/boot/dts/sun5i-r8-chip.dts
> +++ b/arch/arm/boot/dts/sun5i-r8-chip.dts
> @@ -70,7 +70,7 @@ chosen {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		status {
> +		led-status {
>  			label = "chip:white:status";
>  			gpios = <&axp_gpio 2 GPIO_ACTIVE_HIGH>;
>  			default-state = "on";
> diff --git a/arch/arm/boot/dts/sun6i-a31s-sina31s.dts b/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
> index 0af48e143b66..b84822453381 100644
> --- a/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
> +++ b/arch/arm/boot/dts/sun6i-a31s-sina31s.dts
> @@ -67,7 +67,7 @@ hdmi_con_in: endpoint {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		status {
> +		led-status {
>  			label = "sina31s:status:usr";
>  			gpios = <&pio 7 13 GPIO_ACTIVE_HIGH>; /* PH13 */
>  		};

