Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEBC2571DA;
	Sun, 12 Jul 2026 03:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825696; cv=none; b=nuKLTo1RgOkziTrjOvUZz94jNfAIIxxeZATjP+Ff/yFD1dShFMiUQi+c8e/UJno0UAAZGTKeMcCJ7/HI5sfomDcYKzuL6MYSkp88tmEGx74NymIxn+UGNh/kiFlLlTkeQs9CEgMo4I677LufVaYVl76JI3LpK5RPHDtWVQcU2bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825696; c=relaxed/simple;
	bh=nTHjrOea7tNTSIp8XSTXGm4swmE50SAcg1Jv2rTRUnw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GwbXGDha8c7/VH+WwJsjZTHCYSQ86MvR6X1QepEm78PH/SLFpCZlpGyV8TRjP3P5XeCEBotsDY8gF5/MhegIhYCbjIplNG2yDat8cAqjQi/zTiFJLrxfFymoyvBb2AlE0/zgi2tJQn5ycG2ulmYajpncDQ5rv3WNgmdDkmjZUPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQgvo/Pj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQgvo/Pj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE131F000E9;
	Sun, 12 Jul 2026 03:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783825694;
	bh=gj+O89fkF32ouaggYD5buPKjloeOq9KN7CkvDgasbWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fQgvo/PjtVcr44It1Bs9Zs6fQFdc/k1mXuR8z6UAjk1a0yD3wFMVRoN/8s5/9bfsn
	 UBgAWJyqXcHEqCU+LOoxpmDzRpGyY0Dq1ntlba5dNRLYC5rSzK1e27J+PCeWLodVdh
	 eDDCDmKJhg1hIHZCY/ICqJgTtD0ZTTHxCAgdHjN7I6yhutUCmPEKC1kEuQoz5/vucq
	 PosKB7OevKSZSllMyQ/1MQHzi5X5FDG+6RU+/sGdvwmi2cCwFY9V4mIDs+//dOcQy/
	 xqWQZVa1Zveiqq0Qscj/cDW/eROXNf6q/vg7vxN4VYZOad79liTeWDEWfOBja575gl
	 8ylJTlwQ9Aljg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: media: sun4i-a10-video-engine: Fix
 IOMMU count for H6
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260712030011.3778169-2-wens@kernel.org>
References: <20260712030011.3778169-1-wens@kernel.org>
 <20260712030011.3778169-2-wens@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 03:08:14 +0000
Message-Id: <20260712030814.8CE131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Validation failure: sun50i-h6.dtsi fails dtbs_check due to the new =
minItems: 2 constraint.
--

--- Patch [1]: [PATCH v3 1/7] dt-bindings: media: sun4i-a10-video-engine: F=
ix IOMMU count for H6 ---
commit 17817354e28859038f6eb81e492f4c4b1bc51a02
Author: Chen-Yu Tsai <wens@kernel.org>

dt-bindings: media: sun4i-a10-video-engine: Fix IOMMU count for H6

This commit updates the device tree binding for the sun4i-a10-video-engine =
to
specify that the H6 SoC requires two IOMMU connections. It adds a condition=
al
schema block enforcing a minimum of two items for the iommus property on H6
devices.

> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-=
video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i=
-a10-video-engine.yaml
> index 541325f900a1d..b4c0fabb38211 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml

[ ... ]

> @@ -72,6 +75,22 @@ required:
>    - resets
>    - allwinner,sram
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun50i-h6-video-engine
> +    then:
> +      properties:
> +        iommus:
> +          minItems: 2

[Severity: Low]
Will this strict constraint cause dtbs_check failures for existing device
trees?

Looking at the H6 dtsi file, the video-codec node only provides a single IO=
MMU
connection:

arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:video-codec@1c0e000 {
	...
	iommus =3D <&iommu 3>;
};

Since this commit enforces minItems: 2 without simultaneously updating the
device tree, will it cause make dtbs_check to report validation errors for =
the
H6 SoC?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712030011.3778=
169-1-wens@kernel.org?part=3D1
