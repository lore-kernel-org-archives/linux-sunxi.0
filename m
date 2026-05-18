Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C9B34F474;
	Mon, 18 May 2026 17:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124256; cv=none; b=gkW32ZhawKfLJo9UXuxcm3ncRHQPhdLoM11PxSiCKBqi1TmZLY6ldOrQJoT3XGS9ru/zgtW/jJg9uVk+KZCKmmPp59IONq8ATS/O+G6Q3k+AbaaWlJKaWWGZ8z0f2XjT93gvBh7bkE24qJ6NVMMLdPctKjITPA9wIRpcqzRnyko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124256; c=relaxed/simple;
	bh=nF/HU1fjnqUQnaZoipkFcCFRl4r0iGbfmYpcV7+Cd60=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T94WxymuurW0cZ4CK+i2i1tOT7xDzyJBLIHhYEnX5+uc96aGNJuYnHB3wiCWJMXwwtZezH87LoXT7/3s0oZ9PZeRPOfSxgKXIV0JiDZ21isRJ/NNlIPTOLBstelTMSjvS2rE7GJ0PE/lEoY3QvlU4x0iske1JbGfmK1ZN8r6nu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USV5QUc2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USV5QUc2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B9DC2BCB7;
	Mon, 18 May 2026 17:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779124256;
	bh=nF/HU1fjnqUQnaZoipkFcCFRl4r0iGbfmYpcV7+Cd60=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=USV5QUc2OEB1Q1Tsbmo+9M8sJSDHjK4k+q77wwWZAaYzchNXndPFW1zD8nxkTwd/G
	 hdJDtj5ao06XusriqbWwb466HyPTIUqlgCz2xQFk5zlyaDW3qNVpYd7yGJ0LqzckBO
	 ZXyOvkHeapJQ1n8MomD5jjooqCJK5PLY0DUsIznGZNo5ikFDK2FnUS7ZCkXmnASKv5
	 ebBC83WcfbWvZiCGasQ4qJa/twypYx0Nu1K5y6WhACwt2KFHiAbj84VddkpfpCh3WN
	 OZDSZ5KdmCYEuFhFlWr+Sin4aLq8QALrj9tbq50+tJyfbKSFwtmaOb8kHbBvLyx5lJ
	 qDE8Jt4j/IMcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 9/9] ARM: dts: sun8i-a83t: Add BananaPi M3 OV8865
 camera overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Kocialkowski" <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260518153339.619947-10-paulk@sys-base.io>
References: <20260518153339.619947-10-paulk@sys-base.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 17:10:55 +0000
Message-Id: <20260518171055.C8B9DC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Fixed regulator node names do not match the required schema pattern.
--

commit 7dbfc9e619262f99c508e48d6adf246ddf875f69
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

ARM: dts: sun8i-a83t: Add BananaPi M3 OV8865 camera overlay

This commit adds a device tree overlay supporting the OV8865 sensor on the
BananaPi Camera v3 peripheral board. It configures the fixed regulators,
clocks, and MIPI CSI-2 endpoints needed for the camera module.

> diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov=
8865.dtso b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov886=
5.dtso
> new file mode 100644
> index 0000000000000..4340ca73bfaaf
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov8865.dt=
so

[ ... ]

> +&{/} {
> +	/*
> +	 * These regulators actually have DLDO4 tied to their EN pin, which is
> +	 * described as input supply here for lack of a better representation.
> +	 * Their actual supply is PS, which is always-on.
> +	 */
> +
> +	ov8865_avdd: ov8865-avdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ov8865-avdd";
> +		regulator-min-microvolt =3D <2800000>;
> +		regulator-max-microvolt =3D <2800000>;
> +		vin-supply =3D <&reg_dldo4>;
> +	};
> +
> +	ov8865_dovdd: ov8865-dovdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ov8865-dovdd";
> +		regulator-min-microvolt =3D <2800000>;
> +		regulator-max-microvolt =3D <2800000>;
> +		vin-supply =3D <&reg_dldo4>;
> +	};
> +
> +	ov8865_dvdd: ov8865-dvdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "ov8865-dvdd";
> +		regulator-min-microvolt =3D <1200000>;
> +		regulator-max-microvolt =3D <1200000>;
> +		vin-supply =3D <&reg_dldo4>;
> +	};

This isn't a bug, but do these fixed regulator node names trigger device
tree schema validation warnings?

According to the fixed regulator binding schema, node names should match
the pattern ^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$.=20

Using arbitrary names like ov8865-avdd falls back to an "Any name allowed"
clause in the schema that is marked as deprecated.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518153339.6199=
47-1-paulk@sys-base.io?part=3D9
