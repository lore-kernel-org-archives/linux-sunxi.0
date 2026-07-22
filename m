Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184712FD1B3;
	Wed, 22 Jul 2026 21:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754606; cv=none; b=AMIy0ZiJ070L0Js9iEZgSpIEm6ra/faF1E1P3uOinJSlFvV/PmNoW/tQmhc+yghIn0jkGBmY1lPvho7Yz1ZXKW/WYuZ0euCnyk9KOdphIWAif2J2n+3M11f0sElsbrm5Awxi+RIKf/U+czqG7BbaCeCJW6Lj3FGYvbTlFPchvEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754606; c=relaxed/simple;
	bh=TGXVCYVy1ZOoq6c3PMdk0QLYvXnwwNEh+o9KVaq5m7o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gQbrFc2qQ7Y4royQn6pj4PE1KFC4QlSj2/MEPu95p7RGpHkVVP+VmxciS3lmZWLBx4s4S6nrL72GvaxdQ2NzaAsisffsPL5vT1mQNP6EuU/R45yz2KxxvWcD17cw2VKDdGD6Uz5drqhkGD6hTpP0eR8e2zC5Yxfr2DY6EUB+w+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6moxTk8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6moxTk8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1941B1F00A3A;
	Wed, 22 Jul 2026 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784754604;
	bh=d/QUkztDMgVgUK4D7oFF2uveNrp5ItUWSpHUiugd51o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A6moxTk8xIoBO/E8rcHwMpNdcZqPCsUX5doti6r2UblgoNbISvdeVHb82OfudpzFy
	 9FBpNuG2a7DYJTS8vY+KKxFgd1sD6/+IbZYXLQMGXvxYhBHYTtFFaEE0aD3xI49zHn
	 VpQZFsJhyxAhO5L4lPDr2DUbok2pZKPFrCJEPpSt7r5xYZGymV/tXp1hAz3Udo8qyB
	 M/kWTlk/+E+LiBYbwJTNXV3PSjiZ8Jh/lHKC7oJUNzMj/qeDrUoFnC5SgLmJzn6WwQ
	 OIn+IZJfFt8/D97q/rWRTt2w4uT8vI0HdgL1jLyYOT9/j4l8d9lGkKCqlt9Ku4+u+Q
	 91zO+A+ZUPKlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: sun9i-a80: Add thermal sensor and
 thermal zones
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U8O2cmVuIEhhbnRlbA==?= <fugininsane@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260722210046.2932498-4-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
 <20260722210046.2932498-1-fugininsane@googlemail.com>
 <20260722210046.2932498-4-fugininsane@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 21:10:03 +0000
Message-Id: <20260722211004.1941B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Thermal zones for CPU clusters are misnamed and cross-mapped rel=
ative to the actual CPU cores.
--

--- Patch [3]: [PATCH v2 3/3] ARM: dts: sun9i-a80: Add thermal sensor and t=
hermal zones ---
commit 073b6503b11cee70b348c673193855cbda7082e3
Author: Philipp Rossak <embed3d@gmail.com>

ARM: dts: sun9i-a80: Add thermal sensor and thermal zones

This commit adds the device node for the A80 thermal sensor and defines
the thermal zones in the device tree. It maps the sensors to the big CPU
cluster, DRAM, GPU, and little CPU cluster.

> diff --git a/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi b/arch/arm/boot/d=
ts/allwinner/sun9i-a80.dtsi
> index a1ae0929cec9d..8e7f8cd943d2e 100644
> --- a/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun9i-a80.dtsi
[ ... ]
> @@ -1250,4 +1260,62 @@ r_rsb: rsb@8003400 {
>  			#size-cells =3D <0>;
>  		};
>  	};
> +
> +	thermal-zones {
> +		cpu0_thermal: cpu0-thermal {
> +			polling-delay-passive =3D <1000>;
> +			polling-delay =3D <5000>;
> +			thermal-sensors =3D <&ths 0>;

[Severity: Medium]
Since cpu0 on the sun9i-a80 is part of the little CPU cluster, does this
map the cpu0 thermal zone to the wrong sensor? The commit message notes
that sensor 0 is beside the big CPU cluster. This could lead to mislabeled
temperatures in userspace and potentially throttle the wrong cluster if
cooling maps are added later.

> +
> +			trips {
> +				cpu0_crit: cpu0-crit {
> +					temperature =3D <100000>;
> +					hysteresis =3D <2000>;
> +					type =3D "critical";
> +				};
> +			};
> +		};
[ ... ]
> +		cpu2_thermal: cpu2-thermal {
> +			polling-delay-passive =3D <1000>;
> +			polling-delay =3D <5000>;
> +			thermal-sensors =3D <&ths 3>;

[Severity: Medium]
Are these names cross-mapped? This maps cpu2-thermal to sensor 3, which the
commit message states is beside the little CPU cluster. Since cpu2 is also
typically a little core, should the node names better reflect the actual
big/little clusters to avoid confusion?

> +
> +			trips {
> +				cpu2_crit: cpu2-crit {
> +					temperature =3D <100000>;
> +					hysteresis =3D <2000>;
> +					type =3D "critical";
> +				};
> +			};
> +		};
> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722210046.2932=
498-1-fugininsane@googlemail.com?part=3D3
