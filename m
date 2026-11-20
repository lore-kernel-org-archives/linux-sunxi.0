Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193720;
	b=CWx2gz8FtHug/OjzcYyP8N/zaqEdYQSPYEDk6iXxz8En1ysyg+C3jxkqfiVPy3X7tDIc
	 OKdlCmv4+GBNm3nq8HBea3DwtT3mmLszTbeaPRCrOrwRJUKGlfCPYJjKwanZyGcnajth8
	 PAalJFnj26lHiyfd5pRDz5JHso+N2Nx6mu/K46kB+W3lhN2xX+tgEVJivxNQ9k3MKIYcQ
	 zqB3nhIn3ymvN0qlD4rWA4LWkGLWF7SKY8YkUOkzL5vtwCINL0XWRmeiQTdxy2NTPOC86
	 VCGo6ieuJAUluTGwctD6XmgSob0CkZlcml4eHD9TPmvMfVyzl3HQ5CshPdT5Ex8W35g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193720;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HoeW7YwGvvuI/NADDycrfel2s95vBScbfUbzR4K0kTw=;
	b=fM7G5vZGvA7M3JE666pHoP/7QcL7U5tLK5TCOqummhOHa5vlNX2I4S8/7lRdg2UsgnGT
	 tMLakOwa+icz0H4JVIGsvd+m4j3sqxOX1AGxc4bW8pRv3FWD6zuSYOThICjsIVwh8Eapc
	 fmqLZiSJ0r1TVaHtxOr2C0N6B2kdpw958AtQF1v2Y99zYReFxcOZL48VbPuR9o5mS/EAk
	 ZaY1ous5K8FJlYeQ6ca4hGY5W6GrKPEVfyNr5tZLk2D/wtKo/qGeV+leVKhZcArteE6dz
	 oqRcL8jcGFPEVVE8UvF0QZr8xcBBS7iyb8XhNwUz9CriWzxVY+FmxD8MOiPsUVykzTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="cndOLz/W";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B8B60A2605
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 16:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B8B60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cndOLz/W
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4B271575;
	Fri, 20 Nov 2026 08:55:15 -0800 (PST)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E126C3F882;
	Fri, 20 Nov 2026 08:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795193718; bh=V/yBk9sLgKSP1wHaS8QVLRxQxyNAzJkrH+caPcA+9eY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cndOLz/WaXAMes9S6rn2jY028kub89buY56y4U0qnV+l5egb7076ovfU+6pk5PzbD
	 Psre7u02JqvWLAU5cTyCLCZOlR+qf7UVMs/GifBZwy/4p5NWiHlIHaOpmKFFkZMufJ
	 /vG2mYs4wJUvlWLYWBX05y4PL19Gh5npSDYiK1Mw=
Date: Fri, 20 Nov 2026 17:55:11 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Cc: rajanyadav0307@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul
 Kocialkowski <paulk@sys-base.io>
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: a100: Add I2C3 pins on
 PH12/PH13
Message-ID: <20261120175511.70ec8a36@ryzen.lan>
In-Reply-To: <20261120-k5c-dt-v1-v1-3-d9681df67bc0@gmail.com>
References: <20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com>
	<20261120-k5c-dt-v1-v1-3-d9681df67bc0@gmail.com>
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

On Fri, 20 Nov 2026 01:22:15 -0600
Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
wrote:

> From: Rajan Yadav <rajanyadav0307@gmail.com>
> 
> The I2C3 controller can use PH12 (SCK) and PH13 (SDA). The KickPi K5C
> connects its HYM8563 RTC there.
> 
> Add a pin group for them, marked /omit-if-no-ref/ like mmc1_pins, so
> it is only kept in the boards that use it.
> 
> Claude Code (Anthropic) drafted this change and its message; I
> reviewed it and tested it on a KickPi K5C.
> 

Checked against the manual, and the pinctrl driver (to map the function
number to the pin mux):

> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> index fce91dc2c28..3b53d64f25e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -215,6 +215,12 @@ pio: pinctrl@300b000 {
>  			interrupt-controller;
>  			#interrupt-cells = <3>;
>  
> +			/omit-if-no-ref/
> +			i2c3_ph_pins: i2c3-ph-pins {
> +				pins = "PH12", "PH13";
> +				function = "i2c3";
> +			};
> +
>  			mmc0_pins: mmc0-pins {
>  				pins = "PF0", "PF1", "PF2", "PF3",
>  				       "PF4", "PF5";
> 

