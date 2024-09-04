Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D2E1E00B7
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Sep 2024 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725468274; cv=none; b=CgfyZ9OiixwgRT0lIP2/3yCAS36E5oIon6kvYG5s7UuFrPLFyQZ8KJy6J7Hpx+yx57m4aBAHiTjtlZZHk59MXJUsJvb2h8SRE/fzRSoG2krvblvl/D0hGZ45Arno44m79wGz/W1uhO4dt+daVUkX9JkjbgP0Z8/QK6pJE6uGlaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725468274; c=relaxed/simple;
	bh=SXx6jO5MZqycXHp1fEztwaku3HUAOD91ZqeErKMDBmU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SO/p95yjoNte8BXMMcF291+kyYvAd4DBrfvsb8VIfktqCt64+IV1qp4KCPFkxPuQGl2/H+8W45L1ANkZNbuoDHoTGvwVlKjm3taK/NWi3ZH3/50dnvXukqs4eqTRf0q3DMUDnnD+2b6MQiXcXc9acpX7H7Hz4JrdBXvLz69O0g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D52A2FEC;
	Wed,  4 Sep 2024 09:44:56 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CADA03F73B;
	Wed,  4 Sep 2024 09:44:28 -0700 (PDT)
Date: Wed, 4 Sep 2024 17:44:26 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Fix NanoPi NEO Plus2 regulators
Message-ID: <20240904174426.48bcb483@donnerap.manchester.arm.com>
In-Reply-To: <20240827-nanopi-neo-plus2-regfix-v2-1-497684ec82c7@gmail.com>
References: <20240827-nanopi-neo-plus2-regfix-v2-0-497684ec82c7@gmail.com>
	<20240827-nanopi-neo-plus2-regfix-v2-1-497684ec82c7@gmail.com>
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

On Tue, 27 Aug 2024 23:00:43 +0200
Kry=C5=A1tof =C4=8Cern=C3=BD <cleverline1mc@gmail.com> wrote:

Hi,

> Added the main board 5 V supply regulator,
> a 2.5 V supply regulator for GMAC PHY IO and correct vin-supply elements.

thanks for sending this and fixing the DT!

That looks correct when comparing to the schematics:

> Signed-off-by: Kry=C5=A1tof =C4=8Cern=C3=BD <cleverline1mc@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts   | 25 ++++++++++++++++=
++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
> index b69032c44557..dee4cd82636b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
> @@ -45,16 +45,40 @@ reg_gmac_3v3: gmac-3v3 {
>  		startup-delay-us =3D <100000>;
>  		enable-active-high;
>  		gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>;
> +		vin-supply =3D <&reg_vcc3v3>;
> +	};
> +
> +	reg_gmac_2v5: gmac-2v5 {
> +		/* 2V5 supply for GMAC PHY IO */
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "gmac-2v5";
> +		regulator-min-microvolt =3D <2500000>;
> +		regulator-max-microvolt =3D <2500000>;
> +		regulator-always-on;
> +		vin-supply =3D <&reg_vcc3v3>;
> +	};
> +
> +	reg_vcc5v: regulator-vcc5v {
> +		/* board 5V supply from micro USB or pin headers */
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc-5v";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
>  	};
> =20
>  	reg_vcc3v3: vcc3v3 {
> +		/* board 3V3 supply by SY8089A */
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc3v3";
>  		regulator-min-microvolt =3D <3300000>;
>  		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +		vin-supply =3D <&reg_vcc5v>;
>  	};
> =20
>  	vdd_cpux: gpio-regulator {
> +		/* cpu voltage regulator MP2143DJ */
>  		compatible =3D "regulator-gpio";
>  		regulator-name =3D "vdd-cpux";
>  		regulator-type =3D "voltage";
> @@ -66,6 +90,7 @@ vdd_cpux: gpio-regulator {
>  		gpios =3D <&r_pio 0 6 GPIO_ACTIVE_HIGH>;
>  		gpios-states =3D <0x1>;
>  		states =3D <1100000 0>, <1300000 1>;
> +		vin-supply =3D <&reg_vcc5v>;
>  	};
> =20
>  	wifi_pwrseq: pwrseq {
>=20

