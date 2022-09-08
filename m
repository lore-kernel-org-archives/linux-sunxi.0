Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AA27C
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Sep 2022 06:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F99DC433D6;
	Thu,  8 Sep 2022 06:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662620139;
	bh=bWDm0/BKT6ALzNkWQOWPN+cykWxcvMalF9SwFfwz4mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mt8cEkjUmvzn6ZRSFOsNDCRDTWpE7T8uAEAJjeEcHNdxxENpeF1MFqQiJjp6pwPjg
	 ZDTzfIg8http6LWN36QRSzahw81RuPVW2qMByL+qF31fk2gKvPbA/yf1ADIPbRX+eJ
	 OWH80E1rE2zIk1+F/LD8jv2UTKjLet1fj14TX2f12SHCsVaVcHM9EjqgdD+cR3Ae/A
	 /JDeB+qZ+50x356f3vH4o6zQMCHopR5R8WI2DVxhGuMovTK9+H6GQS5OR6pNmZvKoc
	 UQdY27riVaO9bh1b6QopvwG7tU71IZhdeWKo2gl68M0Vi8A6ilziRYJHggmoLDORYI
	 FtPpMPKBgwUug==
Date: Thu, 8 Sep 2022 07:55:33 +0100
From: Lee Jones <lee@kernel.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	maijianzhang <maijianzhang@allwinnertech.com>
Subject: Re: [PATCH] iio: adc: sun4i-gpadc-iio: adaptation interrupt number
Message-ID: <YxmR5SPPY18O7LaG@google.com>
References: <YwdhTlk+7h+FMrwm@scg>
 <5595575.DvuYhMxLoT@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5595575.DvuYhMxLoT@kista>

On Thu, 25 Aug 2022, Jernej Škrabec wrote:

> Dne četrtek, 25. avgust 2022 ob 13:47:26 CEST je fuyao napisal(a):
> > __platform_get_irq_byname determinies whether the interrupt
> > number is 0 and returns EINVAL.
> > 
> > Signed-off-by: fuyao <fuyao1697@cyg.com>
> 
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

This patch does not appear to be in my inbox.

Please [RESEND], with Jernej's Ack applied, thanks.

-- 
Lee Jones [李琼斯]
