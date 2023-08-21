Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008434A31
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 15:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC65FC433C8;
	Mon, 21 Aug 2023 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692632749;
	bh=DXrBW2VJ76u0qVfmft5avHbG1deyDq+corIBjd53wc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKVE57PRlBtesE3gZdkizeZ6WGvgRsETyqu6TWNmpAvStHVujOjQzFG4oLBobshxc
	 RztHW+B/KH2ieaUPmT5aF/dO1xLAtAVP40P2CMIHbG0BTsAsvi/S8+MCjyhqCOVnfD
	 QRzwKXcd1KEMAsEmcX8WVwO1bwWGsv9ssQ8ru4/5Te27MzFSbhYmiX1rG2wmYoSwb+
	 Oap0su4emwsccN90z8N3AdZUkGlLQdEILBTJMLgduA7VOzB7z+VejrHGrgmA4tEoGY
	 rM/iZcMuPy880GtnTWFf4jCzF+wRhOlf/KMj3LFdSur3yyqiEdB3k4BJ25wUquqHij
	 KylNtp/whrn7A==
Received: (nullmailer pid 1720300 invoked by uid 1000);
	Mon, 21 Aug 2023 15:45:45 -0000
Date: Mon, 21 Aug 2023 10:45:45 -0500
From: Rob Herring <robh@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: sun4i-a10-codec: Add binding
 for Allwinner D1 SoC
Message-ID: <169263274519.1720239.16779866504888120217.robh@kernel.org>
References: <20230805180506.718364-1-bigunclemax@gmail.com>
 <20230805180506.718364-2-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230805180506.718364-2-bigunclemax@gmail.com>


On Sat, 05 Aug 2023 21:05:01 +0300, Maksim Kiselev wrote:
> The Allwinner D1 SoC has a internal audio codec that similar to previous
> ones, but it contains a three ADC channels instead of two, and also has
> a separate clocks for ADC and DAC modules.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  .../sound/allwinner,sun4i-a10-codec.yaml      | 64 ++++++++++++++++---
>  1 file changed, 56 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

