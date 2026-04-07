Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360DC39EF10;
	Tue,  7 Apr 2026 17:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775584211; cv=none; b=ZkWgT+184Uo/L473kbA3bkdOkgDXIswqiyyTF8TX4ctUrDgq3aNJHneyLA68VHjlKxVT4FENVIQI8Njk6/x0K4oagH3Ie36Vj9cYtQ5Ca82SGgfUytYsbBjD5+Pe9hB5NLT7g4/leaLtZZyWpYcRyEyDussKvbRHm11GA3loG0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775584211; c=relaxed/simple;
	bh=bk0t9JxzLqimVaNqYIGraaIcJm28+bUHxoQt8DKwcns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXyK5xPd2UaHDgm828wSy/QIH0p+wMJ7WJNK4iA+vppu2s7K5RB7pVre3G2YPtyMQYSwYMSt2j6FQZbnMxhiJ1G64wRnOHJZKBTG6dvdsuCx4outYhqhStcYagk2cnzU9InjWoodVMaNANL912dnM28sMnape0afMkYJQMG63Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrOmdQNY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrOmdQNY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1ABC116C6;
	Tue,  7 Apr 2026 17:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775584210;
	bh=bk0t9JxzLqimVaNqYIGraaIcJm28+bUHxoQt8DKwcns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PrOmdQNYO53qMjFtef+XyTituPTiiHQwEslqk4MDJDPSCyNKJxCq4LBvL1fVBeVeP
	 0iiVTlFF2BfKL9g/MVZ3SNgAVkYJ7PNZtNxvhGff7VzyKIvJGCXAKAp7OBqZXvg3Bk
	 a0msLbwpVJJB5thd22ZLzQ33LUdW2E88LqF5HEAb6xzmYj0anyDe5Nnde1kDDXMY3n
	 jZe39fXIftfiruB/yPIY0D1wr7fguQxtXsUIv+b2PSq/J/ym4P++pp6IL41/JNSEVM
	 DjgMaf3kn2ycx/GDaIhnP8866v9/kQ4jVabNVHSWlVq/d3R5DbQeNi7UpbYYx4IMa7
	 xrJPO8ninRv+Q==
Date: Tue, 7 Apr 2026 12:49:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/7] dt-bindings: sram: sunxi-sram: Add H616 SRAM regions
Message-ID: <177558419254.3168496.8723941339416449025.robh@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324164357.1607247-3-wens@kernel.org>


On Wed, 25 Mar 2026 00:43:50 +0800, Chen-Yu Tsai wrote:
> The Allwinner H616 has two switchable peripheral SRAM regions:
> 
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
> 
>   The mux value for this region is different from previous generations.
> 
> - The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
>   KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
>   CPU access is disabled, the whole region reads as zero, while writes
>   are ignored.
> 
>   The mux value for this region is the same as on the A64 and H6.
> 
> Add compatible strings for both of them.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../bindings/sram/allwinner,sun4i-a10-system-control.yaml    | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

