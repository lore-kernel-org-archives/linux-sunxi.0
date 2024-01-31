Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9090E12F598
	for <linux-sunxi@lists.linux.dev>; Wed, 31 Jan 2024 14:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706712647; cv=none; b=WkN+ggLY99uHhXx6Q8IcWbHHlBuVMBRylfUTWWwD6lg+LT485MCNXwoaQwTgW1r3TkfSmXfVtM7gsQemtBVCAe72A/VR+DgXd+VAk5lt4sJjISeR4Y/QY/d1Agsxrw0nWuPJmXW3y3Of/XvhKj/IdtIX9ig8MBsPAjsH3eyBnkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706712647; c=relaxed/simple;
	bh=iavdwSoa/91DZNj9sYAc+ToYnDtfSzIXsRuwYSklzyM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kQdIMgg2B7gAAPNk7cc1pasbFgJGp0S6Rv6L6sGPEHi2BiprUZC3m7FBwOoJgThaDRWLdXCRA3Hk47GguP/7pBvdTeRFXB1/ODIYo6XThJxJx3yWkuV9bahiBnC4WbKTIGpvo4RKNd6Sf33amMliKG7KEqZRKg4ZiwvkuR7PDfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D28ADA7;
	Wed, 31 Jan 2024 06:51:22 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14BD43F762;
	Wed, 31 Jan 2024 06:50:35 -0800 (PST)
Date: Wed, 31 Jan 2024 14:50:33 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Aleksandr Shubin <privatesub2@gmail.com>
Cc: linux-kernel@vger.kernel.org, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maksim Kiselev <bigunclemax@gmail.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 John Watts <contact@jookia.org>, Cheo Fusi <fusibrandon13@gmail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 3/3] riscv: dts: allwinner: d1: Add pwm node
Message-ID: <20240131145033.0b05f4c6@donnerap.manchester.arm.com>
In-Reply-To: <20240131125920.2879433-4-privatesub2@gmail.com>
References: <20240131125920.2879433-1-privatesub2@gmail.com>
	<20240131125920.2879433-4-privatesub2@gmail.com>
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

On Wed, 31 Jan 2024 15:59:16 +0300
Aleksandr Shubin <privatesub2@gmail.com> wrote:

Hi,

> D1 and T113s contain a pwm controller with 8 channels.
> This controller is supported by the sun20i-pwm driver.
> 
> Add a device tree node for it.
> 
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>

Compared against the manual:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 5a9d7f5a75b4..435a1e66aa6a 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -145,6 +145,18 @@ uart3_pb_pins: uart3-pb-pins {
>  			};
>  		};
>  
> +		pwm: pwm@2000c00 {
> +			compatible = "allwinner,sun20i-d1-pwm";
> +			reg = <0x02000c00 0x400>;
> +			clocks = <&ccu CLK_BUS_PWM>,
> +				 <&dcxo>,
> +				 <&ccu CLK_APB0>;
> +			clock-names = "bus", "hosc", "apb0";
> +			resets = <&ccu RST_BUS_PWM>;
> +			status = "disabled";
> +			#pwm-cells = <0x3>;
> +		};
> +
>  		ccu: clock-controller@2001000 {
>  			compatible = "allwinner,sun20i-d1-ccu";
>  			reg = <0x2001000 0x1000>;

