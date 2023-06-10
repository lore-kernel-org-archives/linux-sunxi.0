Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE5223C5
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 17:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DAFAC433D2;
	Sat, 10 Jun 2023 17:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686419976;
	bh=324/nSprEXjx3/4ifqHmnHXL3quqYl+6QpzMOZ+i0e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihinwVsf7EWheCryMaS73Y+fLmVsjcCX9jynU1z6WRiX3DuE8Zl1hNHupJ09bLgni
	 bgb2GnPANnD7LS94BaIFIwWhnYY7A2No4XjZ13psv4P6lcAKnSWTUZn2448JWBouMr
	 H+ZIWlyS5l9kWWMiUeemiKbEiCF2KfzClI+QcdplVglfg3M0FtZo+H7+LdD+2ZLeMi
	 mzLSG16TgjMmZq0Py+nFIR0LL0Bb06p5jFevjqus5D8KN9KIZ03IArzqNeUEyJRWQX
	 RdtwcPN8lKIzu7KoYiwcaczYBW/tEiU9bzWGt2HbicneKhVsXtp8xFPxOIhXj7CWXC
	 2CKwsqmnIv/NQ==
Date: Sat, 10 Jun 2023 18:59:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 3/3] dt-bindings: thermal: sun8i: Add binding for
 D1/T113s THS controller
Message-ID: <20230610-enlarged-agonize-0e9219f9921d@spud>
References: <20230610141739.999268-1-bigunclemax@gmail.com>
 <20230610141739.999268-4-bigunclemax@gmail.com>
 <20230610-rehire-amid-2517f43504c0@spud>
 <CALHCpMiEmc8L=O86_x7-KkBHFwf2QpuP0M7ugz7dNPr71cpJmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hu94nUGXXByK8w7k"
Content-Disposition: inline
In-Reply-To: <CALHCpMiEmc8L=O86_x7-KkBHFwf2QpuP0M7ugz7dNPr71cpJmQ@mail.gmail.com>


--Hu94nUGXXByK8w7k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 10, 2023 at 06:30:48PM +0300, Maxim Kiselev wrote:
> =D1=81=D0=B1, 10 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 17:52, C=
onor Dooley <conor@kernel.org>:
>=20
> ...
>=20
> >
> > Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> > Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> >
> >> Why do you have 2 sign-offs that are both you w/ different spellings?
>=20
> Sorry for that. I accidentally signed it twice.
>=20
> ...
>=20
> > +  - |
> > +    thermal-sensor@2009400 {
> > +          compatible =3D "allwinner,sun20i-d1-ths";
> > +          reg =3D <0x02009400 0x400>;
> > +          interrupts =3D <0 90 0>;
> > +          clocks =3D <&ccu 0>;
> > +          clock-names =3D "bus";
> > +          resets =3D <&ccu 2>;
> > +          nvmem-cells =3D <&ths_calibration>;
> > +          nvmem-cell-names =3D "calibration";
> > +          #thermal-sensor-cells =3D <0>;
> >
> >> Is this calibration required, or optional, for the d1?
>=20
> Calibration data for the D1 is optional as for the H6.
> (But without it, the sensor data will be inaccurate).

Okay. Modulo the signoff:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--Hu94nUGXXByK8w7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIS6AQAKCRB4tDGHoIJi
0mIxAP0Z0nJBW9IvYaLg3JZ0QkCPW8ByQAELNYI7OJWCvFzSagD/RjpEIdIWBIMz
fIc7+Dh1sntIbmOh0+71Nu4lyjVlLws=
=TcS+
-----END PGP SIGNATURE-----

--Hu94nUGXXByK8w7k--
