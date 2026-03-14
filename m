Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30937376BDC;
	Sat, 14 Mar 2026 13:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773494027; cv=none; b=afbHwQRM6sEDZkodhP3qKogXCgN6WVCBpBE+EaQnyVvRsQOvlislKHAgGSu2WAZJQpunyBxlu4V8I9TwUgEzsOuWTiI0dPaa90NrKC9P9ZhtuQqhxG3ODKvu1Wz49IYVecc2NnU54lpasD4U3ixjrDyO0bNbE4MT/xDKtaBdwvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773494027; c=relaxed/simple;
	bh=Ul/KZYYBluOLIebJRnv6IBl+OG4kts3XALkWxCRzAKE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AK8Q2GT7PA7Z7Yk0LrTVEMtmcTUCLf/pBcGCuBSHNvW8m3VQkuWy5576duYgyECkPYj9rl3BLL/9psc3VDiGyYzxvd56+HmMHOGqOo+Fia9SM8YA5Ay/MT3lDVk3pn8RidFUsch/MW0xrSs+yg3+N9PYKNv+QaqDA2zGvTy3ri8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qk+zD2me; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qk+zD2me"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4E5C2BC87;
	Sat, 14 Mar 2026 13:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773494026;
	bh=Ul/KZYYBluOLIebJRnv6IBl+OG4kts3XALkWxCRzAKE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qk+zD2me4/vx2bICl9IpydeNQ0LIJ1zMUTjn2rj7ZAPF2RGXRutSE4S0Q3k+JiK+i
	 V0H82+25jHFPDqReKLww8ej0jL3bHlfSeFK42JYzWlNC+Cv1mzl0HAo62QVcRqzaZU
	 MCBWcfcOjtWxubJWss0QmqkribB7W3MlFsoJKoGNBKs/qXuyvcXSaWLOX6o4tqW8DQ
	 QVsOZvMpz9F9VdSiP07Ru3EFm913dgH/WdPKaelH4DUPro4cVTH6+MERO+pxE1SRk4
	 9hnv/8pLdUaL2k/MOVAZIu4zSZCsx/jwnP6B+a1bJtYC3iJJxvadCBE2V2zKdMytSo
	 /s39D9mOsalZA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260309165635.1138413-1-wens@kernel.org>
References: <20260309165635.1138413-1-wens@kernel.org>
Subject: Re: [PATCH] drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
 get display memory
Message-Id: <177349402468.44870.8589906861344926590.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 21:13:44 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 10 Mar 2026 00:56:33 +0800, Chen-Yu Tsai wrote:
> Commit 4636ce93d5b2 ("drm/fb-cma-helper: Add drm_fb_cma_get_gem_addr()")
> adds a new helper, which covers fetching a drm_framebuffer's GEM object
> and calculating the buffer address for a given plane.
> 
> This patch uses this helper to replace our own open coded version of the
> same function.
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory
      commit: 79ac1c945ab885369a840da014ebc6fcde8e2ae2

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

