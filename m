Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0563E367
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Aug 2025 00:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754093529; cv=none; b=XuUjIvAWBlh51XixStXo0dsf/OV4xq8Ai7KpzMl99eYdkU0ZjsceYsurlxv4Xpcwbb/RxZOWw4IQcCeglYOXYrxfkYUDWywcilwLPbKWr4D55ChoDcosmYza9CnqmwRxCixKLmSbzbLXm9RywN9zf/v6xiVbkMJ+JgGlOOBE2VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754093529; c=relaxed/simple;
	bh=xpousWOI3+YpYuW6mQHgnLbi5BKrrxTA8WEyp+s7imY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T9Yyz3esUsMlhgzzGmXNdYHD0E5yF0wyecAuOcJc491DbHOO001kfLjg8xcvhd1K1HQGg0/CkDg2TED3i9Id6iUqIKhVbIPoO3+w3DerqXH93yC9s2y7+WFYwT47zj2VMpqUzWOf2lLZkm0Z1xlP8U4+/XGsscyQRgSxCV+QZrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C72F25E4;
	Fri,  1 Aug 2025 17:11:59 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADD223F673;
	Fri,  1 Aug 2025 17:12:06 -0700 (PDT)
Date: Sat, 2 Aug 2025 01:09:39 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: linux-sunxi@lists.linux.dev
Subject: Re: T113-S3: Secure Boot
Message-ID: <20250802010939.4d345876@minigeek.lan>
In-Reply-To: <4693897.cEBGB3zze1@lukas-hpz440workstation>
References: <4693897.cEBGB3zze1@lukas-hpz440workstation>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 01 Aug 2025 22:33:19 +0200
Lukas Schmid <lukas.schmid@netcube.li> wrote:

Hi Lukas,

> I=E2=80=99m working on enabling secure boot on the Allwinner T113-S3 (as =
part of=20
> preparing my SoM design for EU CRA compliance).
>=20
> I=E2=80=99ve successfully fused the SoC with secure boot enabled and burn=
ed the=20
> ROTPK_HASH.

Brave! I think so far we rarely have seen people actually written the
ROTPK hash, but apparently that worked for you!

> The SoC correctly boots a TOC0-signed image from SD card, and U-
> Boot starts up and behaves as expected.

Ah, nice!

> However, when I try to load and boot the kernel from U-Boot, the board ha=
ngs=20
> right after U-Boot hands over control, no further progress. The same kern=
el=20
> image worked fine before enabling secure boot, so I suspect it might be r=
elated=20
> to the secure boot configuration or runtime expectations.

I think so. The common problem is that without the secure boot fuse
burnt, some devices that are documented as being accessible from secure
world only are actually usable even from non-secure world, at least
that's the case on the A64. The SID is one example, hence U-Boot
(already running in non-secure EL2 on that chip) cannot read the serial
number and thus fails to calculate a MAC address, when using secure
boot.
Another thing that is different is access to secure SRAM. That's
supposed to only work from secure, but works from non-secure as well
(on the A64), when the secure fuse is not burnt.

So I would check those two things (SRAM + SID). Can you enable
earlyprintk in the kernel config, to get really early output from the
kernel? You would need to set the UART address and such in the config.
The first code to run on an arch/arm kernel is the decompressor, that's
a rabbit hole of its own, but I doubt that it's triggering any of those
devices.
You could try to add "pings" in the early code to output a life sign on
the UART, to see how far into the code you come.
In assembly:
	mov	r1, #0x2500000
	orr	r1, r1, #0xc000
	mov	r0, #"1"
	str	r0, [r1]
In C:
	volatile u32 *uart =3D (void *)(0x250c000UL);
	*uart =3D '2';

I also have some simple bare-metal C runtime, that allows to compile
into something that looks like a kernel, and would allow you to verify
that the kernel image is loaded correctly and executed at all. Let me
know if you'd need that, I can then make you a simple version that says
"Hello".

Hope that helps!

Oh, and please join us on IRC: #linux-sunxi on OFTC, that makes this
kind of debugging much easier.

Cheers,
Andre



>=20
> I=E2=80=99ve already tried debugging U-Boot and confirmed that the kernel=
 is loaded and=20
> `bootm` is called; the system hangs at that point.
>=20
> Here are the versions I=E2=80=99m using:
> - **Kernel:** Linux 6.15.4 (mainline)
> - **U-Boot:** 2025.07-rc5 (with custom devicetree and I2C3 modifications)
>=20
> Is there anything specific I might be missing when running the kernel und=
er=20
> secure boot on the T113-S3? Any guidance, common pitfalls, or pointers wo=
uld=20
> be appreciated.
>=20
> Best regards, =20
> Lukas

