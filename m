Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194620;
	b=TggV3+DndpMAPkG/mQp83LWKBWwuogSkBDXzefcIN50SsHmZxEdpaSYgfkCYIjfAUgCF
	 FK9MOrjx5QJWhuGKb+cOq3GeGqUR5SMYKXsLQykjoe/yspJrlq9sbUyOzdVeTWQHucg8B
	 SVhqvRZo8SKKOD8W5HQ8Pz+DYrwDH4l9j9euDeN6OEp00nyIIoSkrRsz5NravLIohcNJk
	 xx8suoX+pnsQ6ViLNAo4VmYYzUs8nIdYFrCfBGAutC2oURE/LdUbVzRyuyj/05lgU7hQX
	 MmNNKQj+6LPfT8yBjX2tPURySE0sm4P70QqqMtfTuORhq+xAW9s7mSLIMKYkHD+9CEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194620;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BCrbRJEI3FmidgytAkajQBd7EJHV6pZe27NxHm/eDQo=;
	b=HXDmCgGBGdgStMwTpevrJ/kp1rDOSqVWY9mZIvTYoz2SbcOvrH2q92vAFNSLXuDez59g
	 tHnxCVPTG2/z1SsWfUsJAZiF3Q/115ZukE4YgMDyyIg9c26rcq9SneSTBsf0B4xmjf2w8
	 YPSb8r44AsnlSk5t6F79tscxBxjBpLYPFAqAQMkxwBjehQniqhzlK8Q4xHcKzfhxEc4gy
	 U878orkOH6oLg2K9u5dV4wA5mDbUGte6cPvK3RovQsAb6C8Hm1em5PHloNEbXIkxthO62
	 Ttu0r6IlpSyV1tLfDAcRV+us9vk7wTRjZ2Sbof1xSd6xZmVgAmQCxEjIKmt3enkoYag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nen37E9n;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E3360A2623
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E3360A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nen37E9n
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF95D1575;
	Fri, 20 Nov 2026 09:10:13 -0800 (PST)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 762C03F632;
	Fri, 20 Nov 2026 09:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795194616; bh=hqSsN2fuakU0TLaUzJxfRCMFwMgrGLnW5FmVIoMUQ0I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nen37E9n7YXZkwtkpHbNCVzwW552IlNclcRDZRADm0xR79n2+SJbOjitS0/NbEMvf
	 HIWhV208u8iIWQi0STJcU5s1JxGbKH1TISA+UcslQxdMqAdKpTY3QPiqyuwNI5YjbD
	 yfLdzZ0UY5kPXm3ekPCB/PGPtF2OxeFdbiPU2PCI=
Date: Fri, 20 Nov 2026 18:10:10 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Cc: aiyengar1990@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: allwinner: orangepi-zero2/zero3: Set
 the SPI NOR supply by label
Message-ID: <20261120181010.59d5f7c0@ryzen.lan>
In-Reply-To: <20261120-zero2-spi-nor-dual-read-v3-1-1cbb0caaed91@gmail.com>
References: <20261120-zero2-spi-nor-dual-read-v3-0-1cbb0caaed91@gmail.com>
	<20261120-zero2-spi-nor-dual-read-v3-1-1cbb0caaed91@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Nov 2026 06:30:08 +0000
Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
wrote:

Hi Arun,

> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> Label the flash node in the shared dtsi, so each board sets its supply
> through the label. The Zero2 keeps reg_aldo1. On the Zero3 the flash VDD
> is on the 3.3V rail from the AXP313A DLDO1 pin (schematic v1.2), so it
> gets reg_dldo1.
> 
> Suggested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>

> ---
> Andre: reg_dldo1 instead of reg_aldo1 on the Zero3. Schematic v1.2
> sheet 4 labels the 3.3V net "ALDO1", but it comes from AXP313A pin 12
> (DLDO1, VCC33-DLDO); pin 15 (ALDO1) is the 1.8V VCC18-ALDO. The flash
> VDD (U61 pin 8, net DCDCE) is on that 3.3V net. Not tested, no Zero3
> here.

Ah yeah, indeed, the schematic is super confusing in this respect. The
flash chip uses DCDCE(!) as the supply label, which then goes on to
connect to some unused label "ALDO1", but also to VCC33-DLDO, which is
the actual PMIC connection. And the chip needs definitely more than
2.3V for its operation, according to its datasheet, so 3.3V is the right
voltage.

So my bad, and thanks for checking this thoroughly.

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi | 2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 6 ++----
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts | 4 ++++
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> index 0d3e761f6466..cd1f67ad7c2b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> @@ -104,7 +104,7 @@ &spi0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;
>  
> -	flash@0 {
> +	spi_flash: flash@0 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		compatible = "jedec,spi-nor";
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index 90c25e12e189..2f8a16d1c9aa 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -148,8 +148,6 @@ &pio {
>  	vcc-pi-supply = <&reg_aldo1>;
>  };
>  
> -&spi0 {
> -	flash@0 {
> -		vcc-supply = <&reg_aldo1>;
> -	};
> +&spi_flash {
> +	vcc-supply = <&reg_aldo1>;
>  };
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
> index c51d4d9120de..afa753dead30 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
> @@ -103,3 +103,7 @@ &pio {
>  	vcc-ph-supply = <&reg_dldo1>;
>  	vcc-pi-supply = <&reg_dldo1>;
>  };
> +
> +&spi_flash {
> +	vcc-supply = <&reg_dldo1>;
> +};
> 

