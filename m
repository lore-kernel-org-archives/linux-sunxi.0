Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF0E10E1
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Aug 2023 22:02:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07EAA1FB;
	Sat, 19 Aug 2023 15:02:41 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F1AF3F64C;
	Sat, 19 Aug 2023 15:01:58 -0700 (PDT)
Date: Sat, 19 Aug 2023 23:00:59 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 mripard@kernel.org, me@crly.cz, uwu@icenowy.me, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, Chris Morgan
 <macromorgan@hotmail.com>
Subject: Re: [PATCH V2 1/4] ARM: dts: sun8i: V3: add alias to cpu node
Message-ID: <20230819230059.3cdc246a@slackpad.lan>
In-Reply-To: <20230819032105.67978-2-macroalpha82@gmail.com>
References: <20230819032105.67978-1-macroalpha82@gmail.com>
	<20230819032105.67978-2-macroalpha82@gmail.com>
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

On Fri, 18 Aug 2023 22:21:02 -0500
Chris Morgan <macroalpha82@gmail.com> wrote:

Hi Chris,

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add alias to CPU node to allow board specific CPU information to be
> added.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> index 3b9a282c2746..2b76a5b8ec19 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> @@ -71,7 +71,7 @@ cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		cpu@0 {
> +		cpu0: cpu@0 {

That's really a nitpick, but the V3s is a single core, so I think we
should just use "cpu" as the alias.

Cheers,
Andre

>  			compatible = "arm,cortex-a7";
>  			device_type = "cpu";
>  			reg = <0>;

