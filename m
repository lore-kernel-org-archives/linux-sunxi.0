Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542AF17FE0
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 19:47:14 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id CF5F8240028
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 21:40:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1689104421; bh=g9k1FRid3+liwP5dvPwlB6jEAO2KiyUjZz0Y5JaBXKk=;
	h=MIME-Version:Content-Transfer-Encoding:Date:From:To:Cc:Subject:
	 Message-ID:From;
	b=WgNgeW8GE9caqIlxZWKScMY+xdettUubAAINe9SzXKXChgT73vbW8ZC2VLX6H+5gb
	 BUvD4tB/9IT6df4EdUcffJu1QgbgEW9mfrhhuubS1GMHkvT1WidPzsKv1AT8zsL8wg
	 J8CCQcUrGnsftYjoLpHgKoJLFT3sqStG2r3iqQY3gvcdJ3t2OQR6Hpb+LTHJv4lYjS
	 DesUFaIYqN4vwRY4Dq7+S65I4uR3VYahIMDxOMGtwvNtsqjLyt1rtX3e0TNsPJiYNq
	 P07IVP/62ttgurlzCqdpoU78A1wxXWgI/sFNKauS9Nw6CXX35BElONa8irSRphda0F
	 Yb9e6ORH5KLpw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4R0rnK15fJz6tw4;
	Tue, 11 Jul 2023 21:40:21 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 11 Jul 2023 19:40:21 +0000
From: Anne Macedo <retpolanne@posteo.net>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: H6: Enable Ethernet on Orange Pi One Plus
In-Reply-To: <20230711003957.658805-2-retpolanne@posteo.net>
References: <20230711003957.658805-2-retpolanne@posteo.net>
Message-ID: <30debca8b31ed4d2cbd64850d48b81ac@posteo.net>

On 11.07.2023 02:39, Anne Macedo wrote:
> Enable Ethernet on Orange Pi One Plus by using the correct phy for
> Realtek RTL8211E instead of the Generic One. Also use CONFIG_MACPWR to
> turn on ethernet on startup.
> 
> After this patch is applied, a few issues can be seen:
> 
> - there's still a PHY reset timed out error that doesn't seem to cause
>   any impacts to the overall connection
> 
> - sometimes the emac driver times out after reset (yellow LED turns on
>   and never blinks)
> 
> For future patches: for now, CONFIG_MACPWR is the only way to enable
> Ethernet on boot. There's already code on the dts for using the 
> 3v3-gmac
> regulator. However, it is not probed on boot, so it only starts after a
> "regulator status" command is issued.
> 
> More details about the troubleshooting on [1].
> 
> [1]
> https://lore.kernel.org/u-boot/4wsvwgy56e2xfgtvioru2tf2ofkqprlts36qggivxogww6pn5j@4jk63zxhzhag/
> 
> Signed-off-by: Anne Macedo <retpolanne@posteo.net>
> ---
>  arch/arm/dts/sun50i-h6-orangepi-one-plus.dts | 2 +-
>  configs/orangepi_one_plus_defconfig          | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/dts/sun50i-h6-orangepi-one-plus.dts
> b/arch/arm/dts/sun50i-h6-orangepi-one-plus.dts
> index 29a081e72a..6427c58f8a 100644
> --- a/arch/arm/dts/sun50i-h6-orangepi-one-plus.dts
> +++ b/arch/arm/dts/sun50i-h6-orangepi-one-plus.dts
> @@ -37,7 +37,7 @@
> 
>  &mdio {
>  	ext_rgmii_phy: ethernet-phy@1 {
> -		compatible = "ethernet-phy-ieee802.3-c22";
> +		compatible = "ethernet-phy-id001c.c915", 
> "ethernet-phy-ieee802.3-c22" ;
>  		reg = <1>;
>  	};
>  };
> diff --git a/configs/orangepi_one_plus_defconfig
> b/configs/orangepi_one_plus_defconfig
> index aa5f540eb1..a1835492db 100644
> --- a/configs/orangepi_one_plus_defconfig
> +++ b/configs/orangepi_one_plus_defconfig
> @@ -8,3 +8,7 @@ CONFIG_SUNXI_DRAM_H6_LPDDR3=y
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_OHCI_HCD=y
> +CONFIG_SUN8I_EMAC=y
> +CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_ETHERNET_ID=y
> +CONFIG_MACPWR="PD6"

Adding linux-sunxi to the thread (I unfortunately forgot this list)
