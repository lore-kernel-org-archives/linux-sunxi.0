Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A32546E00C;
	Wed, 23 Sep 2026 20:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195569; cv=none; b=lc37tM0yWYZS/f0u5Y0hXxDIsWNGE4xkB7eRyXsPLZOjrGBBCfD6Y3sCKcXJ1RH0aBQQIzWtaD779ADUhzaKAG4re+ybFaJLCRBByqwbLzJh8P2abYsqDoPOBP4U3/PH0FxgD/kadgfWH931id9mtIvR7F65qScflMXtm4K+Xww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195569; c=relaxed/simple;
	bh=jOIuBSDLgqnq5i3O+mOpZQVHELyojHFL+19pVrMlFLY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OFZKvBWYAxSUvikGe+gje9MuTeiYYikC9BYku/NgloIqdlreIyHzq8Z50HAl/Un1e/H8OGg+PUH2g8ybaN5KpeCBD95QH/bqtrK2IVYBfKFTbx850klrij5/SVFLwmuMYiZwFa+WQADf9Y0zeKdJ2pvQAbVIlTY4oL+SnwAp5HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjhnE3Tt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjhnE3Tt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50001F0089B;
	Wed, 23 Sep 2026 20:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790195567;
	bh=61hWGlGnxUyjZcUGCAvzN827u9qnq9cpQsPStC0wlN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NjhnE3TtRqS0G0s1s5niDKm+TrZL8aV1wZw//YP2RpQmHv6L+Yg8gseEuX481RcR6
	 7ZscIkM+OFTsLvWUhR9DxPYYvRQMtCv0/uJ8SQycWzf40BFwrv1+aY1stpqLI+dSw2
	 BdvEaz+deH9pjy6FqFBkL/f3oZkucbb2+94jtgWPm0QO+lNJ25Te5yxZsj0ahPAAK2
	 EsQPddJVoVpTZLjhVQQukelHPv4DiQV6e9yMT05FZWFmr5SHv1OiR8qz3RQekDbQJ0
	 Ohsbq+rVIz6Bk65AQ3ZW3cIFKhlj7+FxloK1kxfcEl60U03aNNfPZt7+eYOELjkWCj
	 R7XWtJT5n7blg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 03/11] dt-bindings: pinctrl: add Allwinner B288 pin
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260923201701.43391-3-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
 <20260923201701.43391-3-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 20:32:46 +0000
Message-Id: <20260923203246.D50001F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: pinctrl: missing reference to core pinctrl schema
- [Medium] dt-bindings: pinctrl: missing input-debounce breaks sunxi standa=
rd feature
- [Low] dt-bindings: pinctrl: missing minItems: 4 for exact interrupt banks
--

commit f5fef062c858980d1528aafec20b7e540cfb4cbb
Author: Pablo Mazzini <pmazzini@gmail.com>

dt-bindings: pinctrl: add Allwinner B288 pin controller

This commit introduces device tree bindings for the Allwinner B288 pin
controller. It defines the required properties, clocks, interrupts, and
provides an example node.

> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b2=
88-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i=
-b288-pinctrl.yaml
> new file mode 100644
> index 0000000000000..806da97ab708a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinc=
trl.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/allwinner,sun8i-b288-pinctrl.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner B288 Pin Controller

[Severity: Medium]
Should this schema include an allOf block referencing the core pinctrl
schema? Omitting the core schema reference while using
additionalProperties: false below causes schema validation to reject
standard pinctrl properties (like pinctrl-names or pinctrl-0) on the
provider node.

[ ... ]

> +  interrupts:
> +    description:
> +      One interrupt per bank of external interrupt capable pins.
> +    maxItems: 4

[Severity: Low]
Could this allow device trees with incomplete interrupt configurations
(1 to 3 items) to silently pass validation? If the hardware requires
exactly 4 interrupt banks, should there be a matching minItems: 4
constraint alongside maxItems: 4?

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false

[Severity: Medium]
By setting additionalProperties: false here without defining
input-debounce in the properties block, will this prevent device trees
from configuring input debouncing? The sunxi pinctrl driver expects and
parses this property for all SoC variants with external interrupts, but
this schema will reject it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923201701.4339=
1-1-pmazzini@gmail.com?part=3D3
