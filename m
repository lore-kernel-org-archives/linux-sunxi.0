Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CD31DCB30
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Sep 2024 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725463630; cv=none; b=TX/qAZbSRLzNdbxKCME/hGct3/okPTV4JiuESVfeOVkD6wqsbMb/Du8jmjAFf8m/asRtMTX6aZnwxLofdEihIKEUzhsE1ToCgYNy0n2u8TP3oqU3uI5LjPDN9iu+J+tZL85xhHy4oZm8dB6nemBc6zrNI790oMwR/3+5dill2Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725463630; c=relaxed/simple;
	bh=sC7n07gNCOrDZyI3HuwmwogS+jeCN72wip0x5wj5o7A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xxor99uwBaNHT5XLzUCQZkczq4ekU543UN10YZAyhjV16s8fn1DO27jBZISI+hWLoqCY1Rhl3hAC0UCO/NyGxeMmXJrZB2nEy0QngMxEm4lbYVNPuHrdBMU6u8ehP/VyGHGDpS8ncew+Q9x8loWHlg/6hss2Cr3tO8/UubxL4nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EF6BFEC;
	Wed,  4 Sep 2024 08:27:33 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DAC53F73F;
	Wed,  4 Sep 2024 08:27:05 -0700 (PDT)
Date: Wed, 4 Sep 2024 16:27:02 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Use regulators for pio on NanoPi NEO Plus2
Message-ID: <20240904162702.7c3dc33e@donnerap.manchester.arm.com>
In-Reply-To: <20240827-nanopi-neo-plus2-regfix-v2-2-497684ec82c7@gmail.com>
References: <20240827-nanopi-neo-plus2-regfix-v2-0-497684ec82c7@gmail.com>
	<20240827-nanopi-neo-plus2-regfix-v2-2-497684ec82c7@gmail.com>
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

On Tue, 27 Aug 2024 23:00:44 +0200
Kry=C5=A1tof =C4=8Cern=C3=BD <cleverline1mc@gmail.com> wrote:

Hi,

> Pin controllers pio and r_pio will have proper regulators assigned.
>=20
> Signed-off-by: Kry=C5=A1tof =C4=8Cern=C3=BD <cleverline1mc@gmail.com>

Checked against the schematic, it's indeed all 3.3V, except for PortD.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts | 12 ++++++=
++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
> index dee4cd82636b..526443bb736c 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
> @@ -171,6 +171,18 @@ &ohci3 {
>  	status =3D "okay";
>  };
> =20
> +&pio {
> +	vcc-pa-supply =3D <&reg_vcc3v3>;
> +	vcc-pc-supply =3D <&reg_vcc3v3>;
> +	vcc-pd-supply =3D <&reg_gmac_2v5>;
> +	vcc-pf-supply =3D <&reg_vcc3v3>;
> +	vcc-pg-supply =3D <&reg_vcc3v3>;
> +};
> +
> +&r_pio {
> +	vcc-pl-supply =3D <&reg_vcc3v3>;
> +};
> +
>  &uart0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart0_pa_pins>;
>=20

