Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9892E33F5A0
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jun 2026 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005124; cv=none; b=I9DQ9FKzhcYJgJvwC+VXlt0Dd2Xfld7Hj2+ncN+TTn68RQ8uqxLuTOYet3gvNpCF9GDMrZQ2pT+BN4QdzxkSC9ud01KI4CFTmiZ0x2XST6kymciFc76oqLpAJivqri3xFlknIVv9SqzX1tSYBuFw5HmrqhxQLwAG/AOti+bZeRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005124; c=relaxed/simple;
	bh=qT1gAh/2yJfydzE3oHcr0+95O4w2bX3LLlw3C8FpJlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqQXkW16y+ux3EUToBsn39rqQ3u99t5Fg/qkVBy0N4zowtRMaVUF2IEcarzELk/6j2zMZyYLlCoXj/hsApkAXgN1rcKhf41HXfDZunXGlVKwcFrf+B3Rw1PHPuk+oY8kPtdfIBQg8jdRlcGRIX4EHZZN4OOrdmwIRAdHw0HuuBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zhb8Ij8T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zhb8Ij8T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14111F00893;
	Tue,  9 Jun 2026 11:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781005123;
	bh=8Kq9pjIGs4k5XRIg8S2MPS7in6Zvm8dz813etexEqlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zhb8Ij8T8ArBH7SDGoyhQpRzEkfu8n+prIpwV14sOpuYTah5F5worInEqZIu2tGim
	 lMziWyx3GFhQhyPmu2G4h1oUZSIfzV7br9w8uaoeglhGGt677dUNDgLhFjXL6dadGU
	 wyJgzgX3vKpT5F6pKmLo+ffpohejn6raoXz0c8if1APUowHTok0M2qQGEFzkNgT954
	 yUw6YfBTxUs/802RoHOvqfAiPcWOXxZgX2c5CF+SWwCjyEXKIncYvvpFTlXJBlJVT7
	 gzlTe8vUQURw28EpN6OoccewGnZkEHiwJtNoC1+gJNgQTxoKa7MWB+Kuayp5Ne58wS
	 3Uz7YXBfzwH/g==
Date: Tue, 9 Jun 2026 13:38:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Allwinner Driver Changes for 7.2
Message-ID: <20260609-woodoo-tremendous-beagle-15cf3a@quoll>
References: <ah3YkTZAR2GXlC3x@home.wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ah3YkTZAR2GXlC3x@home.wens.tw>

On Tue, Jun 02, 2026 at 03:08:01AM +0800, Chen-Yu Tsai wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-7.2
> 
> for you to fetch changes up to 61192938a5870ac36edae81e4775b680dcf02c61:
> 
>   bus: sunxi-rsb: Always check register address validity (2026-05-25 06:37:11 +0800)
> 

Thanks, applied

Best regards,
Krzysztof

