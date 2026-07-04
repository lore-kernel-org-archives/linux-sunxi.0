Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEBD25B099;
	Sat,  4 Jul 2026 17:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783185826; cv=none; b=DWZadMcZ8qdjQElEQ47EYEYxa7QK8LgN+8o7zEfxCxF6pgxcXmyb8SvX70rPAp+WEHH/xfYnsvsVu1Du1U3I4WnxVcUwm0Bwj77KYuKOd0V50eXw09NXAuAMo86XLKEizYRckVmFLKT1KNCZarznUkfsBRalVh8VF0Kp/8D2Szk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783185826; c=relaxed/simple;
	bh=SWlZvLVQP9+7LfgEmg88sju8QcHkThhSKotVvGJqKMo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bSEaz7LR6Y/JF2Zd7eaU2il/aKCD4SOyNHMXj6ZXFazH5rU0Rb5uIvBh5OjUs0ft91FiJji4xdiIGLRckbyL8+1SEqtILXRhZdb+PVAzD+lfGSLWpKBAoTV9sEqd8DZPFoDvYByw3gbjlOMDtC0v2/V1aacHdGRyIowlgsvMfZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amrtktlX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amrtktlX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803D51F000E9;
	Sat,  4 Jul 2026 17:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783185824;
	bh=Uu6InqSBrnGcz758/qTlwqNEsqEMs8+n2NNTcLML8d8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=amrtktlXRb9nWqZKO1PG4eZjyIBsV3W1+3Vx+P0HBunDtrXh1cHGjIZI3+jq1xTo2
	 cE14NYgLKgqflViGK7uxArAq2/QaQ1cq76KjH32wae8eMyDzodYudMOZ718dlFE4al
	 ooXOACI0uUbB724YWv9ZtQ8uZ91eeh/W4Ee27JgpPlGdwYzvNUxLIu/WrsXd19b5Fo
	 /vLRV+ddWuTa5vgaQyU6TCPoqSTwRXIUvKOsgNHNmBeiETsBlxWn+mTt+6PgkzuHvO
	 nhOZ4mhJOgOvrcTX0KsarWQ3nqDbJVO5NGjdArkgwAkRHpuTLolOwi9+kBMHHlPBqM
	 FvJQMRrb925Ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: thermal: sun8i: Add A523 THS0/1
 controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kalashnikov" <iuncuim@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260704171411.1413349-2-iuncuim@gmail.com>
References: <20260704171411.1413349-1-iuncuim@gmail.com>
 <20260704171411.1413349-2-iuncuim@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 17:23:44 +0000
Message-Id: <20260704172344.803D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The fallback `else` branch fails to explicitly restrict `nvmem-cell=
-names` to `maxItems: 1` for legacy devices.
- [Low] The `clocks: minItems: 2` constraint in the new `allOf` block for A=
523 devices is redundant.
--

commit 3b55695ed8b61c3a70dec40b0b70e9958c234bfc
Author: Mikhail Kalashnikov <iuncuim@gmail.com>

dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers

This commit adds device tree binding descriptions for the thermal sensors
in the A523 processor. It updates the schema to require an additional
clock for these variants and supports split calibration data across two
nvmem cells.

> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a8=
3t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83=
t-ths.yaml
> index 3e61689f6dd41..6f5b2f3b94f80 100644
> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.=
yaml
> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.=
yaml

[ ... ]

> @@ -132,6 +140,29 @@ allOf:
>          - clock-names
>          - resets
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun55i-a523-ths0
> +              - allwinner,sun55i-a523-ths1
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2

[Severity: Low]
Is this constraint redundant? The first allOf block in this file checks
for single-clock devices and its else branch already applies minItems: 2
for clocks and clock-names to all other devices. Since the A523 variant
is not in that single-clock list, shouldn't it already be constrained to
2 clocks?

> +        nvmem-cells:
> +          minItems: 2
> +        nvmem-cell-names:
> +          minItems: 2
> +    else:
> +      properties:
> +        nvmem-cells:
> +          maxItems: 1
> +        nvmem-cell-names:
> +          items:
> +            - const: calibration

[Severity: Low]
Does this else block also need to specify maxItems: 1 for
nvmem-cell-names?

Redefining items as a tuple only validates the specified elements but
does not restrict the total array length. Without maxItems: 1, legacy
device trees could erroneously define two nvmem-cell-names and still
pass validation.

> +
>  required:
>    - compatible
>    - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704171411.1413=
349-1-iuncuim@gmail.com?part=3D1
