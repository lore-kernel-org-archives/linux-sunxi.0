Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19585EA0
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Jul 2023 16:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0593C433C8;
	Sun, 16 Jul 2023 16:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689525322;
	bh=gY8zTOWN+oMFyatXIo8LTprkvrYU5gzVL1TL7vQ5pLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bqS3FjIQgJXJNEIliilYLF0zUtQHjRKQMMipkE6FtAcYjKBLJBCtLCy6XHUb0jtbp
	 YYntTBMk0nHLzxyOR05unM4oaFWq3n+Foww+cnuVcfm23DIpfNh3Hzm3Iftv2gUSJI
	 mvywJ5s6ZJlnAiMmZhsHLFAsA4eY4RcRFfm1BEBX32ER8NVsTP5yNaf2EPvWiAJfD4
	 cYvhszHs4rwBlI8UGgUju6wSn9s6VQtj0Z4BF9G/1A5S+lWHcQvmL3VDDGtyat5fow
	 E68a2DbYzS4vb44eLzSmXAWLHcW9+QSeo+dgNNKikHwuzWrywn4Js/vNPst1hPI9eV
	 baiIrcpXntNFg==
Message-ID: <dd5d7fed-cda1-8ab2-d502-7466def675ac@kernel.org>
Date: Sun, 16 Jul 2023 18:35:17 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Content-Language: en-US
To: Jookia <contact@jookia.org>, linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-can@vger.kernel.org,
 linux-riscv@lists.infradead.org, Fabien Poussin <fabien.poussin@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-3-contact@jookia.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230715112523.2533742-3-contact@jookia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/07/2023 13:25, Jookia wrote:
> From: John Watts <contact@jookia.org>
> 
> The Allwinner D1, T113 provide two CAN controllers that are variants
> of the R40 controller.
> 
> I have tested support for these controllers on two boards:
> 

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

> - A Lichee Panel RV 86 Panel running a D1 chip
> - A Mango Pi MQ Dual running a T113-s3 chip
> 
> Both of these fully support both CAN controllers.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 1bb1e5cae602..b185398334be 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -131,6 +131,18 @@ uart3_pb_pins: uart3-pb-pins {
>  				pins = "PB6", "PB7";
>  				function = "uart3";
>  			};
> +
> +			/omit-if-no-ref/
> +			can0_pins: can0_pins {

Wrong node naming. Underscores are not allowed.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).



Best regards,
Krzysztof

