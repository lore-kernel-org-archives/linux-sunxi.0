Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080B01FCD1F
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jul 2025 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751893698; cv=none; b=AIrR2oqvb0v8JI9oDsRGBgf4B896s6kjVkMpAa5vHwV/9Dp9CeZl27rQM1v7qByO/4cFwt3KRoLTzyobLob8GThE5lcMyCFdJW1w8+zlCVDwMY0N0+fh4O6IcjT++MiO6H91vgYuw1TxZRYjGLHYv4QosEpak4C1bc8uKz9/ZYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751893698; c=relaxed/simple;
	bh=4cNymX/+OghZEkodkPTS6BZZqllfdK59BgkN0E0Bzvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UHxK5ZGXhaal/camzUovrLCqn8AYL9laH+uS5Czigk5wMNoWg38qNyjhvxWN2JsW8X+Mb0I1bwdQDg4jD74Divp8bPhb9mwgM4TDiXZVeARyJD7nLd1dqtkVDAPdj/ymhYuMdpLX540UP9WfIq8OXhIjJnsCo9fAZ4sbfaSYXJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=RtLkOV5Y; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="RtLkOV5Y"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=9/OEQrPbr4o/6uE9GATwRp929wvDzUsVe4R9+gsS4zU=;
	b=RtLkOV5YO8XYSZgyIcusyXVipDmoAzTnTPjDcIZ8mjhgfzo/ieIhhIRzYpVYLVTd+7Zsy+IhsjjU/Atc1j0UnDo4b0Jd9KydUsKRGH0TJsmDTGIUj+jQYvdG57snNftesbwDXo+AcSOiG/Y+TIo+nRVmVnlvS10uisahLxLi7XM=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Mon, 7 Jul 2025 15:08:05 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject:
 Re: T113-S3: reboot fails unless "wdt" node is enabled =?UTF-8?B?4oCU?= safe
 to set status = "okay"?
Date: Mon, 07 Jul 2025 15:08:04 +0200
Message-ID: <8591557.NyiUUSuA9g@lukas-hpz440workstation>
In-Reply-To: <20250707140217.56955b52@donnerap.manchester.arm.com>
References:
 <9473157.CDJkKcVGEf@lukas-hpz440workstation>
 <20250707140217.56955b52@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2029153.usQuhbGJ8B";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2029153.usQuhbGJ8B
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Date: Mon, 07 Jul 2025 15:08:04 +0200
Message-ID: <8591557.NyiUUSuA9g@lukas-hpz440workstation>
In-Reply-To: <20250707140217.56955b52@donnerap.manchester.arm.com>
MIME-Version: 1.0

On Montag, 7. Juli 2025 15:02:17 CEST Andre Przywara wrote:
> On Sun, 06 Jul 2025 19:32:35 +0200
> Lukas Schmid <lukas.schmid@netcube.li> wrote:
> 
> (CC:ing Samuel who probably knows more)

Hi Andre,

> 
> Hi Lukas,
> 
> > I'm working with a board based on the Allwinner T113-S3 and running a
> > recent> 
> > mainline Linux kernel. I noticed that calling `reboot` from Linux results 
in:
> >     Reboot failed -- System halted
> > 
> > After some investigation, I found that the watchdog (`wdt:
> > watchdog@20500a0`) is marked as `status = "reserved"` in the mainline
> > device tree.
> > 
> > If I override that node to `status = "okay"` in my board's .dts file,
> > reboot starts working as expected.
> > 
> > Is there a specific reason why the `wdt` node is marked `"reserved"` by
> > default in mainline?
> 
> Yes, that is deliberate. The T113s uses the same base devicetree as the
> D1(s), so we share a number of watchdogs. I cannot remember the details,
> but I think the idea was to pick the right watchdog for each SoC variant,
> and dedicate one for firmware.
> Consequently we fix this up in U-Boot, see the commit message here:
> https://source.denx.de/u-boot/u-boot/-/commit/95168d77d391b1464
> 
> So if you just use the DT from U-Boot (by just using $fdtcontroladdr on
> the bootz command line, instead of loading a DT from some storage), you
> will get the fix for free.

So if I need to load the dtb from storage (because I have different trees for 
my carrier boards) I need to patch the device tree specifically for my devices? 
Or have a custom U-Boot built for each carrier board instead of the SoM?

Would it be possible for me to enable the watchdog in my SoM's dt as I do not 
intend to have the RISC-V variant on my SoM due to the missing CAN interfaces?

Best regards,
Lukas

> 
> Cheers,
> Andre


--nextPart2029153.usQuhbGJ8B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmhrxrQACgkQJnN+drMV
RtiLBAf/Zs5vJAEq9rdzUbdZXkUIXc3xwYVmBapAbnQ5gnRt/oHghQelWwsf8IkQ
uuMY95yUaix9WNSJQEp3vXVsmvwzTTtK0vuTnZDwnSL928RqF1XDIMZnnidBAufw
RlBEDC24b64EPEURDKH0dl/w/E1vlej+THuIIOyYjeVlSZHEohqvzbOhPWh36J9d
idG0bBX3Y3M4Sbyb8GyFbcAt/qod2LXjtupoE4/2NNSAOUD81GD5x0jgCq6NuMha
jSjfHAEiO7bBVVjJlGzt9Y+ez6/q8Qaxw0m+ujnSjRg/Wz13SxXw572DIfnIxAVJ
hNi8tX+bPuAQvpChQndGOkMqQ3WGig==
=zlnF
-----END PGP SIGNATURE-----

--nextPart2029153.usQuhbGJ8B--




