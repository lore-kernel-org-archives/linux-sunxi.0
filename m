Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC7C1DDA1E
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Aug 2025 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754123858; cv=none; b=d1BGITlnPlpfmh7UB0tQPAIeCsKchUZlw/T0zfylEH1VeKpUaHPRvlECN0kqH3VtSXSMV0X7Sj57tQmsnzDPu7roTE9DVUE6hnqE0IR6GV/RSj4u4cgjZGWsGmzuRUXDRo1lBA5oeqX77TPMvaDRDBxixBYOke46qtsWzduWMx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754123858; c=relaxed/simple;
	bh=VRmEQehT13hoav9UV+YGv07MztSVBFa12ZZsP4vejgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EjlMNgKI3NcRCkNeXqm/3p286Kn43W3NpapebbewbGRezuUyuqQ8QwY/2+RvNKyMjceteozgjVLoR8dLTqkVUfCBkxr7oEZBTe/eTl7gizevXy7mHK6Dv5i9Tb2iyFfo4pEMIFpgWcG3rjPj5MQxLa400eL+SpPuRdXY9DNFjkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=0sHXMFW8; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="0sHXMFW8"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=KQZZ+0jK1+XLkNRJOHK8URDiCs8iQhKqRqCZUWjluyQ=;
	b=0sHXMFW84qP+Rjpn6EcUH/MqgjtNmdP5tnX201cpAIS3ipdVTNwSCEI2g7D9d9Lz+C7QAhsHnqC1wKFe+uHHT+Ko/Q5jwIzFH2yCRSlF5XI5KNk9rX2YSWCyPZ4jqyjuq968W/xRYdSWZ72Bxbdy2lFRp0ojiW3B9Pyj4+jcyVY=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sat, 2 Aug 2025 10:37:33 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev
Subject: Re: T113-S3: Secure Boot
Date: Sat, 02 Aug 2025 10:37:32 +0200
Message-ID: <6179940.lOV4Wx5bFT@lukas-hpz440workstation>
In-Reply-To: <20250802010939.4d345876@minigeek.lan>
References:
 <4693897.cEBGB3zze1@lukas-hpz440workstation>
 <20250802010939.4d345876@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5029590.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5029590.31r3eYUQgx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev
Subject: Re: T113-S3: Secure Boot
Date: Sat, 02 Aug 2025 10:37:32 +0200
Message-ID: <6179940.lOV4Wx5bFT@lukas-hpz440workstation>
In-Reply-To: <20250802010939.4d345876@minigeek.lan>
MIME-Version: 1.0

On Samstag, 2. August 2025 02:09:39 CEST Andre Przywara wrote:
> On Fri, 01 Aug 2025 22:33:19 +0200
> Lukas Schmid <lukas.schmid@netcube.li> wrote:
>=20
> Hi Lukas,
>=20
> > I=E2=80=99m working on enabling secure boot on the Allwinner T113-S3 (a=
s part of
> > preparing my SoM design for EU CRA compliance).
> >=20
> > I=E2=80=99ve successfully fused the SoC with secure boot enabled and bu=
rned the
> > ROTPK_HASH.
>=20
> Brave! I think so far we rarely have seen people actually written the
> ROTPK hash, but apparently that worked for you!
>=20
> > The SoC correctly boots a TOC0-signed image from SD card, and U-
> > Boot starts up and behaves as expected.
>=20
> Ah, nice!
>=20
> > However, when I try to load and boot the kernel from U-Boot, the board
> > hangs right after U-Boot hands over control, no further progress. The
> > same kernel image worked fine before enabling secure boot, so I suspect
> > it might be related to the secure boot configuration or runtime
> > expectations.
>=20
> I think so. The common problem is that without the secure boot fuse
> burnt, some devices that are documented as being accessible from secure
> world only are actually usable even from non-secure world, at least
> that's the case on the A64. The SID is one example, hence U-Boot
> (already running in non-secure EL2 on that chip) cannot read the serial
> number and thus fails to calculate a MAC address, when using secure
> boot.

