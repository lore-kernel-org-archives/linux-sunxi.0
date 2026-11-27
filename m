Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799468;
	b=n0CUkvnUpoX3ip0P5gT9n0vkBTHIA6UOOrcvtu7IGULMQzmUKHq9ocSeDO4H6qFzd1d/
	 PGVYvHX1cLqf1QjvYs2TabPWM6+fo6MvizZy2x7wWnR7adOPHXwhmax/Cp0GTRimu00oe
	 /vqqxc648WgHUy9Mr9px11fAeM9d/X1vXlW+/ihsNXZ1/JMI2mgkVbKyZah1vkTmorU/Y
	 Y1EhCS39JygugvJYkgKS/5VjGPve27rriuhEbHOHnnrlSiX2QAxAuqsDyyc8Z2+sxvWmW
	 z+NKCslHdGNGfujz6FqHGbHfgn+TnAmZ2/K6VJfCA4a4yAxUL29sYR3vE6qv+NtJ/7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799468;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=istvK8Vo0dRH+5Ab3OL0OyFKa13o+bNLAyZJ8VHCKOU=;
	b=NWmswoZPLJ4zzVFV6h9x95TAtRfNwJcpxiCHqFYJyEqOG/vVesMSdDIkm/LC8NVihA3Q
	 NPIw8amluvYqPJjye0SoXGmNufDvSnTNAZ+QPKtsg+v/ba+eGnoN5FYe48wA8su3uUcbO
	 1aQpr6ns0Wb+ZZLXSKPbKt1q4MAj5cKSApdjumwUjpqBHnOTkWuo/4Z7OVWNwScvGSDu4
	 V/FSbvzctFhlwibwTVvJ9Jf6MrZFLMEZC54Uo530t1BjdT8FJiGWcTQpMNsz44g4Kn6AS
	 dzHxXuUP6/GuxNjnz4cFaPbpIIlgUnUyi6rc1mk8cAYTpctOT4WkfazNrTiQTRxr7Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=larR9y8f;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2C8606A31F
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 17:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B2C8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=larR9y8f
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAFB81575;
	Fri, 27 Nov 2026 09:11:04 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 420CB3F632;
	Fri, 27 Nov 2026 09:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795799467; bh=FCVTxmg2sdNe51AfMa4AF6QW/CSqjRWXIVeiCqPpDFA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=larR9y8fPCMYOCR0QN4mHid/9x1bOSkf3g8gr9pqbONVSj3e673DCXSSg/l2cnTvN
	 JaxYZpMAYZrMUW/1vbOiD2LDb/qn+eJDY2NNo3KV4x5DjPuj/bs1vq1gNUQLsJRjpi
	 Fc574CcHhAAl0stGrYBgNePEgsCr94bmezg9WkeY=
Message-ID: <1eb33e7a-38ba-43c1-bf8d-477d75071e7a@arm.com>
Date: Fri, 27 Nov 2026 17:11:03 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 3/3] arm64: dts: allwinner: a523: drop the PA
 GPIO interrupt
To: Pablo Mazzini <pmazzini@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20261124215048.42074-1-pmazzini@gmail.com>
 <20261124215048.42074-4-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261124215048.42074-4-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/24/26 22:50, Pablo Mazzini wrote:
> The PA IRQ bank is not implemented, and the driver now numbers the IRQ
> banks from PB. Drop its interrupt.

"the driver" probably refers to the Linux driver, but DTs live in a 
different world, and are independent from any driver implementations, so 
this is not a good argument.
The real reason is that the binding changed, to only count implemented 
banks, even though this is not explicitly stated there.

> This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
> missing GPIO interrupt").

I think that deserves a fixes tag. Backports are somewhat questionable 
for DT patches, but it helps for U-Boot, which would import tagged DT 
changes only.

> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

The change itself is fine:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 85ef492ffeae..fc4d714a96ea 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -129,8 +129,7 @@ gpu: gpu@1800000 {
>   		pio: pinctrl@2000000 {
>   			compatible = "allwinner,sun55i-a523-pinctrl";
>   			reg = <0x2000000 0x800>;
> -			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,

