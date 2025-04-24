Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18282E62C
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 00:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745455490; cv=none; b=Oiy39NB3XdaAb7oyvfGDyR0OmD0K038hWvkr8ZkfObkDgbPRuHup5LLt31hrXN+wkw+u5uOh8GyMcXIN9e9Sz7kdswrU+hctt8u5cRxMEeCq5kpl2w1MWltgP2cV9Q6PCO2guI5pnhBdRu4+K/Pbf3M0VHgEyd22V72TviMe6ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745455490; c=relaxed/simple;
	bh=9XweFNfHhe7EX+TrllqLBd/BK2OVdDV9V+0ba/Rb3EU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CWg57tRI8sLWm/TiUWyKZsvuQlapc6gWWPCy/JBWVrlcgAta+Xn7YsiP9zmba2PePSrwSPS6QuhoiKtqVVHehPP9H7ClJ9u0IEKah13kCxGEokndKR9t7a2B1q//wV4OChQLvqPgsTbfaPbsvm8ojYJzyEI88BHeH4tTsNI614M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F01E106F;
	Wed, 23 Apr 2025 17:44:43 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2DF73F59E;
	Wed, 23 Apr 2025 17:44:45 -0700 (PDT)
Date: Thu, 24 Apr 2025 01:43:41 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <20250424014341.7006ea65@minigeek.lan>
In-Reply-To: <20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
	<20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
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

On Wed, 23 Apr 2025 22:03:25 +0800
Yixun Lan <dlan@gentoo.org> wrote:

Hi Yixun,

> On Radxa A5E board, the EMAC0 connect to an external YT8531C PHY,
> which features a 25MHz crystal, and using PH8 pin as PHY reset.
> 
> Tested on A5E board with schematic V1.20.

Can you please add a name to the /aliases node, to make U-Boot add a
MAC address?
	ethernet0 = &emac0;

> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> index 912e1bda974ce5f64c425e371357b1a78b7c13dd..b3399a28badb5172801e47b8a45d5b753fc56ef1 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> @@ -54,6 +54,23 @@ &ehci1 {
>  	status = "okay";
>  };
>  
> +&emac0 {
> +	phy-mode = "rgmii";
> +	phy-handle = <&ext_rgmii_phy>;

Can you please add the phy-supply here, which should be CLDO3? It's
referenced by other nodes, so would be enabled already,but each node
should be self-contained.

Cheers,
Andre

> +
> +	allwinner,tx-delay-ps = <300>;
> +	allwinner,rx-delay-ps = <400>;
> +
> +	status = "okay";
> +};
> +
> +&mdio0 {
> +	ext_rgmii_phy: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +	};
> +};
> +
>  &mmc0 {
>  	vmmc-supply = <&reg_cldo3>;
>  	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF6 */
> 

