Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072761547CC;
	Mon, 27 Jan 2025 19:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738005134; cv=none; b=rbwAIVzVnW5x8d6nfKZQb9WYdRyMVXErAld2mu0Gpj2DxXzUW8tODIvhDayLhDNoHU2lenS4QDFZr2i9ovwjs6DTz2REQHuA8/O34SflO4L0CxBGR86ZNhTvRHP3xkyKMIKDwyOV9XJmHNg1Tw2cvIsmmDvgW0TbHtNz4bEjZZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738005134; c=relaxed/simple;
	bh=L3SiiGUGYpJKCcs/BuywXLrfjhQqmnA6GR2a0coefGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmxCWuZKBqaP38jxm9uKJu2cYr6TIcSyX6QJn6qs6u9tfcS/ZJzQvFD+SPdQkZ503bTgG2oZMlsyr1yk708oQbaJ/jO+49zYaxiktor+0weMTW/JbOkH4+//4yfGpyWcCESDTk1nDrHLhUTV2ZZ003JVwnSZOD369KTjgLjpjLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/1SH4e+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/1SH4e+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60676C4CED2;
	Mon, 27 Jan 2025 19:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738005133;
	bh=L3SiiGUGYpJKCcs/BuywXLrfjhQqmnA6GR2a0coefGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/1SH4e+uUajB5fV42YkeaGwBFaQIWWo+k7S4BsCvVXheIjbXhcMzWyW8PKYlQ8mY
	 9dwb4QdAhwM4LPOtoAsOSN7dXv4uelW5JVVKD0cg/X4tBI9mxNDRAIjf2mzqiOa9UX
	 xU0QAakO1IegktmVFgZkKyPryGNNA1EN+IDVufUgQGLqC5fuupdLbqjvG3MK2FLFkH
	 5QhKHgLQZBQnN/eKBUd1XPT7lzMVyUa/9oL/MNImb5HI1tg+lAInXp6kFNXWTZz+/U
	 vg9h2F5i6/SohxBr8UH68LMB8UGwwmE0ixcOe9UxmSuHzt62kyjyUCd1ZWNcDYcAW4
	 Z2FfCd0JspOUQ==
Date: Mon, 27 Jan 2025 13:12:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>,
	devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: sun4i-a10-codec: add
 hp-det-gpios
Message-ID: <173800513205.698322.900237271228809143.robh@kernel.org>
References: <20250125070458.13822-1-ryan@testtoast.com>
 <20250125070458.13822-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125070458.13822-2-ryan@testtoast.com>


On Sat, 25 Jan 2025 20:00:11 +1300, Ryan Walklin wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Devices integrating Allwinner SoCs may use line-out or headphone jacks
> with jack detection circuits attached to a GPIO. For example, a number
> of Anbernic devices featuring the H700 SoC use this mechanism to switch
> between a headphone jack and an internal speaker.
> 
> Add extra routing endpoints to support this.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> --
> Changelog v1..v2:
> - Remove vendor prefix from hp-det-gpios
> - Amend commit message
> ---
>  .../bindings/sound/allwinner,sun4i-a10-codec.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

