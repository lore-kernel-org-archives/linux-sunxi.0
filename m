Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D353BA244;
	Fri,  3 Jul 2026 10:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076166; cv=none; b=Ky8UwBimyFo1fZu7d+LfPLN3VTGDzbTGXEhuEF5ySHLpPHOhHrxPSQctM0LSmIF4KpnabjTpIM13tbLV3PlqAPYfuW223iCYyayTHLVIQklKgWajwFd8aYCde5E76sgFa5yPcgAeXtzVkMTvNisDwH3IsZTiIoPKsDLU135Yodk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076166; c=relaxed/simple;
	bh=UoDRAB99WvW2PEtIjdUayfbFXFOPEZ9eBEzLnzjtKOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSUaGcADaxApyBqkA60ZTx2BOvTNoYmTMvmYI702CVb2bP2KJDLVuEGwxKlkvVaGwUo8BALZgDTX5IJC/DT9BqvOS/zcpmCKVO0Q6mFlCk8sGX5dtJlSWZMXv3Wj0ORQXWJ9/WRqiorPGSI9Eyp6MxnRZSNCoyP+bQVJdDWuPIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKi35CdV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKi35CdV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C577F1F00A3A;
	Fri,  3 Jul 2026 10:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783076164;
	bh=mhfiHCKdYvrlYZO8ujaC1v3Y0eErVrUk0qO97RPQE08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MKi35CdVFHIEik2dQrgbSGfmmclJyVDVZtQeqE2EtxE5Am9uNMzvkasxkWaQRCA3D
	 GJ8UqFKmrqtmumL7Ce+KkcRmnNnuQFh8+u20PcceWaghv91cxJgmPcO1CCmeaQD3T/
	 1Ss869E2aDVXG3TxZu/3GO+GRUsQ+lQafRv0OGIsP+raTASS1UAVsm2M18cebtqJOw
	 /Uc4M0wHquEWB4q6+QhaH1beWx1PJIy8tKWJ4aAiGGD2RNtnymPE/UcB0OfkZtdBLt
	 ZE+QG9aa4S5/z1fD3mxghDvvprTnsRmk7T95D1apC44vXfpWW3UquSmWtrvw5lpR7l
	 qcK9Y8+wpXP4Q==
Date: Fri, 3 Jul 2026 12:56:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523
 compatible
Message-ID: <20260703-versed-locust-of-agility-d76fda@quoll>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260702214750.3428694-2-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702214750.3428694-2-utilityemal77@gmail.com>

On Thu, Jul 02, 2026 at 05:47:47PM -0400, Justin Suess wrote:
> The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
> It is not backwards-compatible with the A31 programming model: the
> control register has a pulse capture mode field (bits [7:6]) that
> resets to a value which captures no pulses at all, and the sample
> clock divider is now selectable via SPLCFG bits [1:0] instead of
> being fixed at the old module clock / 64.
> 
> Since a kernel driving it as an A31 CIR receives nothing, add the
> compatible as a standalone entry rather than under the
> allwinner,sun6i-a31-ir fallback.
> 
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> ---
>  .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> index 42dfe22ad5f1..06656058ce91 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> @@ -19,6 +19,7 @@ properties:
>        - const: allwinner,sun4i-a10-ir
>        - const: allwinner,sun5i-a13-ir
>        - const: allwinner,sun6i-a31-ir
> +      - const: allwinner,sun55i-a523-ir

I assume you are adding it in expected order that Allwinner is
following, not just randomly at the end of any list.

Also, please change all above entries to one enum, can be the same
commit.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

