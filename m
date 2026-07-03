Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D114041734E;
	Fri,  3 Jul 2026 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092392; cv=none; b=Do9hxGuAO1bVDj6AXFeSXMuzqcr6ihWAPZ9vMkLRG9d3AB5g8XU3uwT2nytFrWQxoW6+wy4ycU5DH3f0keiQ8OVVczCCnC2jExpPYzTmah8nvGErdkudF/kHXp1Iyw0CT9+vp86sD11RGiNNHBFmjwUa1dWiJLQA4UiEtScnxAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092392; c=relaxed/simple;
	bh=jNsOkMvAbe6OeR60F6oK7IXUHiY7gkhqpYS/Mz86qVw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qiBJHbikQkWP+OgDENGu7kehfQ8uBjzdRC4h0IkcjalTAsYYx7yIePFfGm5wFnSJHL22oIAS1fS2u12gsxJosWpwN+ztOs1KDvk3FaREUbx5Y8p5K8CDGY40nYD9NKkIeoxG6O/ubin0ZC8c2nuocF79uI+zEeyuOnTQKgmU+ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0MtM+oa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0MtM+oa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305511F000E9;
	Fri,  3 Jul 2026 15:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783092391;
	bh=4CdOEYbJivtsUlimSZnXUz+KiLsZc2Vm+jKMEa9rKz8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H0MtM+oa19RttLAOBFGMLovJR/t/DPU49NNONtgRN+SSuk7Mb3uflus+zOjZTJMDx
	 /hChFnnbN78osufPmVuvBMNcHW63h0g/el4GN4ojZJv+2nRi6pl8GdM78+ZjLktDJo
	 kHLQneCcXGXhy547cGmT7FgDvmafxUYuj5kDuxMgm3PnTkE4gIDxPWCOLa7u0vGt8m
	 v4sq+VdgB5Q7FUCXxxzUhg0N7RR+s+TWongsgcghxOX+pBh4NEONbDnk7Ttdt4Nl3T
	 8DE1gxBf9BC+TV74aBqkApfyl4TRUelo8KD4MrxYxPmpPgdXPkT+AU7sIKoD4FU+0e
	 5fqQzV3sty8Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/4] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Genoud" <richard.genoud@bootlin.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260703152215.192859-2-richard.genoud@bootlin.com>
References: <20260703152215.192859-1-richard.genoud@bootlin.com>
 <20260703152215.192859-2-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 15:26:30 +0000
Message-Id: <20260703152631.305511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `#clock-cells` property is missing from the `required` list =
for the `allwinner,sun50i-h616-pwm` compatible.
--

commit d7a701d864bf3d5f7e7d179d4498b5006b8bf3f7
Author: Richard Genoud <richard.genoud@bootlin.com>

dt-bindings: pwm: allwinner: add h616 pwm compatible

This commit introduces the Allwinner H616 PWM block to the sun4i pwm
binding. It adds the new compatible string and handles the new clock
provider capabilities introduced by the H616 bypass mode.

> diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pw=
m.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
> index 1197858e431f2..4f58110ec98f7 100644
> --- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
[ ... ]
> @@ -83,6 +89,17 @@ allOf:
>          clocks:
>            maxItems: 1
> =20
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: allwinner,sun50i-h616-pwm
> +
> +    then:
> +      properties:
> +        "#clock-cells": false
> +

[Severity: Medium]
Should #clock-cells be added to the required properties for the H616 varian=
t?

The commit message mentions that the H616 PWM block can output a clock
used as an input for other devices. While the conditional block above
correctly prevents older hardware variants from using #clock-cells, it
appears to leave the property optional for the H616.

If a device tree node for allwinner,sun50i-h616-pwm omits #clock-cells,
it might silently pass schema validation but fail at runtime when dependent
subsystems try to use it as a clock provider.

Would it make sense to add an else clause here (or a separate conditional)
to explicitly require #clock-cells when the H616 compatible is present?

>  required:
>    - compatible
>    - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703152215.1928=
59-1-richard.genoud@bootlin.com?part=3D1
