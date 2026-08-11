Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1D63546EB;
	Tue, 11 Aug 2026 23:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786490543; cv=none; b=cbhQQXBGdUj4gyG472DsNn/aa4zrqAEK7SO0HimkZJqH8GX/QZi1BQU8/NNFigNHJDOCyOBIBg10SJ/nei6nepIVaXRorzrHjkdmCzBW+8y/+X83mMF9BmRUOB2nCgFTJ1XPG0G6NyIwU8tH7jTjbGVcs2Wllh+IiPR/K8B8yYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786490543; c=relaxed/simple;
	bh=Mg5DkPmsqw5gm8uF8sHKCbOAWEq5en5lQJIEaQMBkYY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eVzjLCqcupYn4w2yP2Wl90E686dHgXhgamCuQWYzfXu2UlF6Rp1eCjEsOI2y47Sg3vefBKVobUHtXOrv7BQhKyzvICRtxUmv2V+UbwZ+GMgcqvquY2GQ1gLfirRwA3wRL/Ol5sNl7D9/51KzgYNNKGq50VWY+6H0sBujmO2qnqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jn19AC3y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jn19AC3y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4591D1F000E9;
	Tue, 11 Aug 2026 23:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786490541;
	bh=plyfoPwj5j16IStcdWmVjRbveCWyNxujXYLfGLb7MNk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jn19AC3yY/RkaKD7YOgpNs35hcp7a72NJ9ScKDvmUIMJJ1usFGLKDQ4Inp1a8Y99H
	 1MvzjDh06aBVjjf2Ir0rkZo0Vor92NSSWDya2rHPeNbMc1fK+Db1Xhjvsyjs2cZdba
	 ixFDTDlOo5eI6eDb9egbA//XlzdfhddTX+BKx8TL7WVPz2C24FDmjUyBDQPfUfqHky
	 RWaSFoZzR6kzWjDP5jDq0+8BlsqQvTAvDLOlGxc8qj78KSSDJ4q70cjduZl6NmDyGO
	 ggmUglNr94zrIpfx5N02JY4h9dzYbsFo0rXAZ73W7EQrtUocOXLRm+OAYylRgOCQxY
	 ma3oWx/xkyZ4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: mfd: x-powers: Add AC200
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260811-submit-ac200-mfd-v7-1-8b06f552a4d7@gmail.com>
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
 <20260811-submit-ac200-mfd-v7-1-8b06f552a4d7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 23:22:20 +0000
Message-Id: <20260811232221.4591D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Potential incomplete Device Tree Binding Schema for AC200 hardwa=
re functions
--

--- Patch [1]: [PATCH v7 1/2] dt-bindings: mfd: x-powers: Add AC200 ---
commit edf03c82fb970a30013a24a5a03b1e0de64b8288
Author: James Hilliard <james.hilliard1@gmail.com>

dt-bindings: mfd: x-powers: Add AC200

This commit introduces the device tree binding schema for the X-Powers AC200
mixed-signal IC. The device provides audio, video, RTC, and Fast Ethernet P=
HY
functions controlled over I2C.

> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/=
Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> new file mode 100644
> index 0000000000000..609831b15c806
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false

[Severity: Medium]
Since the AC200 provides audio, video, and RTC functions as mentioned in the
commit message, will these require child nodes in the device tree?

With additionalProperties: false, any attempt to add child nodes for these
sub-devices, or a shared interrupts property for the parent, will fail sche=
ma
validation. If these functions are meant to be modeled as MFD child nodes,
should they be documented here to avoid validation failures when device tre=
es
start describing the IC's full capabilities?

> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        mixed-signal@10 {
> +            compatible =3D "x-powers,ac200";
> +            reg =3D <0x10>;
> +            clocks =3D <&pwm 5>;
> +        };
> +    };
> +...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811-submit-ac2=
00-mfd-v7-0-8b06f552a4d7@gmail.com?part=3D1
