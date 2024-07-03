Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92942177981
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720012485; cv=none; b=mQ7sGUCV8zZVGP4QriR8pvHRe/0EewHtFTq0V4Camz4+83eSWbHpPcZpORQ9NFui+2bFNFQL4phUhdDZsuMULZ1B+b/AcegfhNHyaClyh/20CQ53EVlRB+AoZ2gh93hNXQoetmILYDrgpWfoRI/+EoJtR8oczCDovuxvl+sRUI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720012485; c=relaxed/simple;
	bh=W6ErXN9oQzI6lFEoAP7TALElM1k1z6ReQEHuIIKhs64=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tu/UBCEzbZU8OfPJn/HXkGWK5hMlvkyjGEUxHxfaej2ClQDBBQjjpXQwRHgv9qqxx3vgLSSboKRkwoual8uIq0hIJj3PN5zfs8Ekmn5fxaUfYdjOUIcGA5fFkcgD77RJ1zilS3VnoiPX7RZEuNc4Y/QZ4Ml+mBv8qO5fzCZbYfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B801367;
	Wed,  3 Jul 2024 06:15:08 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D9DB3F762;
	Wed,  3 Jul 2024 06:14:41 -0700 (PDT)
Date: Wed, 3 Jul 2024 14:14:39 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 mripard@kernel.org, ryan@testtoast.com, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V2 2/4] arm64: dts: allwinner: h616: Add r_i2c pinctrl
 nodes
Message-ID: <20240703141439.1807b865@donnerap.manchester.arm.com>
In-Reply-To: <20240702193414.57461-3-macroalpha82@gmail.com>
References: <20240702193414.57461-1-macroalpha82@gmail.com>
	<20240702193414.57461-3-macroalpha82@gmail.com>
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

On Tue,  2 Jul 2024 14:34:12 -0500
Chris Morgan <macroalpha82@gmail.com> wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add pinctrl nodes for the r_i2c node. Without the pinmux defined the
> r_i2c bus may fail to work, possibly if the bootloader uses rsb mode
> for the PMIC.

Yes, those are the only pins available, checked against the manual.

> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index 921d5f61d8d6..e31945c3895e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -837,6 +837,8 @@ r_i2c: i2c@7081400 {
>  			dmas = <&dma 48>, <&dma 48>;
>  			dma-names = "rx", "tx";
>  			resets = <&r_ccu RST_R_APB2_I2C>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&r_i2c_pins>;
>  			status = "disabled";
>  			#address-cells = <1>;
>  			#size-cells = <0>;

