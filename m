Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE45256A
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 17:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7F4C433EF;
	Sun,  8 Jan 2023 17:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673198162;
	bh=fzAgiRFGHR3+GZQIA6FSB7Y5pqtCmssmPkzfvI9PDik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ugSoSfG8YK4MiPNvmgHKQd2u6R4hYWSQLpNXxOlfys/IgPDiESDl9ClGuf7f5HnwX
	 oKT6HIzSPf2QaYW7AWi6o2YyMSU+Tn+0cndHgC+c2ZUvp569FJkmm8ZJ4v1WVLnN/g
	 vJc1njobRAXmHxjvEd0uMJqGhBLEx4srmrk0neSSo45BUDzYBNj478/Ct66UhElPee
	 zDSpsuuwxgDujKFt51c8olpbMG2jhMuq0ziBhA9E0/wm45RZkYlb8XvEguUQlaOP/2
	 5ZympTpJVqbXSk26pGg0H9KR6fjluZ0CDyYJH6cQsY3bJYgDF+AO06iy4c2KdnS5mn
	 z4l7KJR12SL+w==
Date: Sun, 8 Jan 2023 17:15:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	=?iso-8859-1?Q?Andr=E1s_Szemz=F6?= <szemzo.andras@gmail.com>,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 1/4] dts: add riscv include prefix link
Message-ID: <Y7r6TLTm1r+IlrYj@spud>
References: <20230106010155.26868-1-andre.przywara@arm.com>
 <20230106010155.26868-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0sHedhGUJCjd0u9E"
Content-Disposition: inline
In-Reply-To: <20230106010155.26868-2-andre.przywara@arm.com>


--0sHedhGUJCjd0u9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2023 at 01:01:52AM +0000, Andre Przywara wrote:
> The Allwinner D1/D1s SoCs (with a RISC-V core) use an (almost?) identical
> die as their R528/T113-s siblings with ARM Cortex-A7 cores.
>=20
> To allow sharing the basic SoC .dtsi files across those two
> architectures as well, introduce a symlink to the RISC-V DT directory.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  scripts/dtc/include-prefixes/riscv | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 scripts/dtc/include-prefixes/riscv
>=20
> diff --git a/scripts/dtc/include-prefixes/riscv b/scripts/dtc/include-pre=
fixes/riscv
> new file mode 120000
> index 0000000000000..2025094189380
> --- /dev/null
> +++ b/scripts/dtc/include-prefixes/riscv
> @@ -0,0 +1 @@
> +../../../arch/riscv/boot/dts
> \ No newline at end of file
> --=20
> 2.35.5
>=20
>=20

--0sHedhGUJCjd0u9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7r6TAAKCRB4tDGHoIJi
0svYAQDfXmAfIvPLwZWb79WQkRX17ndbEOGiAWczgPvcsZVEYQD9Gh9E4PYzuC6e
4QRB0vH6i/fo3SyEvyVctlyGY+JOpwE=
=5fRf
-----END PGP SIGNATURE-----

--0sHedhGUJCjd0u9E--
