Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F72372064;
	Sun, 12 Jul 2026 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783844022; cv=none; b=JlMESno0lHJNXZCke07JClKY7azEBpiJGreVNDSlosddSOyhwZXKAQRYuNMDrl/F46f+5R2UJqlnNw8x3ZLsxGl4hO9U+P1J1Qw2G+Y7kD1od6gqProq1yIfrkWvOcAdaEKmc+O/se8H2n9qhm2+isourPrrY1aciZ5fGbZ+NB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783844022; c=relaxed/simple;
	bh=F0RaiajpXLNwAUfrnudRw99S89ZOVb5JrQsmaMpEIpA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VBXVLwIfeOcTzzXQJrhs4V5P5idGjzCh0OmZyRlG1xhcZMe+YFLDTDZ/Zs84+E0BhZrFd4fpA465b/sqUMO5SrJIEXpR63Lh9xqELAD/RjHCQSBDoud9kOgdyC9NbwZpxH9keMTjOsJALRA/julSqBVB3UXCWxOXwxjnXiXP3B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n+kNNYHq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n+kNNYHq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038921F000E9;
	Sun, 12 Jul 2026 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783844021;
	bh=fphk+f2dM59Ldtv93mnG6Q9mt0DXqELXKB1R1S/z/uo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n+kNNYHqdNVuanGKbeohlhWCGRfBntmJb5pko0uJxsGGK3m1SfkpQxiZexYQWw/+z
	 6YQZeUgTCEpFYay6LHo/fswQfxiE9VY5YKBnL/P1odJYuqlzGsHDEqg8ntvtrHRTho
	 BTaeuLePsrkM0VHxSg+Ir6loOJD1hzuqlTX0LjcXGGQsK7slceBz52vBLgHBcsWepy
	 uNNKv2NYKTBEtSyYdSWGPaQbnOKd9milfjfs3XhJnuWLYjeBlQplZpdqdawqy2w4Yr
	 xGyLQRNKC0+9xANP0TygU27vt76eexgnb05ucm4uWevjMw8L9OD/kcnsvOuWTukPzy
	 Yqhp6FCvYNplg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: clk: sun60i-a733-ccu: Add allwinner
 A733 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: robh@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260711-a733-clk-v2-1-974d188cbe0c@pigmoral.tech>
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech>
 <20260711-a733-clk-v2-1-974d188cbe0c@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 08:13:40 +0000
Message-Id: <20260712081341.038921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The conditionals for 'allwinner,sun60i-a733-ccu' and 'allwinner,=
sun60i-a733-r-ccu' fail to constrain the array lengths of 'clocks' and 'clo=
ck-names', leading to incomplete schema validation.
--

--- Patch [1]: [PATCH v2 1/8] dt-bindings: clk: sun60i-a733-ccu: Add allwin=
ner A733 support ---
commit 8cfed61380df8be01d658a1c9e237ca6deace817
Author: Junhui Liu <junhui.liu@pigmoral.tech>

dt-bindings: clk: sun60i-a733-ccu: Add allwinner A733 support

This commit introduces the device tree bindings for the Allwinner A733 Clock
Control Unit (CCU) and R-CCU. It transitions the root clocking strategy to =
the
"hosc" clock and expands the clock tree outputs.

> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun60i-a73=
3-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun60i-a733-=
ccu.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun60i-a733-ccu.y=
aml

[ ... ]

> +  clocks:
> +    minItems: 4
> +    maxItems: 7
> +
> +  clock-names:
> +    minItems: 4
> +    maxItems: 7
> +
> +required:
> +  - "#clock-cells"
> +  - "#reset-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun60i-a733-ccu
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: High Frequency Oscillator (19.2MHz, 24MHz, or=
 26MHz)
> +            - description: Low Frequency Oscillator (usually at 32kHz)
> +            - description: Internal Oscillator
> +            - description: Low Frequency Oscillator fanout
> +
> +        clock-names:
> +          items:
> +            - const: hosc
> +            - const: losc
> +            - const: iosc
> +            - const: losc-fanout

[Severity: Medium]
Since the top-level schema defines maxItems: 7 for clocks and clock-names,
does this conditional block need to explicitly define maxItems: 4 for both
properties to prevent up to 3 extra clocks from being silently accepted dur=
ing
schema validation?

> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun60i-a733-r-ccu
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: High Frequency Oscillator (19.2MHz, 24MHz, or=
 26MHz)
> +            - description: Low Frequency Oscillator (usually at 32kHz)
> +            - description: Internal Oscillator
> +            - description: System 24MHz Clock
> +            - description: Peripherals PLL 0 (200 MHz output)
> +            - description: Peripherals PLL 0 (300 MHz output)
> +            - description: Peripherals PLL 1 (300 MHz output)
> +
> +        clock-names:
> +          items:
> +            - const: hosc
> +            - const: losc
> +            - const: iosc
> +            - const: sys-24m
> +            - const: pll-periph0-200m
> +            - const: pll-periph0-300m
> +            - const: pll-periph1-300m

[Severity: Medium]
Similarly, does this conditional block need to explicitly define minItems: 7
for both clocks and clock-names so that incomplete nodes with as few as 4
clocks are rejected by schema validation?

> +
> +additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711-a733-clk-v=
2-0-974d188cbe0c@pigmoral.tech?part=3D1
