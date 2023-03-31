Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E9E3D63
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Mar 2023 18:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3256CC433EF;
	Fri, 31 Mar 2023 18:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680287955;
	bh=eqEkQdcItulIBYfu63tsCeTblX411ylkWCoUY/V/uWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CBQ+Ry2iM7+5i9TV/gOsUHqOL/h49W1vS9TeUUVJ9gJtWjuI+vRd9yHkwrGpjrmn8
	 W0N4XstXsBEomURTXLS6AEwngiWkZ/UcMOeyRSJ+xVP50JxxJaZ6s9epZaJ8nfOtpJ
	 ad2Wylb7EtVa6kXpe2J1S8BsEf+IE/h8rUuDjl5BzMPUNMHniUO9Eo9RHwDioYBDVO
	 npuOA+mZBcWz7b69M/NXBfWIrPRgI51acgb/du9+JUEHKIY39+Ti90f0BQWXQwLHr4
	 cRfSjYpXTDnqehIiCcEolchbHALgutD+6rDaBTcYknnl3ZcL+0v99sBx+7CGb8+ctE
	 MXKlJ7dXbu63Q==
Date: Fri, 31 Mar 2023 19:39:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: linux-sunxi@lists.linux.dev, conor.dooley@microchip.com,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Trevor Woerner <twoerner@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH] riscv: dts: nezha-d1: Add memory
Message-ID: <25837ca5-b709-4d20-912b-ab13e6353069@spud>
References: <20230331182727.4062790-1-evan@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TnwQBgyZeUS8jdJs"
Content-Disposition: inline
In-Reply-To: <20230331182727.4062790-1-evan@rivosinc.com>


--TnwQBgyZeUS8jdJs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 11:27:27AM -0700, Evan Green wrote:
> Add memory info for the D1 Nezha, which seems to be required for it to
> boot with the stock firmware. Note that this hardcodes 1GB, which is
> not technically correct as they also make models with different amounts
> of RAM.

> Is the firmware supposed to populate this?

Yup. Samuel intentionally did it this way:
https://lore.kernel.org/linux-riscv/8a2194bf-93bd-de4d-8d39-0cd72aabb0a9@sh=
olland.org/

Since I don't like using the firmware provided stuff to more easily
test I do this in my u-boot boot script:

tftp 0x54000000 d1-fitImage.fit
bootm start 0x54000000
bootm loados 0x54000000
bootm ramdisk;
bootm prep;
fdt memory 0x40000000 0x20000000
bootm go;

Hope either of the above are helpful,
Conor.

>=20
> Signed-off-by: Evan Green <evan@rivosinc.com>
>=20
> ---
>=20
>  arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/ris=
cv/boot/dts/allwinner/sun20i-d1-nezha.dts
> index 4ed33c1e7c9c..6aba68cf5541 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> @@ -32,6 +32,12 @@ / {
>  	model =3D "Allwinner D1 Nezha";
>  	compatible =3D "allwinner,d1-nezha", "allwinner,sun20i-d1";
> =20
> +	// FIXME: this is temporary.
> +	memory@40000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x40000000 0x40000000>; /* 1 GB */
> +	};
> +
>  	aliases {
>  		ethernet0 =3D &emac;
>  		ethernet1 =3D &xr829;
> --=20
> 2.25.1
>=20

--TnwQBgyZeUS8jdJs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCcozQAKCRB4tDGHoIJi
0htEAP0diQJ9Zbhuux3uzUrGT5BnDcXMtCUEsij5CLqMnsP97wD+MhvYerrIgPU2
VSRJF3YaWTBm0hqklFNbFU7LFRj0sg0=
=cDyc
-----END PGP SIGNATURE-----

--TnwQBgyZeUS8jdJs--
