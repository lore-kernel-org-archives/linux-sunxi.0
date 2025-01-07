Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3557B4C9D
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jan 2025 10:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246612; cv=none; b=OrTCkPVRaVHZ7ExyI9hHipuuGGXIMVnKhUZLbaKjyj7h9eqiS3F1OwLJrDJnTGY06sj8NFGxLIOblwP9wfWUqbnzpTFgEezYDTAEXp/A4O1F2OZ9ji1U6qI2R+AH0vB+Ed/yxmlHRTasrhSk1yV0WPcndwHdsSAXVm6aZWe1HMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246612; c=relaxed/simple;
	bh=woFjHUJHrUSh1o/JoUcqPJHyy/iOnpRiHswrKFqLbVo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NojOFUJ64DGNtmItveNY8el1t4TidKYfNjlIDIiiudjzHsYU0V/xp2mPI6jcqMYp79AseUWe8ojV2BljFRcNNr1UPMS1Zv++KzcINlp0ZftyxnNAXJGlwA4WgG8GptBXf5uGGPiBuh88Kma8EiEBKCBG/mUIboeJ2sP8mfGS8Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90A2C143D;
	Tue,  7 Jan 2025 02:43:55 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 715F43F673;
	Tue,  7 Jan 2025 02:43:25 -0800 (PST)
Date: Tue, 7 Jan 2025 10:43:20 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] ARM: dts: sunxi: add uart1_pe pinctrl for
 sun8i-v3s
Message-ID: <20250107104320.4e74a87c@donnerap.manchester.arm.com>
In-Reply-To: <20250106190703.4015-4-lukas.schmid@netcube.li>
References: <20250106190703.4015-1-lukas.schmid@netcube.li>
	<20250106190703.4015-4-lukas.schmid@netcube.li>
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

On Mon,  6 Jan 2025 19:07:01 +0000
Lukas Schmid <lukas.schmid@netcube.li> wrote:

> Added the uart1_pe_pins pinctrl for use by the NetCube
> Systems Kumquat board
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> index 9e13c2aa8911..f909b1d4dbca 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> @@ -416,6 +416,12 @@ uart0_pb_pins: uart0-pb-pins {
>  				function = "uart0";
>  			};
>  
> +			/omit-if-no-ref/
> +			uart1_pe_pins: uart1-pe-pins {
> +				pins = "PE21", "PE22";
> +				function = "uart1";
> +			};
> +
>  			uart2_pins: uart2-pins {
>  				pins = "PB0", "PB1";
>  				function = "uart2";

