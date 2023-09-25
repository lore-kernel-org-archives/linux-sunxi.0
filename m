Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3600453BA
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Sep 2023 07:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56685C433CA;
	Mon, 25 Sep 2023 07:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695627857;
	bh=HGbj+fObT8u6gTICGsTkRzwnurezQLIHLfZnqiBm5js=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=GGSj1y/GZBESvrJwHEtIwCeJboCOT+s3GpBV7F/TNSTPOGssUZew5WtCI9hcGY5cl
	 SjRTDUZqAANJZcy1iLpI714Y61sc83YcmpxJWTMxEfJxIyeJmn6/c8+hJq26q/RxF0
	 RhEaHt7Oq8m5z3tESrmS1AubR6iYJmL3yDEG+I91W3PYCyMPeVYASln5pFRWkSvL8H
	 stXmjH278Xof+DRrjbgIgj4XylNG4rzO9ZpOLbMcbgHIzz3yXMbz6TwMyKKrPreK/d
	 42H3CHU06G6Fbj6bu1Z9vIbOeX/9AFeFYoNJocJlRVNSTdkCugEpu02cYYo9u9awYg
	 soPW50dMpGf/g==
Message-ID: <b96d809490814cce95ec13ef8e21d3d1.mripard@kernel.org>
Date: Mon, 25 Sep 2023 07:44:15 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 2/7] drm/sun4i: dw-hdmi: Remove double encoder cleanup
In-Reply-To: <20230924192604.3262187-3-jernej.skrabec@gmail.com>
References: <20230924192604.3262187-3-jernej.skrabec@gmail.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, mripard@kernel.org, samuel@sholland.org, wens@csie.org, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Sun, 24 Sep 2023 21:25:59 +0200, Jernej Skrabec wrote:
> It turns out that comment is wrong - dw hdmi driver never does any
> encoder cleanup. In fact, cleanup is done automatically, in destroy
> callback of encoder. Even more, encoder memory will be freed when hdmi
> device is destroyed. However, encoder will be cleaned up after that, in
> drm_mode_config_cleanup(), which is called later. This will cause use
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
