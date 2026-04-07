Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F173A7825;
	Tue,  7 Apr 2026 17:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775584295; cv=none; b=rKoIKWWx3Ldtpm5miUiTTLQQfF1fd8UCN2IWL9VpaolFkUmpVBu5DMmId8G2SwS+dJAcJPa2O4nTjfNWi5E2rm4PCjkg0MUjlBvW79wR9+r3Ijz/5pUHIeGjhdSNvKF7FHcRvBAUN6WMelcU5fayrt9qQE1yeRPj7I0y/s4q3K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775584295; c=relaxed/simple;
	bh=rlMvpKgIOlZglIA88qVLTA+ty+Ojl1Tbj1KHcxZ+sM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9RIfCI7by0Hmr2z85aTOeirQYhVlIvVGA1v8dmlvEhk3StPd9J4Y/tfDBmEZTheWGmCXIjRP1G5EspC1DL6K4kcHvCIwJojyTZwOrXdWcjZedX2RrulLmFAG+90+42YhtiGfYkOo4Xglsw18HQb4lphmEz4J/qBzlA4Hz/jdsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yk/IZ0bk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yk/IZ0bk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD42C116C6;
	Tue,  7 Apr 2026 17:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775584294;
	bh=rlMvpKgIOlZglIA88qVLTA+ty+Ojl1Tbj1KHcxZ+sM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yk/IZ0bkIfxY1NwrYVPkE0J/y6mUTaVCt2SijSspoxtSH0SsddcagzZWemgmgefgS
	 Og0tgurlxvYiL6aHknxY0oc+xnDkKydEA/ZXne54HBIpY04+ZzlfsjXcAHPGxxWVgp
	 wtcKaMCBq69EhA8p8Uc/hLsBEJ2dCK9JLooaYWdzzP0iZunoJRxhH4cmCUQfqvb3VK
	 9d0ZBS/qGUczOV2O7OYf5Sl+ahTwPjO5C8ihpWUVAebchf1d6o8weM0fj/wVJfSRpy
	 hrpITt71+aEaJSDc28XCZYti6dkDAkK6+JfaAfUs4cN077L3EZbDMzgUCPqd85NG1A
	 eTeq1c8O/5teQ==
Date: Tue, 7 Apr 2026 12:51:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jernej Skrabec <jernej@kernel.org>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/7] dt-bindings: sram: Document Allwinner H616 VE SRAM
Message-ID: <177558429222.3170780.2861586740779038011.robh@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324164357.1607247-2-wens@kernel.org>


On Wed, 25 Mar 2026 00:43:49 +0800, Chen-Yu Tsai wrote:
> The Allwinner H616 has two switchable peripheral SRAM regions:
> 
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
> 
>   The mux value for this region is different from previous generations,
>   and thus needs a completely new compatible.
> 
> - The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
>   KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
>   CPU access is disabled, the whole region reads as zero, while writes
>   are ignored.
> 
>   The mux value for this region is the same as on the A64 and H6. The
>   existing compatible for the A64 already covers this.
> 
> Add the compatible for the VE SRAM to the list of covered compatibles in
> the generic SRAM region binding.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

