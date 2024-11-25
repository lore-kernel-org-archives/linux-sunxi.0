Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB47077F1B;
	Mon, 25 Nov 2024 16:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732550498; cv=none; b=p4ePYG+dJL1/u2puasJA5KVl2kuK2AMzNmljaiwCY2E9m0z2fICOIkciM7nhg2VCnf5L6ltMPEmqi3wisHAoYXpUvfzWFowZWmyGviz+aHrhSNCWSbtmjwWzOL3omAyItsK7yjQeEI9wlBaMuqcZvXKGJOxIBJYKkJX4yjpWC0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732550498; c=relaxed/simple;
	bh=TktsUwGeNhxSeHi0bdQOkR9d4PL26TzalaIYfQZs+o4=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=c12pW3PpoB4RsJ8HWi6zq54uHf4gzFR4v5cQm1zAOrn5Oc7MUlftWwyGAV2fCHG7rB4y2KEyjTUNXQA5qaplaU2mzvMWWRSqvvzXLtxGTcfavf0J+G4PrjWciPLRCmDGky8gLwMXdgt/qMqJWTT2gr6LeCDwmLIz1bQAcNPInIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYqZLs9V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYqZLs9V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F267AC4CECE;
	Mon, 25 Nov 2024 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732550498;
	bh=TktsUwGeNhxSeHi0bdQOkR9d4PL26TzalaIYfQZs+o4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=aYqZLs9V5Pxn7mIDQ5JSas85KEi//yGTAKVknCvaz0D7gciR09Pvhjk/kdo8YTLg7
	 yw1p7r2yI4yEmXdzv8CgDGoX187WTjrfLsunESoR4rfMUJGdi22W3qjaptiS5kiTM2
	 wlvpCXqNp4sFtCKa03uGLsUP0zw91Vd1XT8Rwq1orgIOKcwZcH9lynO+5b1lZ4jsd+
	 T3yVlX3WoRq86USUd1D0aqjkMIJV4kPc0kRkixUdWc9396mYbv6bNqZOMWNblTlQAd
	 KRXEeb6MK4eCcxqLcpXQadelJTRvL9OuRPyOis5oP5UuFVPS/y80skLhNLYN0UCPWz
	 pR2WSlqxE5v9w==
Message-ID: <1b1c0819f0a4ecafc13ed25c19e5d3d7@kernel.org>
Date: Mon, 25 Nov 2024 16:01:35 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sean Nyekjaer" <sean@geanix.com>
Subject: Re: [PATCH v2 3/3] drm/stm: dsi: use drm_mode_validate_mode()
 helper function
In-Reply-To: <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
References: <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Chen-Yu Tsai" <wens@csie.org>, "David
 Airlie" <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Philippe Cornu" <philippe.cornu@foss.st.com>, "Raphael
 Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Yannick
 Fertre" <yannick.fertre@foss.st.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Mon, 25 Nov 2024 14:49:28 +0100, Sean Nyekjaer wrote:
> When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
> to reguire the requested and the actual px clock to be within
> 50Hz. A typical LVDS display requires the px clock to be within +-10%.
> 
> In case for HDMI .5% tolerance is required.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
