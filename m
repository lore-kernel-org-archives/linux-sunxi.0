Received: from out-49.mta0.migadu.com (out-49.mta0.migadu.com [91.218.175.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FFCEA0
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Jul 2023 16:53:26 +0000 (UTC)
Date: Mon, 17 Jul 2023 02:52:16 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689526404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7+YtgaNPWOYdlDhYTcuXDfLI8Vfs9RvLkBhHjx7ZR0I=;
	b=J3czQPr0J+1ggCTd/JkuKmOmpysTMs+wVHzEBurfjx9j7l6KBgQWZhm8D6UwCuVLx3YGas
	Nk/nTvIeG2o8u2wub/+4EyaHF6mK0+yw7LTmCt3zT/YAZ86qoVXRHGsswJqttkB+q27lZe
	h8LU6etbS+MMyT4+qL3Dd/7AHOqw3C3UeywSiOuH/G76gs3hO8AyOIcG0T6lxyEDmpq2Sc
	Ao7E8YbJHFwZA77yFgIi6M6WUa5tijW1poineW4zqi9D/RHrk64TRMznR/JvNyGv/jCEbg
	VW+bIBpLD144h2KBPZCc/oF6JKOQKNj9ITRjmOubuV15xXG1y+wWA2GiATys1Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 3/4] can: sun4i_can: Add send support for the Allwinner D1
Message-ID: <ZLQgQAigmhk9uYYd@titan>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-4-contact@jookia.org>
 <f3b1240a-4be0-4c02-0a63-561499ad6d0d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3b1240a-4be0-4c02-0a63-561499ad6d0d@kernel.org>
X-Migadu-Flow: FLOW_OUT

Hello,

On Sun, Jul 16, 2023 at 06:36:03PM +0200, Krzysztof Kozlowski wrote:
> > +static const struct sun4ican_quirks sun4ican_quirks_d1 = {
> > +	.has_reset = true,
> > +};
> 
> Isn't this the same as previous?

Yes, but I wanted to split up the new quirk in to its own patch. Is
there a better way of doing that?

> 
> Best regards,
> Krzysztof
> 

John.
