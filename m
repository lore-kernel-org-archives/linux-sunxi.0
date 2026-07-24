Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BAD1624D5;
	Fri, 24 Jul 2026 06:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784874000; cv=none; b=YS+kWMD2TkDKEzukfs+CpT3WyuF2I5DHQrONj1Na3SmSLvHGbWeCtthdgoWS1Kl6WEq21rVQE4UsoY/AcgSZZgY9P3M+JeEA6GLEhwTNH9C6TKcr1ogQ7LVJSeS2XD+dKmB6yqlC0u4Cg+mQAfo5z9PA0Hr7FUOi6yqIO9cQUAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784874000; c=relaxed/simple;
	bh=YeZuo0au8HvrszcLo1X08d/qdYTpesbp9JqEE5Rd15c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOmkXnuAtYKF6XgdeFq+2qQJNQaFeQYns1jpCfpNP6TC2ar1e8aft44XaJTSmtC0xyvXkWf6bO+91CkBqtO8JHfrmJZeOO87nhCK7bzATPQagd9lQlDXLE+buTCeso1Lgg8/Qo25qmkrON8kKC2wiB/RpzQlrJg1xp86lMIlbC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0gN0J2l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0gN0J2l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1F01F000E9;
	Fri, 24 Jul 2026 06:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784873999;
	bh=Exa1hT4lyAMl6ElDEjoYoBI3w7ORVJ8MGtlHgXfsTh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g0gN0J2lXQv02MW8OwaaXQwLi/uFxKjKnuqyfDUWq29a5aaHrCSiJbOpgjTMVHf1d
	 smacrWic7PP2sT6cxGTCX9Cno4b7k3asKQDRhV6C+00+KEDP4OA27iUXrJipsgl4VP
	 UZDOy7qR0DfdFRDsHy4mY0bYDcUQ4l+wV1+Jn5Fv0Afdca/Jkv/gHdZPvDaOGUcoEI
	 HAvyCBESBvDwX2l4VNlb6E7ZI3OsjgUPIl4/oDh3n3hxFjVu2F1WWjaAM0UJ38mH8M
	 sgYcZ6lOdPVdrOMa0QRM6ypM5HDd5kLI52FVIQONTtbrUsKElBKZ4pPGhm13rMIfoE
	 03wK//TrHEBBw==
Date: Fri, 24 Jul 2026 08:19:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add
 A523 compatible
Message-ID: <20260724-outrageous-leopard-of-diversity-fe365c@quoll>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
 <20260722233604.3001063-2-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722233604.3001063-2-utilityemal77@gmail.com>

On Wed, Jul 22, 2026 at 07:36:01PM -0400, Justin Suess wrote:
> The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
> The reset defaults match the fixed behaviour of the older IP, so the
> device works fine when driven as an A31 CIR receiver.
> 
> Add the A523 compatible, with allwinner,sun6i-a31-ir as the fallback.
> 
> While at it, merge the standalone compatible entries into a single
> enum.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> ---

Your changelog must mention that you dropped tag and explain WHY.



Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

