Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EB12AE90
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Sep 2025 00:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757377528; cv=none; b=rZyc0uQt5vpbSGiFs+UcZZSXTajKdtDkvyoIuVyXrave1Pd4eTRsSU28GWEP/ItUBSaCeapv9Bec72YO1RrfO4+ciNRB+fwpFgxIkStoV7RpOhn066wJnVI0F/0/ofvHR28kkbIitn7oIiAqmIF0ThFRx0gw6ztOqtVBJ2ubTdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757377528; c=relaxed/simple;
	bh=wYHaiOgv0c3CrrngmkGXy1RIZbf87Ynod0lCMxWdIZs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TL523BUsfhsUZbOrryAhtB+JF39N85ljb6ikOQXJ7ueFpGG4aqfRl1S2xPFZv6D1I4NUV/SjGEpCepzI/N+6Em4Wa4evNkh2fyGncQI64mgE6TPxgQPv/6YbL23pWSBWXOrbGa2moagTG77D9ZNV/vVqtFFlnaWdBWF1CmTWL4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4225C1691;
	Mon,  8 Sep 2025 17:25:16 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBCBE3F66E;
	Mon,  8 Sep 2025 17:25:22 -0700 (PDT)
Date: Tue, 9 Sep 2025 01:24:22 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet
 LEDs
Message-ID: <20250909012422.43b755a4@minigeek.lan>
In-Reply-To: <20250818163520.1004528-1-olek2@wp.pl>
References: <20250818163520.1004528-1-olek2@wp.pl>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 Aug 2025 18:35:13 +0200
Aleksander Jan Bajkowski <olek2@wp.pl> wrote:

> This patch adds support for Ethernet LEDs.

So I tried this on my OPi-PC2, but I cannot influence the LEDs. I have
CONFIG_LED_TRIGGER_PHY and CONFIG_LEDS_TRIGGER_NETDEV built in, and I
see mdio_mux-0.2:01:amber:lan and mdio_mux-0.2:01:green:lan in
/sys/class/leds, but anything I write into trigger does not seem to
change the output: it always stays on the network functionality, I
guess because it's still configured to the PHY hardware wired function?

What am I missing?

Cheers,
Andre

> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 20
> +++++++++++++++++++ 1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts index
> 0f29da7d51e6..7688f565ec9b 100644 ---
> a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts +++
> b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts @@ -7,6
> +7,7 @@ 
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
>  
>  / {
> @@ -132,6 +133,25 @@ &external_mdio {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible = "ethernet-phy-ieee802.3-c22";
>  		reg = <1>;
> +
> +		leds {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			led@0 {
> +				reg = <0>;
> +				color = <LED_COLOR_ID_GREEN>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +
> +			led@1 {
> +				reg = <1>;
> +				color = <LED_COLOR_ID_AMBER>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +		};
>  	};
>  };
>  

