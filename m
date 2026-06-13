Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5407379EDF;
	Sat, 13 Jun 2026 15:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781364939; cv=none; b=o89aOTlrU8B0ourOIR4SPcVxLNTkp2owwSmuW12SgnrWCdSaz6n6PuHJdGQFetKByqErULF+U1ILKcdwIBp6lkmKU5RNqPY3uPrRDb8Tka3QcRA5QxC//GiMmLH4gLdVjc9cQf5ETErvkxp0s5hCBJ3KJTPC8FL1LRi7HLk6lI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781364939; c=relaxed/simple;
	bh=pO6jLyC7XfYfpU+431e3ukLEL89aGZlCAog6qh5zR4A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YW+0aG/S1m9itJW608sBdezAUWnZNI+YedDJsZtkO+LtjMaf2Ut6eJsGcO1JbSjyrYXxLE4+DYNJkiUMXLVYFmcE4WNfw9+n2iqfdskDWPE2gx1HoSPRY8Qb7N1Oy1p9v/Sho8pWwqmyToDd0BIkECCnWbbKb63OYABu0fj4ujg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yvg8VjaG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yvg8VjaG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA04E1F000E9;
	Sat, 13 Jun 2026 15:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781364933;
	bh=AixA1tsqnWhuEnq6sgAb2hx44sFSn0RlAxwXgGBCoX0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yvg8VjaG2+Z/q1UmuhfpFghRRAlVuVHRoQeyRu8aO/9JS0U6zwSJMDyTEhQCFcKdO
	 cRWupk7hhraE+1so0KBLzD2zFGfCV2bln/oXLYsX+kCEKpFElNZJDDNDPVuBV+DAeR
	 hDNuiJfzBoHCbB1fwwQgFLX1daT24ivYeg9hulDKxoay/9hNI5hr0fdGoNKiLUcFnn
	 0pRgq2Ifocio+lJVbSjcIX4sAm0vwKPu1942vN7WBxccn4achD9IcDC3MKjo1UCion
	 PtslBBkUvXnTgxMA6frclnWnPvaTxWNmXx7DYxCmDzSdB93Ca6y+kPB9yivz0GmGrq
	 /f2GorUzZ8Lhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/6] dt-bindings: sun6i-a31-mipi-dphy: Add V3s SoC
 compatible entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Kocialkowski" <paulk@sys-base.io>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260613152655.212490-5-paulk@sys-base.io>
References: <20260613152655.212490-5-paulk@sys-base.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 15:35:32 +0000
Message-Id: <20260613153532.EA04E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added V3s compatible string is for an rx-only hardware=
 variant, but the binding schema allows it to incorrectly default to `tx`.
--

commit 2fd664ce10fb7edbf45c93a3bcbbd8adb0bad2ea
Author: Paul Kocialkowski <paulk@sys-base.io>

dt-bindings: sun6i-a31-mipi-dphy: Add V3s SoC compatible entry

The V3s/V3/S3 comes with a rx-only D-PHY paired with the MIPI CSI-2
controller. It is compatible with the D-PHY found on the A31.
Add an entry with a new compatible and the A31 compatible as fallback.

> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mi=
pi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mi=
pi-dphy.yaml
> index 6a4fd49299590..3ca1a1c47032f 100644
> --- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy=
.yaml
> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy=
.yaml
> @@ -21,6 +21,9 @@ properties:
>        - items:
>            - const: allwinner,sun50i-a64-mipi-dphy
>            - const: allwinner,sun6i-a31-mipi-dphy
> +      - items:
> +          - const: allwinner,sun8i-v3s-mipi-dphy
> +          - const: allwinner,sun6i-a31-mipi-dphy

[Severity: Medium]
Since the commit message indicates the V3s D-PHY is rx-only, should this
schema include an if-then block to enforce the rx direction?

The base binding defines allwinner,direction with a default of tx:

  allwinner,direction:
    ...
    enum:
      - tx
      - rx
    default: tx

Without an allOf if-then block constraining this property for the
allwinner,sun8i-v3s-mipi-dphy compatible string, a V3s device tree node
that omits the property will implicitly default to tx.

Would this allow an incomplete device tree node to pass schema validation
while misconfiguring the rx-only hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613152655.2124=
90-1-paulk@sys-base.io?part=3D4
