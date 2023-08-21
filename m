Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687668F42
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 17:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B868FC433C8;
	Mon, 21 Aug 2023 17:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692639319;
	bh=TIm9VtXxlIIF+26+p4kzCvEt3832dTcm44iy+s5+d+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3QL+Fzw7Jg1X5dQhCl4G1tA+OQyxWpBiUrFeC/zy9/f9Kt9GcynUtsZ72l8WvKuG
	 aD2QTedNY6zAdXXixkl1NNMc8MVXYqzn0n/TxZAbsSdJxTeDZBxRQ9Y0d0OQmV/okT
	 zdbI3x0fA0M5NY1ZB5vSPDak0q5gUTD78nwvej1oxH0EtZAVV4hilPmq7V7B5wMWwt
	 xG5whYA+9JOjWdhlX/tFgZbTsFEASR1b2//qPcRWIYi2JeYdC0ucj1DyFTqV0cDCU3
	 0Z0Z7aeY//abt3sW7FwZY2IvHi+phN9wBpFN/WaLs0ES3QNPXtBzX6UxpgqbOtpGeM
	 AidCRQ2V2Wipw==
Received: (nullmailer pid 2006749 invoked by uid 1000);
	Mon, 21 Aug 2023 17:35:16 -0000
Date: Mon, 21 Aug 2023 12:35:16 -0500
From: Rob Herring <robh@kernel.org>
To: John Watts <contact@jookia.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 7/7] dt-bindings: sound: sun4i-i2s: Add channel-slots
 property
Message-ID: <20230821173516.GA2006019-robh@kernel.org>
References: <20230811201406.4096210-1-contact@jookia.org>
 <20230811201406.4096210-8-contact@jookia.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811201406.4096210-8-contact@jookia.org>

On Sat, Aug 12, 2023 at 06:14:06AM +1000, John Watts wrote:
> The sun4i I2S controller supports mapping arbitrary TDM slots to
> each channel. Allow this to be expressed in the device tree.
> 
> This is currently only implemented in the R329 I2S variant.
> 
> Allow this to be configured using a new channel-dins property.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---
>  .../bindings/sound/allwinner,sun4i-a10-i2s.yaml           | 8 ++++++++
>  1 file changed, 8 insertions(+)

Same comments on this one.
