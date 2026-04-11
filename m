Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1DD1D432D
	for <linux-sunxi@lists.linux.dev>; Sat, 11 Apr 2026 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775897070; cv=none; b=IICeoJCIAt7fII1lcKtVxH5tWjkL1hpS+u+YKvN6kSH9+8EfOBr/qLEVxWE+OgD+8L5RH82Ylmbkc51hmQE7Rph+XgErpuTW24Ts2aj9+TKTgU4nVsyofqlOWA8Jrex525mjFM42sCwQ9f+9bq47/ou3ABrkuL3sOIXPdcegK3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775897070; c=relaxed/simple;
	bh=RntnNLUVeODVikBI+yOez3GfbM1NukCg0uXVTU/wpAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DL0cQnB7QAYJNg4hTD3xh8e79WDBuKiGRHop4V80DYt1d18GUuGsYXHqwd5hZ7AhzlEnAxuMIhbUq/MCd9OW7bIyum3Uq1k1WDO40/D/y9NTUYjBA9Etgx12eGBJvHOAITWTCvGqkXiILCBGT+V9TSI9sqiPM6vH6/6FOaQ7CxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ev5bn4GR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ev5bn4GR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55440C4CEF7;
	Sat, 11 Apr 2026 08:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775897069;
	bh=RntnNLUVeODVikBI+yOez3GfbM1NukCg0uXVTU/wpAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ev5bn4GRcJhvmrmPqreMk3g82DW5zQky9oGjim7Qz+7WNffQQSC/cxc3/qsYWE2gK
	 nX3dPkPLySBY13x0hJdFq9Jmf0gbRSnUW80kXyGlV1XtFBhWeVKvznQnH2nyuX55Zh
	 A221pmjk40FrnzL27EKvqBffsgK74qfUwGY/1OLOaI8PNEaUKP19ZMUtW7KeBuXsJa
	 CKjoWGYv2lTalIeKMYxK2BhllF++PLw7T/hCbA4iWtDyocUTRxpkjgU22jAW7rpnwG
	 f6OG7ii/CRIDHy1GqM5TnBKbh2HfQRK2GbmI7QbO4oXZswDXlqW6P/IY+QbwbbzBm0
	 u1Nx09cpUEq9g==
Date: Sat, 11 Apr 2026 10:44:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Allwinner Device Tree Changes for 7.1 - Part 2
Message-ID: <20260411-abiding-porcupine-of-feminism-d0c5c2@quoll>
References: <adPIgTlQxnVpYgH4@home.wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adPIgTlQxnVpYgH4@home.wens.tw>

On Mon, Apr 06, 2026 at 10:51:45PM +0800, Chen-Yu Tsai wrote:
> The following changes since commit b912e48bee355b6b1faf86efc4a23191324ffecb:
> 
>   arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support (2026-03-14 15:27:04 +0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.1-2
> 
> for you to fetch changes up to c755e39836ec492b0bc210fd96c2b720b5b4a690:
> 
>   arm64: dts: allwinner: enable h616 timer support (2026-03-29 21:20:49 +0800)
> 
> ----------------------------------------------------------------
> Allwinner Device Tree Changes for 7.1 - Part 2
> 
> UART DMA channels added for A64 and H6. Standard resolution MMIO timer added
> for H616. This timer can be used as a broadcast timer for wakeup from idle
> states.
> 

Thanks, applied

Best regards,
Krzysztof

