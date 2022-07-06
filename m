Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42F55383
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Jul 2022 16:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DE8C3411C;
	Wed,  6 Jul 2022 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657124842;
	bh=4aItf/nscQZL1SybsK3P9rnGm4HeS4pp4DKgi8jCtAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=amYVJ1/X6HSUPvDWF6hQJQoY8s0krw9Tvu+ST+qZK13iyxPNf4YQ7E0288lvv7rfC
	 XQE93Dif4iub11kK6q7sOr9Mb826hXizt7sxN2TEYqnoxv0lj0pgkLkEBY+vR/mRct
	 6rx6CGC7lQwrTHYPicck/Q8v8Xxdcmzg7EkFgL71R4DMPmW3mZ5El9EJ4zsmrEylr6
	 bR8owydhEkI41Ga5fb7SJ3jppXfaq6kkLJdNgF2/EHGaFLwqs2ih20B6O3lR7Yfbtp
	 LKeXtw5hSgzS3IC+ZBDIPK2TcHlqoTQwpa2dmoXkZRM2WHoHcZPHDXyhpdpH72mnH1
	 l8hvQmEwLAqxQ==
Date: Wed, 6 Jul 2022 21:57:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: dma: allwinner,sun50i-a64-dma: Fix min/max
 typo
Message-ID: <YsW35YxGAA3XdmK9@matsya>
References: <20220702031903.21703-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220702031903.21703-1-samuel@sholland.org>

On 01-07-22, 22:19, Samuel Holland wrote:
> The conditional block for variants with a second clock should have set
> minItems, not maxItems, which was already 2. Since clock-names requires
> two items, this typo should not have caused any problems.

Applied, thanks

-- 
~Vinod
