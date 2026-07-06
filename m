Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201E341DEE5
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 09:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329697; cv=none; b=M7JjeBpUi6PVP2awcqhRZJsm9xn9wVmijt4byfK7EYoRVnkTEayWK+EDcjJ+WPfyNkNoqVpZzRX7cSazW7yiqxIr49QFiP/A1QByVXW01JWI928qeo3Na31dfXVXP5B7rgNtIPIPlPA2H9RGTYm7sYBBol8ChXJdc1nl49POC8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329697; c=relaxed/simple;
	bh=1JBo9aYBrCOqV4k9LD/HWHclWEQxNqoysZ2Aob1Jdtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZ3zQ1Pt/ASqE/WRClyn9wmJAveE7I3R0nIT7oYcxMKqSOzz0syuPE30JllxIrrADNAWhq5IHCmuzXxoQQhcNbR0qavSWR1bmV6XZPe0NSJ8r9p2LueKET4NoyrC3rqaxu6ubagD/kZ2kSQsKwLzoa8IPxAdK9d+EznWwqupilI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bhpNUUzz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bhpNUUzz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B61E228C7;
	Mon,  6 Jul 2026 02:21:27 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEDE33F7B4;
	Mon,  6 Jul 2026 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783329692; bh=1JBo9aYBrCOqV4k9LD/HWHclWEQxNqoysZ2Aob1Jdtk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bhpNUUzzt7h988FqRrP93aumvnNVwYOtonMg08GWB5J4D2QYAtvsZbkUt66scOHwj
	 ixJ3LsVaTnTKR2mM8yIrdRGyh0Di9+GPvIAxUO0+LvWPjK0YNmPtGZuJoVtJB7DLf9
	 E7alh2RhRaJMc+GFTWlk490rDd51ivOycSXaDojU=
Message-ID: <97a674a3-4833-4aa6-a9a2-3ab5472ee4b3@arm.com>
Date: Mon, 6 Jul 2026 11:21:29 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: a523: add IR receiver node
To: Justin Suess <utilityemal77@gmail.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Sashiko <sashiko-bot@kernel.org>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260702214750.3428694-4-utilityemal77@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260702214750.3428694-4-utilityemal77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Justin,

I checked the numbers below against the manual, they match up: MMIO base 
address, interrupt number, clocks and resets.

One thing I figured is that the A523/T527 contains another CIR-RX 
instance, in the "CPUX" domain. That's used for instance on the 
Avaota-A1. So we need another node describing this instance.

Some more below...

On 7/2/26 23:47, Justin Suess wrote:
> The A523 has a CIR receiver in the RTC power domain, clocked from the
> R-CCU, with its RX signal available on PL11.
> 
> Clock the module directly from the 24 MHz host oscillator; the driver
> selects a /256 sample divider on this SoC, giving a sample period
> close to the legacy 8 MHz / 64 configuration of older SoCs.
> 
> Keep the node disabled by default; boards with an IR receiver can
> enable it.
> 
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> ---
>   .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index ca6a16807049..5e46c4b1ee61 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -927,6 +927,25 @@ r_i2c_pins: r-i2c-pins {
>   				allwinner,pinmux = <2>;
>   				function = "r_i2c0";
>   			};
> +
> +			r_ir_rx_pin: r-ir-rx-pin {
> +				pins = "PL11";
> +				allwinner,pinmux = <2>;
> +				function = "s_cir";
> +			};
> +		};
> +
> +		r_ir: ir@7040000 {
> +			compatible = "allwinner,sun55i-a523-ir";

As mentioned in the other email, I think we can use the fallback 
compatible, so add this here.

> +			reg = <0x07040000 0x400>;
> +			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_R_IR_RX>;
> +			clock-names = "apb", "ir";
> +			clock-frequency = <24000000>;

As said in the other email, I think this property is misnamed and 
misleading, just drop it, and let the driver select the sample rate.

> +			resets = <&r_ccu RST_BUS_R_IR_RX>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&r_ir_rx_pin>;

There is another pin which carries the R-IR-RX signal, on pin PM8. In 
those cases we do not add the pinctrl properties to the .dtsi DT node, 
but let each board add it, right next to where they enable the IP.
So please drop those two lines from here.

Cheers,
Andre

> +			status = "disabled";
>   		};
>   
>   		pck600: power-controller@7060000 {

