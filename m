Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A6F317161;
	Sun, 27 Sep 2026 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790522877; cv=none; b=vGkzfrl0c/PkQtoQyO8qjo9JLcMUnsjPFUA13EfcYjesKDMX1DlVIllq5t9gGZ++sgwuuge6AJcBzC6ySeDrE3TraoIjtr2VO3S07YfHeMeefB2Ny/2YPp1uRrnkzkPtn9xAaj/FN1hTf61wZsqhiDSi75GsJX7CrqoiZyAOgpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790522877; c=relaxed/simple;
	bh=umAKsrYOimrey+7DlHOBRJf2uKqinTkYUMHVpnkfyLc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NAo3UMEj7BFr51McNuoKTZ6b2323tDBsNZqcnxJWA22JH6XOieCdWEnO2CTBnrkCwrOx272wM+Eaf6l+3MsmS2bwvkHK3LQijDz3KRyi7qTSrYj4yu+PHmADuA0SQ+7/pNLioFXfQlX7SXgnxAwUF9pE3Fap4wlHy5F87+2awyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzZic+ks; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzZic+ks"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CC01F000FF;
	Sun, 27 Sep 2026 15:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790522875;
	bh=6xmAui2j7xcWTotZik3JCgtKSli8VjA9OjTYtQGSzJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AzZic+ksAuPYTqB64Kqh8k7dFJataPLPvYJTVj5LSd2RYXgUq3R8Z9OsWQcmY322v
	 q2b2VKGxgeO4t9KW4fhGaDDUOU/VMkSqm6GlzBku0bBYe5PnsiCf5QmimXdRvvv2xB
	 fI7wrJAJLSwn/fGWJcQT/unXsJ9XwpxcSsMhxz2Vy/UprJaEaKPt3WMp+qbQ3L2IgL
	 NHnzd7Jir+2HEg0y5W80/yMKwih+rFRsbFV7+tq+aG73VIV5GZoVLT7PgqgALSK+Rm
	 2D/yAnS3POG9bCkIPWXAs5qYU9N8UFCux/pAcn+1hyjksLQUxVmXJ7zahsLdNLUHNq
	 RHZ+w4mwgDVkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260927151016.186493-11-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
 <20260927151016.186493-11-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 15:27:54 +0000
Message-Id: <20260927152755.48CC01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] rtc: sun6i: missing clock provider initialization for sun8i-b288=
-rtc
- [Low] dt-bindings: pinctrl: missing interrupts array constraint for sun8i=
-b288-pinctrl
- [Low] dt-bindings: pinctrl: allwinner,pinmux property allowed across all =
sunxi SoCs
- [Low] dt-bindings: rtc: missing clock-output-names constraint for sun8i-b=
288-rtc
--

commit 52bfb11b9f38d6aaa40748a8fbc5e4f1f1b2ec66
Author: Pablo Mazzini <pmazzini@gmail.com>

dt-bindings: arm: sunxi: add PocketBook Verse

This commit adds a new compatible string for the PocketBook Verse (PB629),
a 6" e-book reader built around the Allwinner B288 SoC.

> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
> index f04db28c630ac..f66c681d3788a 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -811,6 +811,11 @@ properties:
>            - const: pocketbook,614-plus
>            - const: allwinner,sun5i-a13
> =20
> +      - description: PocketBook Verse (PB629)
> +        items:
> +          - const: pocketbook,verse
> +          - const: allwinner,sun8i-b288

[Severity: Medium]
Is there a missing clock provider initialization for the sun8i-b288-rtc
companion driver?

Looking at sun6i_rtc_dt_ids() in drivers/rtc/rtc-sun6i.c, the compatible
string is registered:

    { .compatible =3D "allwinner,sun8i-b288-rtc" },

but it lacks the necessary CLK_OF_DECLARE_DRIVER() block to actually
initialize early clock structures. This omission means the RTC driver fails
to register as a clock provider. Any driver attempting to acquire <&rtc 0>
via of_clk_get() or similar will trigger an EPROBE_DEFER.

[Severity: Low]
Does the sun8i-b288-pinctrl compatible also need to be added to the
interrupts constraint block in the pinctrl schema?

In Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.ya=
ml:

  - if:
      properties:
        compatible:
          enum:
            - allwinner,sun6i-a31-pinctrl
            - allwinner,sun6i-a31s-pinctrl
            - allwinner,sun50i-h6-pinctrl

    then:
      properties:
        interrupts:
          minItems: 4
          maxItems: 4

This conditional block restricts the interrupts array size to exactly 4.
Without including the new sun8i-b288-pinctrl compatible, the schema permits
incorrect interrupt arrays (defaulting to 1 to 8 items) for the b288 pinctr=
l,
bypassing strict validation.

[Severity: Low]
Does this allow the b288-specific allwinner,pinmux property to leak into the
global sunxi pinctrl namespace?

In the same allwinner,sun4i-a10-pinctrl.yaml file, the allOf block includes:

    then:
      patternProperties:
        "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z0-9][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*=
?-)??pins?$":
          required:
            - allwinner,pinmux

This makes the property required for b288 without rejecting it for all other
compatibles. Adding the property to any non-b288 board device tree would
incorrectly pass dt_binding_check. An additional conditional block rejecting
this property for non-b288 devices must be added after this block to prevent
schema bypass.

[Severity: Low]
Are we missing a clock-output-names constraint for the sun8i-b288-rtc?

In Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml,
the allOf block contains constraints like:

  - if:
      properties:
        compatible:
          contains:
            const: allwinner,sun6i-a31-rtc

The sun8i-b288-rtc compatible must be added to one of these conditional
blocks to restrict its clock-output-names length. Because it is omitted,
the schema incorrectly allows 1 to 3 clock output names for the b288 RTC
instead of strictly enforcing 1.

> +
>        - description: Point of View Protab2-IPS9
>          items:
>            - const: pov,protab2-ips9

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927151016.1864=
93-1-pmazzini@gmail.com?part=3D10
