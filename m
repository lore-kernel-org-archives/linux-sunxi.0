Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7E877F1A
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Dec 2023 16:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66B36143D;
	Tue, 12 Dec 2023 08:22:56 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BC0C3F738;
	Tue, 12 Dec 2023 08:22:08 -0800 (PST)
Date: Tue, 12 Dec 2023 16:22:00 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Anne Macedo <retpolanne@posteo.net>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org (open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi
 SoC support), linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi
 SoC support), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] arm64: dts: allwinner: Orange Pi One Plus PHY support
Message-ID: <20231212162200.10b3868b@donnerap.manchester.arm.com>
In-Reply-To: <20231212122835.10850-2-retpolanne@posteo.net>
References: <20231212122835.10850-2-retpolanne@posteo.net>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 Dec 2023 12:28:30 +0000
Anne Macedo <retpolanne@posteo.net> wrote:

Hi Anne,

> Adds compatible values to mdio subnodes for Ethernet PHY representing
> Realtek 8211 PHY to Orange Pi One Plus.

So can you state why this would be needed? This is the RTL8211 ID,
right? Which should be autodetected via MDIO. Looking back in my inbox
you proposed this change before, for U-Boot, specifically, but I fail to
find a solution or explanation what really happens here. Two Renesas .dts
files have the same compatible, and the commit message talks about the
reset line there, is this related?

So can you please give some more background and explanation? That would be
part of a good commit message anyway ("why", not "what").

Cheers,
Andre

> Signed-off-by: Anne Macedo <retpolanne@posteo.net>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> index 29a081e72..7248ab72f 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> @@ -37,7 +37,8 @@ &emac {
>  
>  &mdio {
>  	ext_rgmii_phy: ethernet-phy@1 {
> -		compatible = "ethernet-phy-ieee802.3-c22";
> +		compatible = "ethernet-phy-id001c.c915",
> +			     "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
>  	};
>  };

