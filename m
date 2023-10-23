Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136AD1B28C
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Oct 2023 16:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="MBUvMSzn"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d9ac3b4f42cso3826611276.0
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Oct 2023 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1698080337; x=1698685137; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PpRDTr/SjqI7u9cHigusDrRJo1PBaJdLXmeB7mcPA2E=;
        b=MBUvMSznhb14PGTXWLpJYB5YMBL1Uv/YZl4nGUSjrfP1pe4iqeT11etARLd912VCXw
         uesznAAlOJxhQVBB7PcdDtMcUftkw+hDtDH1s5IJtjK44clbzius/pPBDOzttWji2VEr
         7id3Dfkiskj9GvVV7V28qBTl2OSrIqNIs/81E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698080337; x=1698685137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpRDTr/SjqI7u9cHigusDrRJo1PBaJdLXmeB7mcPA2E=;
        b=hxRCustv+eEo4mgwh2CqwIc1M1N4/FrCDlw2/Mt+sNz9n1Rhww4tUZFOek4kBCw1r8
         4Za+jBej/1pbDrgfH4ICVhKjMYeW6R7tYjAJNiYvsu00ejZmXzUZoK6emwok/97PbSme
         TvJrZifYs8dolKM6oce3wU119jNgTc5n9AQJx2RNEFkI1V4ED3Xxkd4c7LyB8a8vGL2t
         cvjr2pKc0vgVfaHMx1DNX7yrrkx9BMEY7XIFVnVtcgqwYKsmFIVnvH8DeznY5aeuaWoo
         F2fPP6cRGj8U+flc+aGCK+PTWa4x01TEQFOmLDH36XYrccPjhwPvZnTa7G+HFiJuXCXv
         DzxQ==
X-Gm-Message-State: AOJu0YwX2c59LSIQ6TMmi2UwlHoz/nX2Xcj8PlajM7CJaR8uok65jBZg
	usAeC3k1mEh8VXfx6gFKA31aUQ==
X-Google-Smtp-Source: AGHT+IEwPcfS8VFCLlzKQRTimI2x6e3pvjlBWqNcM5ueVK/M9mV+rx9XdeDkZnDtrzNsrGNKsXF4Pw==
X-Received: by 2002:a25:ae0c:0:b0:d9c:ee80:9215 with SMTP id a12-20020a25ae0c000000b00d9cee809215mr10651477ybj.26.1698080336903;
        Mon, 23 Oct 2023 09:58:56 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-6400-3cd1-c3ac-4562-deca.res6.spectrum.com. [2603:6081:7b00:6400:3cd1:c3ac:4562:deca])
        by smtp.gmail.com with ESMTPSA id c14-20020a25a2ce000000b00d81bb7ef494sm2826347ybn.19.2023.10.23.09.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 09:58:56 -0700 (PDT)
Date: Mon, 23 Oct 2023 12:58:54 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Sam Edwards <cfsworks@gmail.com>,
	Okhunjon Sobirjonov <okhunjon72@gmail.com>
Subject: Re: Pull request: u-boot-sunxi/master for v2024.01
Message-ID: <20231023165854.GP496310@bill-the-cat>
References: <20231023104830.792659-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4NrcLYGt0f2p17kx"
Content-Disposition: inline
In-Reply-To: <20231023104830.792659-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--4NrcLYGt0f2p17kx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 11:48:30AM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> please pull the sunxi/master branch, containing the first part of the
> 2024.01 changes. Apologies for the late PR, there were quite some recent
> activities (fixes and reviews), but I didn't want to delay this series
> any longer, since it's been around one year in the making already:
>=20
> This is mostly about support for the Allwinner R528/T113s SoC, which is
> reportedly the same die as the Allwinner D1, but with the two
> Arm Cortex-A7 cores activated instead of the RISC-V one.
> Using sunxi code outside of arch/arm proved to be difficult, so apart
> from enabling this Arm SoC, the patches also prepare for more refactoring
> to get the D1 nicely supported some day:
> - We get rid of some Kconfig (hard-)coded GPIO pins, responsible for
>   enabling regulators.
> - The GPIO code is moved out of arch/arm, into drivers/gpio.
> - Some definitions are moved out of header files under asm/arch.
> - Some T113s/D1 specific definitions are guarded by a generic Kconfig
>   symbol (CONFIG_SUNXI_GEN_NCAT2).
> - The DRAM controller initialisation code is located under drivers/ram.
> - The base SoC .dtsi files are shared (under arch/riscv, as in Linux).
>=20
> Of course there are also the usual new SoC specific patches, like clock
> and pinmux descriptions, alongside a rework of the pinctrl code, since
> Allwinner changed the GPIO register layout, for the first time since
> sunxi's inception.
> On top of this the PSCI code sees some update, to provide SMP services
> for R528/T113s boards. Many thanks to Sam for providing this code and=20
> staying strong through the review cycles.
> The final patch enables support for one popular board, I hope to see
> more DTs and defconfigs contributed in the future!
>=20
> Many thanks to all the various contributors, testers and reviewers,
> that series was a real team effort!
>=20
> The gitlab CI completed successfully.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> The following changes since commit 9a3a58396b78b1f9d0c14580dc03f81d29207d=
d2:
>=20
>   Merge https://source.denx.de/u-boot/custodians/u-boot-marvell (2023-10-=
20 12:54:33 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to fa066df62ed9bfe0aed7749a68457468ad8bcc1c:
>=20
>   sunxi: add MangoPi MQ-R board support (2023-10-23 01:00:56 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--4NrcLYGt0f2p17kx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmU2pk4ACgkQFHw5/5Y0
tyxTIQwAhN0mANE3WldiwmWcG3toZZPVjePOQIra8pccCvxF4gXzvlh3JjfWhOwE
lc78BUnx+DqUNpXOWymeYPzfkudOpBy7bA2ABILoVErkxjfyNnQAt5lg6WbuBCAg
xYvLKAAKJHw6w2FXNe+uni8hXaEO/IhEUF5iG4yQ+OYXmMyUlOh2pArY05KAzaua
c6qr65kZbr1HN8UvmZihJJJZTVVEXrMUYR2XtURFutxg4AWdXIcv8KopUu3VpWMs
mEH8qRE+idaD139XTd+o7F/M3YAzTJy4D9cx3KDZCWSUzmQK5VQuE0fr8ugy8X5w
gNHegHlaGjvdMIA0bnQEFK5ocP545V95UnyZyaISmxbW/z8kFrSvwRRoc/rwbz/r
lJC8gTWz1fkskcaw6VvmuFFIg6Y61cgyexXZgytQuozmKSltUcnD5PkeOqveHSl4
RTJNMQfmGuQOmsLrxorCOgQvmPD6cbI3IcFYuVij2f2FeGwfOlLpipGbwQSZkjuP
U8DN7OnV
=M2nI
-----END PGP SIGNATURE-----

--4NrcLYGt0f2p17kx--
