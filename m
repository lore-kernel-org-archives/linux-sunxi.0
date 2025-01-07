Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532E72594B2;
	Tue,  7 Jan 2025 06:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736231235; cv=none; b=NDU1evg/IUd4Wj4j2PTTXIMnXt6BwvCIkcIuCbZtFrLnNNVsNL09UAt/3OrF1TT3N67rRxPB1Dqmxfa9FS6mDevaxRMzqTAfher5tM8U2Ks+VleGFJwtXVdAjdSbuKPj999Zo1+wxBKGNwz1DezhqInxg6YvaqL5idzZCIZPNC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736231235; c=relaxed/simple;
	bh=UVQgtjQxvgRicW5E5yKP/ya2Ld4413TGyATLXPsQGas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RX5FCYuKQvCzXnvRIW6G5agxAS3Qzfd1pXt9lxObvL3yAeF7MGwmKell9fKlKzQAjMVQ/qoHFUeYGnq+1R5bh6ajVC32tCyx0BOQFCx9DvY7rOiBbVvEU4BMaJiRUXuWBkT9LRvW+SIqGXSXwbOxAoEUA1DrYgVfgqpQrJ5F3t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHuoo+CM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHuoo+CM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C94C4CED6;
	Tue,  7 Jan 2025 06:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736231233;
	bh=UVQgtjQxvgRicW5E5yKP/ya2Ld4413TGyATLXPsQGas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHuoo+CMNc33N5APJY1RsuszW++HdcenKZBmVb9V84LEyXVoi32Q7sxzUbfIrBhzh
	 6TDzxly+5AaM1nC/8LWgsOvRKWDOw89ru2CAAUD20zeKl+L1+bVXJQl+BgHYOroYBM
	 vbHm0RZgQzbBerzFmHsr9IHkafuKnb+txjdGJYkD4giiCSgqcdMY2Zw4Ci22JQRVM3
	 PqrGgWxnPYOOSHV4pYZJtHxDfx8MPsTWpnsAIX0k/wnl7TND6UryACPbLmNLhDAw4H
	 2J6uts79haPNDQEJENOH5AcO8HmZW/lg6WS6Sw1oW1ygAmdaDX0MzNHToak33JB7g1
	 +KOA5Yv8k0Kgg==
Date: Tue, 7 Jan 2025 07:27:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Add NetCube Systems
 Austria name
Message-ID: <lkbvp57zvhd6dzti3pikoshywyvcpo3br7mry6sduimduebtla@ui3dge5j6cak>
References: <20250106190703.4015-1-lukas.schmid@netcube.li>
 <20250106190703.4015-2-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250106190703.4015-2-lukas.schmid@netcube.li>

On Mon, Jan 06, 2025 at 07:06:59PM +0000, Lukas Schmid wrote:
> NetCube Systems Austria builds Embedded Systems for use in IoT, IIoT,
> or Smart Home scenarios.
> 
> Website is still WIP, but the Links on it are active:
> https://netcubesystems.at/
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>

Last time:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof

