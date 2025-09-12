Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18F02DEA82
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Sep 2025 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671481; cv=none; b=ZdedN31enp7VX/P/gFZReqz3t1PBamLLXHivB1pYiSE+L66C7xcn/WStyg4JVpXWIkbaArlUVHKv9aqwdbYd/T6iSWN06Dj+4MGeS2NO8ZghVGft5Zbe/jRQ52tHkHOJjNsruL9WhwaTNIvUPWK6n3X2gNsJtN6Muu9Y4k/fD7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671481; c=relaxed/simple;
	bh=XElUX9esLbtxbckqyV9wGffWqX28r4dwpXWVkfhm/Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NEENHQs43z/vH0/WNgLHn8VgYvu6ul3w9nPcEFeVubF0P9RMESyKV7SJa6606PeE9SBl6iYlfg46Aw6ApBTdVuhTHozAFMYkjWGlhnwbMXcDgCINWa6qjT74YHk9pIRoFUzCHBq2MOu5K8rGKM4e0qxwpypyLGlEHsHMZ0SWR2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E2A716A3;
	Fri, 12 Sep 2025 03:04:30 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 392C63F66E;
	Fri, 12 Sep 2025 03:04:37 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:04:34 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via B4 Relay"
 <devnull+j.ne.posteo.net@kernel.org>
Cc: j.ne@posteo.net, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Add Amediatech X96Q
Message-ID: <20250912110434.2a520acc@donnerap>
In-Reply-To: <20250912-x96q-v1-1-8471daaf39db@posteo.net>
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
	<20250912-x96q-v1-1-8471daaf39db@posteo.net>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Sep 2025 01:52:09 +0200
J. Neusch=C3=A4fer via B4 Relay <devnull+j.ne.posteo.net@kernel.org> wrote:

> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>=20
> The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB RAM,
> 8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/video
> output, and infrared input.
>=20
>   https://x96mini.com/products/x96q-tv-box-android-10-set-top-box
>=20
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
> index c25a22fe4d25cbd8a8132689f1326548f7f43f2c..c9940b44bc888f7ab81ace671=
040bd663556c113 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -963,6 +963,11 @@ properties:
>            - const: hechuang,x96-mate
>            - const: allwinner,sun50i-h616
> =20
> +      - description: X96Q
> +        items:
> +          - const: amediatech,x96q
> +          - const: allwinner,sun50i-h616
> +
>        - description: X96Q Pro+
>          items:
>            - const: amediatech,x96q-pro-plus
>=20

