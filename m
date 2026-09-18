Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679EB38AC6A;
	Fri, 18 Sep 2026 06:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714522; cv=none; b=geOiqo62gwtiUuRuUc8JX591aOaXbFg1vLG9JcwS6F6P8mkcmFKu/0EferdCpsLbWy2xebSeeIx30yRFuqnpdtWh+iJwed6U6wwtS4X+Us3oLvEVYUfEP4P+zwq4CrxAcKiRTcu5lO/Rrja6BKP4ZYi6vKF53bTKUZvy3ABkxDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714522; c=relaxed/simple;
	bh=oA8FmH18B6pncvjsfjN+3Pv8ZqlIbNPmbiwHMeJByQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6v+teOtmAPyoctv28upUEcse8aw0A7KP/+S+SEOm2Ry+8jnNHvDX1mAI9jdryw/o5l+L+KayUGg815W9tQnqGDlD+KCuPOoLl9MbzjwTOlFJ8G63PF5UQjpDJ7P6vr/mDodiFrPDuqO71VX+jgKyvETfs7Jjxhvye1gwnyf3m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmdIBBpw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmdIBBpw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F741F000FF;
	Fri, 18 Sep 2026 06:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789714520;
	bh=1lErpeanYkiiyTk05YncZPzVNpVCY4t4tvDm7+iexYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KmdIBBpwqSdfeAt3llCnP2Gft/imLtZNd5VBAsvuI/TeFuXVzttJqitdUdqmkfuh5
	 cpyZBko5C7o1jdTZTbfAhpAejknzy+BBi1TpK4E+IANQtUGvqga4aWTJGY/cHGcgIm
	 ulyq3m9dMUC8vBEr7svYQmVMlAMO/luOuBVPSg1hE4ARhKgxTzczynANnfTwYp+eM/
	 ev3iVLSUkez/xOVeOsXhIs6EVbN5QDTdyqjCqev7VfX1dDIPUElVGjONImEGV2mYSQ
	 4r80nLyVT04dm8t3CdwR6qk6VmBieEIFJpu1zK8b5ZnZoIz8s2Ffk7BIqxEnXc0+uU
	 +EvHTpY+wHuWg==
Date: Fri, 18 Sep 2026 08:55:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add two Teclast tablets
Message-ID: <20260918-exotic-illustrious-cricket-3cbbef@quoll>
References: <20260914210115.28151-1-andre.przywara@arm.com>
 <20260914210115.28151-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914210115.28151-3-andre.przywara@arm.com>

On Mon, Sep 14, 2026 at 11:01:14PM +0200, Andre Przywara wrote:
> Teclast produces some entry-level tablets with Allwinner SoCs, typically
> featuring a new SoC early in the market.
> 
> Add the names for the Teclast P80 tablet, with an Allwinner A133 SoC,
> but also the Teclast P85T, using an Allwinner A523 chip.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)

As discussed, Sashiko's comment is not really applicable, because we do
not add fallbacks to match driver behavior or to achieve some desired
driver feature.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

