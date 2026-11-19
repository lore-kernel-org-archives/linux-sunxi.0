Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087301;
	b=jCydJp1hII9pkyRTM0NbR4GWblnoklaPcgWD74u6m5OXtbcPCrRKHahL8u7dOGhd/pSZ
	 eGxcq1FRyEHDKg9IMfwWqDTUSntA72HawPd4wyzWOf3tW0rMVA4eXU3NcCp5JwpQ8+kTi
	 XECeDQJpzDr4vgIRlnUN/ECXspu9gJaGASo5mw974p2pGfpEAnuvINttoWsdA99fCpdyD
	 cUYI3k/98oKx6Y6cperByB/eO296k3ZauJuuoc1XafAARO8XuvaeiVmm2gyJnu57A70Yv
	 W70ttpBuwSYOH5RtzbXyCC0mhwmG7lqs7rXEgqxw+is6LxPGBS2rzS1sMOU6sRLsc4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087301;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7v5ZNN63HvHrdbqH3CUQi62kfadGnTXvbl26t53r41k=;
	b=4/ltpmBokjaDkALjQLDWIt54kO1fPLjOW+ZgqfyW3eFSkZ2tmZKb7b7NG6z9rODQs+kO
	 hQRQRqeEN/uuPhLpf7hrby3IdGLCwSARkJ+hjkysbKqeYkg3fmFynk46Ami76SM1TgSj5
	 YU3DnSSRhrzeZGxJz0QTDou4m4DV/km1bYT4o1kCcqDw7j9sxfCNq4CQ1Y9dY68RGsvOt
	 /0UaWALmpKQ2mQaPIp2344GR7jr3diJpRR4ZaPmcAtEL4OJ9MRgGZ85rJSwV7n2ZFCScZ
	 LWhpfKzruSEk6titadaBlqwBjEd3JRoaC+6/xs6oaXP+FtHmGUB1hwCeUvE8kQDpZdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NXX6a2Fs;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD5E606A320
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 11:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD5E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NXX6a2Fs
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE4301575;
	Thu, 19 Nov 2026 03:21:36 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C53453F882;
	Thu, 19 Nov 2026 03:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795087299; bh=ryVGJvRFBKaDiggrplKfiWJ6FP8BRQLqWd2Wvok1GeQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NXX6a2FszbHwrTzPyuCBWkGsKVFFN9/j1nx5TKJv3bUAJe2mev+0wuSIgDWMjA7JJ
	 +3u+G6+Xf2wXZjvHMHM2+zy6zAQwdlaRTT7JT1ixLxKuTTK8apBoMmDBObTxJGi03M
	 Mof15FU0FgTcf5o2MBncHLIGuFsLgRtajtqOXx1U=
Message-ID: <6064cf83-7cf8-4ac2-b8c6-9745e05d8e3e@arm.com>
Date: Thu, 19 Nov 2026 12:21:25 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: orangepi-zero2/zero3: Read
 the SPI NOR over two lines
To: aiyengar1990@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261119-zero2-spi-nor-dual-read-v2-0-185c87065e39@gmail.com>
 <20261119-zero2-spi-nor-dual-read-v2-2-185c87065e39@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261119-zero2-spi-nor-dual-read-v2-2-185c87065e39@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/19/26 06:29, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> WP# and HOLD# are tied to VCC on the Zero2 (schematic v1.3), so read over
> two lines. Andre Przywara pointed out that the Zero3 is the same.
> 
> Suggested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

You can drop the Suggested-by:, as the whole thing was your idea, and I 
just suggested the move.

Feel free to add:
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>   arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> index 646d92e0f724..4a588c44d029 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
> @@ -110,6 +110,7 @@ flash: flash@0 {
>   		compatible = "jedec,spi-nor";
>   		reg = <0>;
>   		spi-max-frequency = <40000000>;
> +		spi-rx-bus-width = <2>;
>   	};
>   };
>   
> 

