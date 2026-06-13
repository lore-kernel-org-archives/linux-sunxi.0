Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85626324B32;
	Sat, 13 Jun 2026 18:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781374930; cv=none; b=ddawDwB+lFskkp1NbBV2azzP6ZK85urjUbzO50+ZPFGuEKFPVPYsZA1Zi1UgwvAIbq4Zc6YMqtxltFaCm2s1RGKWhG5GOH7gGwPmEmE9hMvTxt6QP9+vUfzO2w8AvPs2u57v72HCo6oWTchhWR4J86rQVK6MUDMXSN7lm3t43ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781374930; c=relaxed/simple;
	bh=/tR1D3Y4OcnKt+Pl/J6KzJ1fOTwDJvC0hgGxqZJ02CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCLrnk1F+mBvaLx3Zn0iBtaJEAw2HACzFqvzVohdbyAcDeowKco6DKzNWns3lgYq/BeFKWx4PE8LaYJ8hiL9/ApNI2hCz479nrOQcDCevmnVU3nS1yJJZvUubps4FIWUcPN9spbqu8YAVb7R4TmM6ghhAaA9NcBT2rkv+L1672U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2VRrt7n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2VRrt7n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A701F000E9;
	Sat, 13 Jun 2026 18:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781374926;
	bh=QkmQTRplbsLlEClWTl73mtbbWAT8kZOj5ikRmo3uU40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D2VRrt7nt9cNV/eOCD6SFCixxhe68HLs4uNnaooCtlfcHq+uQzsaWMH5MXXBEtuh+
	 Sr8qcIG7kGThYACBkulN5Tgyr44bvXncdSBwjS7ehOjQ6QOghey6Debzld98sCa5nI
	 UlidaHCmomY6ENn4AzLYHXqSFfEajAJUaxqV4SJpawaZqskSSXfRE2VZmNmu3i3wd5
	 o+tftEjg2JIFeWICJ4ntJMRF5/b6xYaVK554aBkGqqW+Ugt0G/RJV9SSUp/PEegc0H
	 raTpvbcdTPpag2kChOE3iWajrHjcAeqd/ACzooLR1Q2Q0XXlJimaLxUm2GP61OB6zc
	 Fvn0dVTFZcB+A==
Date: Sat, 13 Jun 2026 20:22:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v10 4/6] dt-bindings: sun6i-a31-mipi-dphy: Add V3s SoC
 compatible entry
Message-ID: <20260613-nondescript-sociable-goat-aee13a@quoll>
References: <20260613152655.212490-1-paulk@sys-base.io>
 <20260613152655.212490-5-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613152655.212490-5-paulk@sys-base.io>

On Sat, Jun 13, 2026 at 05:26:53PM +0200, Paul Kocialkowski wrote:
> The V3s/V3/S3 comes with a rx-only D-PHY paired with the MIPI CSI-2
> controller. It is compatible with the D-PHY found on the A31.
> 
> Add an entry with a new compatible and the A31 compatible as fallback.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> index 6a4fd4929959..3ca1a1c47032 100644
> --- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> @@ -21,6 +21,9 @@ properties:
>        - items:
>            - const: allwinner,sun50i-a64-mipi-dphy
>            - const: allwinner,sun6i-a31-mipi-dphy
> +      - items:
> +          - const: allwinner,sun8i-v3s-mipi-dphy

So that's enum with previous first entry (50i-a64) - same fallback.

Best regards,
Krzysztof

