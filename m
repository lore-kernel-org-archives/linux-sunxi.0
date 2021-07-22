Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C417173
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 13:35:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABDF711B3;
	Thu, 22 Jul 2021 06:35:40 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A077B3F694;
	Thu, 22 Jul 2021 06:35:39 -0700 (PDT)
Date: Thu, 22 Jul 2021 14:35:06 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Icenowy Zheng <icenowy@sipeed.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec
 <jernej.skrabec@siol.net>, Samuel Holland <samuel@sholland.org>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH 01/13] sunxi: decide the inclusion of SCP by
 SCP_ADDR existence
Message-ID: <20210722143506.51dc644e@slackpad.fritz.box>
In-Reply-To: <20210722063015.421923-2-icenowy@sipeed.com>
References: <20210722063015.421923-1-icenowy@sipeed.com>
	<20210722063015.421923-2-icenowy@sipeed.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jul 2021 14:30:03 +0800
Icenowy Zheng <icenowy@sipeed.com> wrote:

> There are more Allwinner SoCs that do not have a SCP now.
> 
> When there's no SCP_ADDR macro defined, we can assume there's no SCP
> available.
> 
> Drop the scp part of FIT description when SCP_ADDR does not exist.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>

I like that one, unless someone screams, I will take ASAP.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/dts/sunxi-u-boot.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/dts/sunxi-u-boot.dtsi b/arch/arm/dts/sunxi-u-boot.dtsi
> index 06da009fa2..4a6ed3a7dd 100644
> --- a/arch/arm/dts/sunxi-u-boot.dtsi
> +++ b/arch/arm/dts/sunxi-u-boot.dtsi
> @@ -64,7 +64,7 @@
>  					};
>  				};
>  
> -#ifndef CONFIG_MACH_SUN50I_H616
> +#ifdef SCP_ADDR
>  				scp {
>  					description = "SCP firmware";
>  					type = "firmware";
> @@ -92,7 +92,7 @@
>  				@config-SEQ {
>  					description = "NAME";
>  					firmware = "atf";
> -#ifdef CONFIG_MACH_SUN50I_H616
> +#ifndef SCP_ADDR
>  					loadables = "uboot";
>  #else
>  					loadables = "scp", "uboot";