So I actually know when I am in U-Boot and try to memory-dump the SID's mem=
ory=20
range (the shadow register? at offset 0x200) I can actually read it fully, =
that=20
is as long U-Boot was loaded over the signed image. If I load U-Boot over F=
EL=20
and try to dump it I only get the first 16-ish words.

> Another thing that is different is access to secure SRAM. That's
> supposed to only work from secure, but works from non-secure as well
> (on the A64), when the secure fuse is not burnt.
>=20
> So I would check those two things (SRAM + SID). Can you enable
> earlyprintk in the kernel config, to get really early output from the
> kernel? You would need to set the UART address and such in the config.

I'm building a kernel right now with earlyprintk, but I am unsure as what I=
=20
should set for the config. Since the T113-s3 has it's "Console" on UART3 I'=
d=20
need to specify the 8250 on a custom address. The base address is probably=
=20
then 0x02500C00 but do i also need a Virtual address and if so what does it=
=20
need to be set to?

> The first code to run on an arch/arm kernel is the decompressor, that's
> a rabbit hole of its own, but I doubt that it's triggering any of those
> devices.
> You could try to add "pings" in the early code to output a life sign on
> the UART, to see how far into the code you come.
> In assembly:
> 	mov	r1, #0x2500000
> 	orr	r1, r1, #0xc000
> 	mov	r0, #"1"
> 	str	r0, [r1]
> In C:
> 	volatile u32 *uart =3D (void *)(0x250c000UL);
> 	*uart =3D '2';
>=20
> I also have some simple bare-metal C runtime, that allows to compile
> into something that looks like a kernel, and would allow you to verify
> that the kernel image is loaded correctly and executed at all. Let me
> know if you'd need that, I can then make you a simple version that says
> "Hello".
>=20
> Hope that helps!
>=20
> Oh, and please join us on IRC: #linux-sunxi on OFTC, that makes this
> kind of debugging much easier.

Sure thing. However I had tried it on there once and somehow the IRC Chat=20
didn't actually send my message. I did see it in the Browser but not on the=
=20
archive or any other IRC Chat...

>=20
> Cheers,
> Andre
>=20
> > I=E2=80=99ve already tried debugging U-Boot and confirmed that the kern=
el is
> > loaded and `bootm` is called; the system hangs at that point.
> >=20
> > Here are the versions I=E2=80=99m using:
> > - **Kernel:** Linux 6.15.4 (mainline)
> > - **U-Boot:** 2025.07-rc5 (with custom devicetree and I2C3 modification=
s)
> >=20
> > Is there anything specific I might be missing when running the kernel
> > under
> > secure boot on the T113-S3? Any guidance, common pitfalls, or pointers
> > would be appreciated.
> >=20
> > Best regards,
> > Lukas


--nextPart5029590.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmiNzkwACgkQJnN+drMV
RthIZwf/U+3hycs3IPKv58jqU5UDyJA5OtoqSM/0nL+4/ha4d6I73KVO6gFtGxpq
/i5zAq0XGG+eUjWplOqwm6ThmnG7MRT9K5Sg9VP48Dl0q3FgvPk2l+e3dPExSOsK
pyuTJG2doUXbnobQjOaXkzaAdb8lheo7KLrMjt59aAxsUM8dmtdPYjLflAZHptL3
qHCFAInMzV5w0RV2TNSPqEq90R9mKFi4etAjnoU7dralw+6uCi9gwUqtrB2/Z3ol
laMnXsCiCuwhyiWMPVXwLEKoIYKPOBkaYfTF3xN/j9lj3JrSY/PvdKRVqadrEmKI
CFOyNLKP1tt5Ry4r5CzhsnYl0YP6eA==
=2EYS
-----END PGP SIGNATURE-----

--nextPart5029590.31r3eYUQgx--




