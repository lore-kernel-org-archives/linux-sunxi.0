Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11F828ED
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Apr 2023 10:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E03C433EF;
	Fri, 28 Apr 2023 10:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682676451;
	bh=pSpnOK2WwLPFrNdF3IRXqg6wNU38GrnXcVqArewr2jw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YUgOq2cBkICpTr7XIhZSk8+62S/TpOVcjduqdZ6feiuQG34gtGaywOYufqx3DGCel
	 WmDzhyS2lKVBfUK7aHlzVda9Ffpkmfps21FQ5OJnXr3IW3J+mePqVDc3L2xSDImSZC
	 QDa6daj4tpyeGqINlW273TkeMXPMrjklrESo0VPYv9M/+BRp/CMgFpDClyjdx6lTXF
	 nEz3y3ApVh8a/sg1mbKJsQpwEBehBD3h+WnlpGbrdSteqNWHvusu9lGOdIeYJ35u8x
	 oFOa558wp9/A3xsJh3VgZvVHrCiXmz4TXrLDRKi4BWsl573rLaS095OY1hGuXdzakT
	 46ym8QXiZazfw==
Message-ID: <b844828c-3f42-679d-e0c9-1c7f641a2a0b@kernel.org>
Date: Fri, 28 Apr 2023 12:07:25 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/7] clk: sunxi-ng: a64: export PLL_MIPI
Content-Language: en-US
To: Roman Beranek <me@crly.cz>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Frank Oltmanns <frank@oltmanns.dev>, Icenowy Zheng <icenowy@aosc.io>,
 Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230427091611.99044-1-me@crly.cz>
 <20230427091611.99044-2-me@crly.cz>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230427091611.99044-2-me@crly.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/04/2023 11:16, Roman Beranek wrote:
> PLL_MIPI will be referenced as assigned parent to TCON0
> 
> Signed-off-by: Roman Beranek <me@crly.cz>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 4 +++-
>  include/dt-bindings/clock/sun50i-a64-ccu.h | 1 +

No, bindings are always separate patches.


Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

