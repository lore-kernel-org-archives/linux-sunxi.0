Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.233.101.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374429;
	b=cA0FI2KLoCtWcHU7GjydZc69kQdH6OIBzKcl7RdC6T9m8x1WD2A17J9Eak8ErWrhCWfS
	 qMCbZDue15Ov8ugO/F7Hw4epndx1/V9BEjmhDxPyynaRkNBfz8wOT6Or7mXLK83BJnSbi
	 JZfpaaVeYlS5YNS2mH8htXH+oBOCQFPj0vkXQWQSJWRehjVGCrl+gCn/K9dgZ98lTNxye
	 JUEncTmEjJQUJZn22/Z91snZejeiFdhO555EKzs9JfXkRopXbtame2G/fjs2HR0X/RjLe
	 +p9qv5agNjmOFwsfdF3lhHpvroMGJ0xXXcMRITbxT+zJCTyatG2WAc7MWmbDzcQTBaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374429;
	h=DMARC-Filter:Received:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=K7f/cQtkNUPTYUSwgl5HAgtl63crP2LKRsnz/L6mQZM=;
	b=uqixJA73jHXwDz9Bcfnen8abosh3kw6KIHUCXppDmaG5iB46wl1ZvLx09xX+AiI2BsQZ
	 12WiGDpyqwytGcza+a8KQPAlN8w/MLXmC3XNNzuiBDPZRhmQRr7Im0qJe0O5RiNndiWDK
	 jRjOOnVzsu1GaqhW45dXq5W/uqi9LlpoKQe3YEtGI8goVXL9EuzR8IC8y830cz51Tq8Y3
	 VGx4lq53+JjlIz1jFUjnK+CB2VKwnPuxoMvOBe8Aq4dMHt+qJMdWGtkqUYSumG6uRxV+o
	 ftqub2+0Q2WnqzDqQ5Cyp7UNI8X5dkX8hcHx2jUXsAFnZ3f0c7DrWDshCJwrvYmtFsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sys-base.io;
	spf=pass smtp.mailfrom=sys-base.io;
	arc=none smtp.remote-ip=185.233.101.22
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FA0606A31A
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 15:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26FA0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E7DC33700EFA
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 15:33:38 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id D0A91B72BB6; Fri, 30 Oct 2026 15:33:37 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (82-65-240-19.subs.proxad.net [82.65.240.19])
	by laika.paulk.fr (Postfix) with ESMTPSA id 48E1DB72BB5;
	Fri, 30 Oct 2026 15:33:37 +0000 (UTC)
Date: Fri, 30 Oct 2026 16:33:35 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.u-boot-project.org, linux-sunxi@lists.linux.dev,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [PATCH] sunxi: a133: adjust TF-A load address
Message-ID: <auS4xwW6QuXaptlc@shepard>
References: <20261029233720.8411-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2L2QjHgHXD7tLOQY"
Content-Disposition: inline
In-Reply-To: <20261029233720.8411-1-andre.przywara@arm.com>

--2L2QjHgHXD7tLOQY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Fri 30 Oct 26, 00:37, Andre Przywara wrote:
> When development of the Allwinner A133 TF-A port started, BL31 was put
> in SRAM, like on the similar H6 SoC. Consequently we used the same SRAM
> address as the H6 in the Kconfig stanza of the A133 U-Boot port.
>=20
> Later we realised that the SRAM space will become too tight, in fact it
> was already spilling over into SRAM C, which we cannot use any more at
> runtime, once the display engine is used. So the mainline TF-A port
> eventually put BL31 in DRAM, which of course requires a different load
> address.
>=20
> Adjust the BL31 load address to use the same DRAM location as the (almost
> SRAM-less) H616, by just adjusting the match pattern, to not let the A133
> fall through to the SUN50I_GEN_H6 symbol.
> This allows U-Boot to use the now merged mainline TF-A port for the A133.
>=20
> This is unfortunately a breaking change, but there is not much we can do
> about it, and since U-Boot packages TF-A in our booting scheme, we have
> that under control.

Thanks for submitting this! I agree this is the right thing to do.

Also note that I've been using the 0x104000 SRAM address as base for the
crust SCP firmware, which will be submitted once crust support is there.

Another aspect is that I'm not sure we actually lock down the address in
the TZC, so it's likely that Linux could still overwrite the TF-A code.
But that's a TF-A problem, not a U-Boot problem.

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/mach-sunxi/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index b0c5d3cd903..b7ee14c6678 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -267,7 +267,7 @@ config SUNXI_RVBAR_ALTERNATIVE
>  config SUNXI_BL31_BASE
>  	hex
>  	default 0x00044000 if MACH_SUN50I || MACH_SUN50I_H5
> -	default 0x40000000 if MACH_SUN50I_H616
> +	default 0x40000000 if MACH_SUN50I_H616 || MACH_SUN50I_A133
>  	default 0x00104000 if SUN50I_GEN_H6
>  	default 0x00054000 if MACH_SUN55I_A523
>  	default 0x0
> --=20
> 2.46.4
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--2L2QjHgHXD7tLOQY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmrkuM4ACgkQhP3B6o/u
lQx+XhAAjSX3tkOfKMe2iiGawjl6f2PKlDL7jRbI2Ns9m/meBrLo2rm0xciPREIm
d/wUfmMtbDoqMaEqJRlpchytC0JxyLKHc1GfN+IskUAXJces9YQbIUB8xNrfYBA5
pR52CIpKRYtIzsZjsj3fVtWUZb/BEhloviLLEcieI9bUF2bz7/nl0sYhTh7/Wcqu
MlZsvLBSl0mrc+xSzhLocOa+eZ7ftiQIjuV5BZPXt8p5u4Eb7Fr7GRTnBOiEPXlb
+sVKT5wKbkCwtKXkS6WKu/LTkf2t0tyfhfMlvhYHSMTB7vi/WLBc/w1Zl4+69JDF
AVpZie4W8h5PLhZ+CBIQjbES2KFmEz+8ave1NqApNJSnpRTcjgn9640Ep5YGibWY
fxgy+Joh/UoOUfejGZRT1/K5XQSL9qL2LEsKFosplivybK8JU0VZ9P4tcavpURUi
HhIOruiMjzmHepglBtznekPprqYgH0cERhtBwFXnDicdu/TqEZR0u9/dRZC8rGa5
fqt54vbwX1+0GLwg/M7upfTvhvdFhUL1xUX3pC+Qx9hVPD2JTJY7RDtZkgDBdH5m
ZJbCJ6eN62fvWcguQn0l5xKvVXslAS6xowHhg5HNv0JV90+oC3h5hbrtNe5/40sV
6mo4fJKpiu81gx/GprjOzkrxDETeiCw92QrD8EKApJMg2LmgRYs=
=Ygfx
-----END PGP SIGNATURE-----

--2L2QjHgHXD7tLOQY--
