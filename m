Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933BA8BE2
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 16:14:09 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 1B1061C0004; Mon, 21 Aug 2023 18:08:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1692634105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G3h+5K3nJFrTdEYrbKtvLLhmyVimLfcmMypOuvflm9I=;
	b=G0rEhsFGBHKL2nFBgNm+Rf8na9z+iQKQRMHPuzcaTtc2Khb7ceMeRn8flR9cImjCxb1Gl/
	AjZtb/QrqwzsonZ8PGWu5e/1T6FL8oQZFhFjdK2beISHkLub19hFD0o/hydgMYgqX6HqbS
	yHdpl9SYYeYl6QXgLtnkA6cAPfUlCic=
Date: Mon, 21 Aug 2023 18:08:17 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Jarrah Gosbell <kernel@undef.tools>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH] arm64: dts: pinephone: Add pstore support for PinePhone
 A64
Message-ID: <20230821160817.GA2227@bug>
References: <20230724213457.24593-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724213457.24593-1-andrej.skvortzov@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)

Hi!

> This patch reserves some memory in the DTS and sets up a
> pstore device tree node to enable pstore support.
> 
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> 
> Gbp-Pq: Topic pinephone
> Gbp-Pq: Name 0161-arm64-dts-pinephone-Add-pstore-support-for-PinePhone.patch
> ---
>  .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> index 87847116ab6d..84f9410b0b70 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> @@ -19,6 +19,22 @@ aliases {
>  		serial0 = &uart0;
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		pstore_mem: ramoops@61000000 {
> +			compatible = "ramoops";
> +			reg = <0x61000000 0x100000>;
> +			record-size = <0x20000>;
> +			console-size = <0x20000>;
> +			ftrace-size = <0x20000>;
> +			pmsg-size = <0x20000>;
> +			ecc-size = <16>;
> +		};
> +	};

dts is supposed to be for hardware description, but this is really policy decision.

Should we have something like "any dram is suitable for pstore"....?

Best regards,
										Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
