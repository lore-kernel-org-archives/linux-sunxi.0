Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E7A3CB57B;
	Thu, 17 Sep 2026 04:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620155; cv=none; b=W523xHE46vj7TOI/Efno5IHmIOqGxeT2yAsxZZwrYFGp4FPo5G1g03sut/mW0iE2/WKeqBuGZD+hWDIGhO6mN9QO13Qk5m4Cw1EN/0+0uIHTfzGDiUOi4R07qB5BP8t46ztRpiMEWxe6hfN83GZGGNHpsJJy7eP7Wi28bLGdIIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620155; c=relaxed/simple;
	bh=nJx4cBA2E21VCVn14ktGJ3+46jN13gAy4MZOFIxdZik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AZ0bzrl376+18+3zwQCSvg+i/FM99Ut6b+1+2yT195RJE7JJdKmok2zCcIjbdpvot3ii4qqTx6w1Hjj9nhXLCWkOPvRRtIORUo5BOnEtIEfbu9schXvAFvKayhhJkxC/fRklu3UzwqvH3cZrmnjkuDaUGkmc9p8Bk6BTWPqAHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUcNv8Si; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUcNv8Si"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA291F00899;
	Thu, 17 Sep 2026 04:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789620153;
	bh=+rxBHgw3vtwYkv7ry0IqYWSazFrhjE9zMz1GfIIqd9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RUcNv8Si4CxwbwUe6IrRTP00355oagn7yCcyRluQrAZigJXHixXj53JgkgCuZogpR
	 Am5xYX3yQVcrI1kXvEXeVsOVfU6q3zw6w9HIH8JhmQMLVvxvb/kpsp+GBsvx2rupiH
	 f8nqD/h7MrwfnWiIFYnZeS43pPeJorONwPuA9MkvAEuNHotQ/j5NPjfkQeyvnH3Fk3
	 UjrdnynHHMr0xH1nd7O2zr/S3drX4eK91y/5czeNBKHfnTxCTinqlFnCOObPG+ksvO
	 zoo2VKPB8XqCOpvrJJ2btpbbO9QTnjrqq1fBIE++3YDs9zckMlNOkJqALV2O8kJQ3g
	 xD6eayNlyfj1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: phy: Add Allwinner AC300
 EPHY binding
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWxhc3RhaXIgRCdTaWx2YQ==?= <alastair@d-silva.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260916044119.475666-2-alastair@d-silva.org>
References: <20260916044119.475666-1-alastair@d-silva.org>
 <20260916044119.475666-2-alastair@d-silva.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 04:42:32 +0000
Message-Id: <20260917044232.DCA291F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: net: phy: conflicting duplicate schema for AC300 EP=
HY
- [Low] dt-bindings: net: phy: schema validation failure on 3-item compatib=
le
--

commit 78619c40b1c730a8fe995945c43fe97d336ddfb6
Author: Alastair D'Silva <alastair@d-silva.org>

dt-bindings: net: phy: Add Allwinner AC300 EPHY binding

Add device tree binding documentation for the Allwinner AC300
Fast Ethernet Physical Layer (EPHY) co-packaged on Allwinner
H616 and H618 SoCs.

> diff --git a/Documentation/devicetree/bindings/net/allwinner,sun50i-h618-=
ac300-ephy.yaml b/Documentation/devicetree/bindings/net/allwinner,sun50i-h6=
18-ac300-ephy.yaml
> new file mode 100644
> index 0000000000000..a04416e781382
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/allwinner,sun50i-h618-ac300-e=
phy.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/allwinner,sun50i-h618-ac300-ephy.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner AC300 Ethernet PHY

[Severity: Medium]
Will this binding conflict with the existing x-powers,acx00-ephy-package.ya=
ml?

The AC300 hardware appears to already be modeled by the ethernet-phy-package
architecture, which represents its split-address control architecture (where
control registers sit at base + 16).=20

Introducing a standalone flattened binding seems to attach package-level
properties directly to the link PHY, potentially fragmenting the device tree
ABI. This could force drivers to hardcode a + 16 MDIO offset instead of
relying on the standard package architecture.

> +
> +maintainers:
> +  - Alastair D'Silva <alastair@d-silva.org>

[ ... ]

> +properties:
> +  compatible:
> +    items:
> +      - const: ethernet-phy-id0044.1400
> +      - const: allwinner,sun50i-h618-ac300-ephy
> +      - const: ethernet-phy-ieee802.3-c22

[Severity: Low]
Will this compatible string array fail dt_binding_check validation?

The included core ethernet-phy.yaml enforces a oneOf constraint that restri=
cts
compatible arrays to a maximum of two elements (such as PHY ID and IEEE
clause). This block defines a 3-element array, which appears structurally
invalid under the included constraints.

> +
> +  reg:
> +    maxItems: 1

[ ... ]

> +examples:
> +  - |
> +    mdio {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        ethernet-phy@0 {
> +            compatible =3D "ethernet-phy-id0044.1400",
> +                         "allwinner,sun50i-h618-ac300-ephy",
> +                         "ethernet-phy-ieee802.3-c22";

[Severity: Low]
Will this example node fail validation?

This example demonstrates the 3-item list, which will violate the two-eleme=
nt
restriction inherited from the base ethernet-phy.yaml schema.

> +            reg =3D <0>;
> +            clocks =3D <&ccu 81>, <&ac300_pwm_clk>;
> +            clock-names =3D "ephy", "pwm";
> +            nvmem-cells =3D <&ephy_calibration>;
> +            nvmem-cell-names =3D "calibration";
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916044119.4756=
66-1-alastair@d-silva.org?part=3D1
