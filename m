Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763E342A95;
	Fri, 21 Feb 2025 23:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740181470; cv=none; b=lKP56KuAg99sWHVckha2wtXNhgGFs2FEiKwzgEuDSEvR1RXJN4aQgQFj7x1RM06TSOX5BwqXz6qGjEQ/Jwiby6NdscESRob+JQXuvDJTpVURbwUWm7zRykm4uQGDCFMjTtTUmYnH5kl1TA0yU9er2GpowiTql2ujPaacYuTYMBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740181470; c=relaxed/simple;
	bh=vFGP5lZIH+gffNa0hxiFJK7yHkXmM9iUr069pf8053Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OI13lXVfRDgR1f78YA25gfAIV6pb9hIiD6x1P88p+JDPp/jKJFkQQQNEGt0pfoeQRvwbAEBPJ1Pt01fG6F6ixExNRrBxKLXQRM+qqxXwBU2q9ZXZEYlq9iKaylFzfSUOwdq1SCvBiPzlXxC9EVyX3OSmo6T0xcTzs4u1AM7S8Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ry6RJQ9I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ry6RJQ9I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C3AC4CED6;
	Fri, 21 Feb 2025 23:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740181470;
	bh=vFGP5lZIH+gffNa0hxiFJK7yHkXmM9iUr069pf8053Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ry6RJQ9I9XF3cINl85IOOQ/E2IAp83B8PsWIpVMktzB8xj49BdNgg9pGBkhuwnjwN
	 2vLwB1V1VhXIidjViE+nhTgubpBEMrqSHWUfK4RfB1355nPwg+g8hwfWtWUQoDdbLq
	 WjscZQvKDjJ49EUCHlH5PNJU9ZB8ZwE4b7VZ/tgInykkClsgr0gFweLIDarFgbvWP1
	 icUxa1ucRgYFWmygPL7U3h6fLsFQZ5HIH4Yqq/CE0JkhkEqTClwQFgPYtOAG0TjbuU
	 UbJ/HLCYirezkATZHGAAnnSHSNyKBb4i+41LCAVts1mCud9PSu6kSUbowhjmbFfh8L
	 p8Z5FOjnJOtrg==
Date: Fri, 21 Feb 2025 17:44:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add YuzukiHD Chameleon
 board name
Message-ID: <174018146811.396109.10176717812055404887.robh@kernel.org>
References: <20250221012038.13706-1-andre.przywara@arm.com>
 <20250221012038.13706-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221012038.13706-3-andre.przywara@arm.com>


On Fri, 21 Feb 2025 01:20:37 +0000, Andre Przywara wrote:
> The Chameleon is an Open Source hardware board designed by YuzkuiHD,
> using the Allwinner H618 SoC: https://github.com/YuzukiHD/YuzukiChameleon
> 
> Add its compatible name to the list of valid board name.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

