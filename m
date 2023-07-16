Received: from out-25.mta0.migadu.com (out-25.mta0.migadu.com [91.218.175.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40383EA0
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Jul 2023 16:53:17 +0000 (UTC)
Date: Mon, 17 Jul 2023 02:50:44 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689526395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tgi47nB1YHuMk/mfqwFLoSzUQApiiYJAouGt5+iloAs=;
	b=WnZ/73xFQ2KCJ2gdjOaHsIPEaibQl/fT9WyoisdiTJJDRianzEpge4xgk4hVAvCy4SlZKk
	jFlzmWDUIwn6KKON6QoiWuGYfQdbTRXq1MkhkQuhK0hWnuS0nz4YaTkfVhJTWuPvKPDQPY
	71J1zIdCPfif5Obbf9zxLcCOG8C9BzfcsaZyReXaMuOJWr9we+c7kxf0Q56/hwUXRezAP7
	xWcDC8BIM9dvxnN/OxEG9mQCFgh4p6EWpwQJirfy3b4xGNTUdY5B7Ex9VmS4h1yUuOMikN
	4mO/M3fSSX6hF2hQjd2Rcmaadsc6AMLL7zyx6v8lHVj/T4O4jh5Vh147UbfcAQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Message-ID: <ZLQf5AYOCT3EQXyC@titan>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-3-contact@jookia.org>
 <dd5d7fed-cda1-8ab2-d502-7466def675ac@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd5d7fed-cda1-8ab2-d502-7466def675ac@kernel.org>
X-Migadu-Flow: FLOW_OUT

Hello,

Thanks for spending your time replying to this.

On Sun, Jul 16, 2023 at 06:35:17PM +0200, Krzysztof Kozlowski wrote:
> On 15/07/2023 13:25, Jookia wrote:
> > From: John Watts <contact@jookia.org>
> > 
> > The Allwinner D1, T113 provide two CAN controllers that are variants
> > of the R40 controller.
> > 
> > I have tested support for these controllers on two boards:
> > 
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.

I ran this script and selected some of the emails and CCed them, at least I
believe that's what I did. Maybe I lost them when copying them to vim to make
the command line arguments.

> > +
> > +			/omit-if-no-ref/
> > +			can0_pins: can0_pins {
> 
> Wrong node naming. Underscores are not allowed.
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).

Hmm. I spent a few hours struggling and testing with make dtbs_check and
dt_binding_check. It doesn't seem to pick up on this specific issue, or at
least not in this case.

But yes I do see this, thanks for the catch. Will fix in v2.

I'm basing this patch series on 6.5-rc1, does that make a difference?

> Best regards,
> Krzysztof

Thanks,
John.
