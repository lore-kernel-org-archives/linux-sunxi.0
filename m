Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E3531E84C
	for <linux-sunxi@lists.linux.dev>; Mon,  8 Jun 2026 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904328; cv=none; b=UNnX1HGqH9gER0HPkLg6cxGnCemMWYwJJ2KPr7V2sve7pkRuciUBhVc/pbg+okYSrJbu+HATE8Q3jE8CakXqS+eTpUBxfhm1xmkQ2rGt9uRGlqgeBasno74oB61QMY6CLYt9pFcvn7+IKRmfmW+rjNPlEPzlNmiIS7TReXI1uSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904328; c=relaxed/simple;
	bh=SPAws/lhAws7/ucS0FCjJ/F5kS84Kk0lmu1Zg1EIo3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1FB6wsN9PtUX8/+8naFRIYXbElDTmfpuOKinQH8eoJ/ZGtpDwzfnlVz1nCGANMQWFjleJ0kw0MgjcC5TgDVv5TwkxHjWvO+fCCCI6R5WxyEMLpvsPrqar3J/7EvXlfA5Oen+/g4nFHl9A2WHtZT4hmNbQtzvDWDxNtoIGK9Um4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=enkpkK0u; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="enkpkK0u"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69BFD3290;
	Mon,  8 Jun 2026 00:38:40 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A3393F86F;
	Mon,  8 Jun 2026 00:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780904325; bh=SPAws/lhAws7/ucS0FCjJ/F5kS84Kk0lmu1Zg1EIo3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=enkpkK0uHHmW8awAneqEDFejZ0kEggRsSBDbMx0mOgu3hvlnfAQsOK6MnZtO7rCyB
	 lhDi55Irjlqw7gBNpxx7yGMk3cH0mwjQysRCNGiFuRiVAUdrgwHq+hzMlQPEJHZ9nP
	 KvljUJERgtgGKShZ09nsW6xZ7Jos1I3Aa1HavV+s=
Message-ID: <aa0e1539-cc59-4d3c-a0c5-a4f7cc1fe7c5@arm.com>
Date: Mon, 8 Jun 2026 09:38:35 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] riscv: dts: allwinner: d1s-t113: Add uart4 pinctrl
 required by NetCube Systems OpenNMC
To: Lukas Schmid <lukas.schmid@netcube.li>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20260606205452.2386930-1-lukas.schmid@netcube.li>
 <20260606205452.2386930-3-lukas.schmid@netcube.li>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260606205452.2386930-3-lukas.schmid@netcube.li>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 6/6/26 22:54, Lukas Schmid wrote:
> Added the "uart4_pb_pins" pinctrl used by the OpenNMC

Checked against the datasheet:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>   arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 82cc85acccb1..00fddedfa36f 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -191,6 +191,12 @@ uart3_pb_pins: uart3-pb-pins {
>   				pins = "PB6", "PB7";
>   				function = "uart3";
>   			};
> +
> +			/omit-if-no-ref/
> +			uart4_pb_pins: uart4-pb-pins {
> +				pins = "PB2", "PB3";
> +				function = "uart4";
> +			};
>   		};
>   
>   		ccu: clock-controller@2001000 {

