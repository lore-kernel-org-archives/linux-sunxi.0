Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BAE2F26
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Nov 2022 17:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F332C433C1;
	Thu, 24 Nov 2022 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669311281;
	bh=ZimMhVjHA71uL0p/U9neQ/CDzc18IyUZBXeajOZUTeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6G06OHkw6Lw76Ptb8RrcCNwrJORwJ0uxyvjribBoTqmMheB4hPy0a1LCCFhLyRg0
	 NP4ZXhreHKZTWxkZ/xT2si1pC9MOQpzU5At5vRRTLQZii1ZGr20tojcpR9GhRJ7/Qy
	 GX9CehQ3oyGxNq60W8s+JdwLzIIL7hG6pPNP8prgRtxvcXn8M78Lz+3kTFNHaeh6DX
	 /yakbGdGyI0Xz0t5T+ekmfq18y7mTjksrWU1ruQFv46WoTMZvGoUpigKE7CXcZe6cd
	 g3EWvyFhNs4SbgLi4Ou0VJXfQBj04dULk2mtiZ4BbttmkF5GlIZTQWQerdZl+vUqFR
	 YMHR6F1AaVhIQ==
Date: Thu, 24 Nov 2022 23:04:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/8] phy: allwinner: phy-sun6i-mipi-dphy: Add the A100
 DPHY
Message-ID: <Y3+rLe4xrnR/Mmo3@matsya>
References: <20221114022113.31694-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114022113.31694-1-samuel@sholland.org>

On 13-11-22, 20:21, Samuel Holland wrote:
> This series adds support for the updated DPHY found in a couple of
> recent Allwinner SoCs. The first three patches fix an omission in the
> existing binding. The remaining patches add the new hardware variant.

Applied 1 & 4-8, thanks

-- 
~Vinod
