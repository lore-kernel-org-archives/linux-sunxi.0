Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631896;
	b=HyTfVR50KMvFQKCXiO3wfw1IGkw4r9lGBph0Znt0UQA/DJiJOvGmW0glQ/nnq2sReLcH
	 gPrs0wcjnHVHeEZCurKKSzaXdtXpz51xOd5eqph08mAcSbmLpXakvHfp2O/RdLozKwKpU
	 LZgqw8XH37EdKX9pWy7V8JT+Iww+nkBFZD3ivhH8hBMDS7hNhHQkfMcwFtUJdb8zXP+CG
	 wY1ECiMwlrpwsE7KUSQzuZcQhbX15vr3sQels+e1v0C2JKT/KicbbtluHOwprBtOMxubn
	 qgCgU+iuEgwAo4zAKYwP4zwPEDpU9WlfqkD37h8LIQbOtQBbiHGgvFLKMeXPiuowrtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-Clacks-Overhead;
	bh=TPHHC+FDzeSZpjX1KRbMjHfkRgvrJt73wuV3K1uZEwc=;
	b=jF7YPkq+8+HLRFmMWp0dCXKZXpcMKKSiLN2jqYnnxj7OmksS3Wd7JHfOpwKNDoN+4Qua
	 fSpKPWgbliS+qLKtgjp6CnfFxcDa+lGIP8V5JD0ZJlec2DJyYjtsYDK6bdaW4o9X1Q/1H
	 Ej7MKJQSUg7t8bUck1EsGd/jA4AqU4+S22wkXbBKUh0T7K7koHV1y0LpdhYG3V9f8bR0N
	 +hKVgiT6QwqWHUBugqLc0L25P9sPpGgRjHnUEU2OwvAp6t+ZKE93ZkyDGegbgMmvDWtbn
	 Pz1qw9nv4UaWN1iTTm/4RDSy8r+kbsQvI+07EjZC6yjARQLjpnu0tS94mwTbrXCPgQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=g+Pi1Pcr;
	arc=none smtp.remote-ip=74.125.231.65
Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9301D606ABA9
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 15:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9301D606ABA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=g+Pi1Pcr
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-44d32c0c2fbso135276fac.1
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 07:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793631894; x=1794236694; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TPHHC+FDzeSZpjX1KRbMjHfkRgvrJt73wuV3K1uZEwc=;
        b=g+Pi1PcrqptuPYJqQ5+MzWGWSKKhK2ozMnIz+KMLRJ9J7RQxpNWO0hgbL6Zh5o//IL
         ykiBtO/lb+wW7V6fANSLlUSPKEbK+NgSSVAEhrWhtEHhH13qPJTBLYx0W6h5PBVHTmH1
         AJDGCqmp7hejlr6eecRlLrAXBO0z8Pa9SglcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631894; x=1794236694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPHHC+FDzeSZpjX1KRbMjHfkRgvrJt73wuV3K1uZEwc=;
        b=aOr7ahIJ665BtzPsEwm88jlict3TiUntAKeh8BYGPor7NcOx9TzpvUaoonxNnuvdbx
         MC/crm8nsxIQIklejz27L2P27425JW3siZdVwfyDPTjvM7+s8kMwQIJZy9hkDUy/36A4
         I7DtYPNg7/5Bw+hQcZ9NVt/IgdasuJz+6ZO4VK+nhgV5I8zHhkhDXq8tJgk855yL62bP
         soCq63xGoo7oXivPILS5WIp1KyiaimVySDyH0z+mtGAqiW+lcOL/xc7UtrRxlbyxb55+
         GTxR5nqy9I/PCKYSawtG0UsM+05hPXfiaXGCCNOJ9ZVFwH3ctlTnGKH7fngRoXtl1VVS
         v+ag==
X-Forwarded-Encrypted: i=1; AKwUvBzJvtFIjvXa4ZepQYODawMNEMczHQZm13MPhz4nttzIAAGj1kxJYPok+dmhdw6tunhxHyB5hi9B1Fn0Fg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/GjfR2zFdSWEkD1897CRbtmvO7iepD67f/MeFAGBRn4+G7hZXd
	k34e2C/svPfCzI37+Vs7misTkv1WeS9rNbrQ+NZe+4+uNSs8arhkFKJ5fCsSP8CQprw=
X-Gm-Gg: AYBFou0zcyUs2EqIEkvCRo0QPVvv7zOFwSk7AjKwhFHQfKfy0einIsdZSfa9Vq/0Lv6
	9RB951T/NbGyZcGPxSndkhQ4svJmo4lBetHTnIc1C9XSIO95ihFSaHcNwIrvAUq1+KlJFd9MYKh
	wxUUjHjFPgh81/JdFK8V2UbpiPN6Vw2gBsXsEoOUMj28JDg6EpBK1keGnoJXlOVVZNs5Xak/Ct/
	mrdzzKLqTIuW/H/nbLiQIShocvhjrg/MlOJM4DcEwRg4K+ElkxY6Sdqyw06V2uyDN0+EQLWwz1E
	emZCTqF8Hglc4BrJzsj9pWX1vi8cxBANMNJk1683cuZLKJoNTwenNxm+nDDGNuXeqNlI93pxus1
	jsJsgg2nshAYBJ/5UnUA171Rgi5nNUdNhLAXmyMgwmnbFGVxx9j0HRbImmM+BuA1oyTcybdz09/
	+vOlaomNG83nFSx2ITTHkEOtI8z0itQf6ZsYCahdkHm4lIiJxQxyWwSD+o/QQ8dv6SXL4X4dh/0
	cRm3MI0m1BJwkpYOsqgga3KiPZZ4LsALc2Qm3us2Xp1OCnERvptzEQpcl4UXgslkMaSnDxh5NRP
	/4h1+3x9BvcIX1p6YCg/asXjSTG++SROU5nGcvkHkfdyD1Dh7NYocHOimSYA4bNQCR+OCju6vW3
	oTAEubZa2kpg2w/dL5ayGbCSFQVCYgbNPqaaMeIQYS41TokUbqpvVaZCVol6euqfVa/sHLR9eEc
	mkqMQxY6C0ZeD6uxD4+aYH9iruw4l9vQ==
X-Received: by 2002:a05:6870:5b94:b0:494:8edc:477d with SMTP id 586e51a60fabf-4a906c6fd40mr4865484fac.0.1793631894378;
        Mon, 02 Nov 2026 07:04:54 -0800 (PST)
Received: from bill-the-cat (fixed-189-203-100-56.totalplay.net. [189.203.100.56])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a95d970b9bsm2480562fac.8.2026.11.02.07.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:04:53 -0800 (PST)
Date: Mon, 2 Nov 2026 09:04:50 -0600
From: Tom Rini <trini@konsulko.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Andre Przywara <andre.przywara@arm.com>,
	u-boot@lists.u-boot-project.org, linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Christian Ratzenhofer <christian.ratzenhofer@cdnm.at>
Subject: Re: Pull request: u-boot-sunxi/master for 2027.01
Message-ID: <20261102150450.GU3309461@bill-the-cat>
References: <20261102114733.3468703-1-andre.przywara@arm.com>
 <20261102144240.GS3309461@bill-the-cat>
 <a4934306-eb4d-4a0b-b693-82b8f8d831b8@cherry.de>
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
	protocol="application/pgp-signature"; boundary="Z/Wi+ZShRVJ4wuxF"
Content-Disposition: inline
In-Reply-To: <a4934306-eb4d-4a0b-b693-82b8f8d831b8@cherry.de>
X-Clacks-Overhead: GNU Terry Pratchett


--Z/Wi+ZShRVJ4wuxF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 03:53:01PM +0100, Quentin Schulz wrote:
> Hi Andre,
>=20
> On 11/2/26 3:42 PM, Tom Rini wrote:
> > On Mon, Nov 02, 2026 at 12:47:33PM +0100, Andre Przywara wrote:
> >=20
> > > Hi Tom,
> > >=20
> > > please pull these sunxi changes into main. Please note that's the mas=
ter
> > > branch on the remote side, the main branch is immutable, so I couldn't
> > > push a fix there again.
> >=20
> > Ah. On that note, I think the answer is you should start using a branch
> > name (for-tom, whatever) or tag, rather than just pushing to "main" or
> > "next".
> >=20
>=20
> Maybe check in https://git.u-boot-project.org/u-boot/custodians/u-boot-su=
nxi/-/settings/repository#js-protected-branches-settings
> if main is protected, then you can unprotect if you really want to (or ad=
apt
> it to match what you want). Just telling you how to make it modifiable
> again, but maybe Tom would really prefer a different branch name as
> requested in his previous mail.

Yes, it's also a best practice. A thing I'd really like, and maybe I
need to write a best practices email, is a tag with a "here's what
changed" as the contents. Then the merge commit is automatically
populated for me :)

> > > Not much to report here, some cleanup for some older V3 SoCs, also a =
PMIC
> > > fix for some Olimex A20 board.
> > > H6 boards with 3GB of DRAM now work again, and the A133 build process=
 gets
> > > adjusted to the now mainlined TF-A support.
> > >=20
> > > There are bigger changes lined up, but they depend on DT bindings whi=
ch
> > > have not been merged to the kernel repo yet.
> > >=20
> > > Gitlab CI timed out, but worked fine until then.
> >=20
> > Ah, I thought I had adjusted everyones projects to have 2h be the
> > timeout, but I see I missed at least u-boot-sunxi, I've fixed that now.
> >=20
>=20
> FYI, I had to bump mine to 3h a few months back, but maybe the infra is m=
ore
> stable/faster than it used to and we don't need that anymore?

There's still some pending improvements on the OSU OSL side, but what
had happened was that after we switched over they implemented some
cgroup limitations, and we really only have 46 threads or whatever, out
of 120. But buildman (and nproc) saw 120 and forkbombed ourselves to
very slow builds. Now it reads the cgroup and limits us correctly and
it's down to 90min or less.

--=20
Tom

--Z/Wi+ZShRVJ4wuxF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCauimjwAKCRAr4qD1Cr/k
Cj9zAQC6jb6UdDp2odzEgttyZS2n2J/GmpH1nOHER1yac58Y5QEAymqMrxXU+n7B
ACiInapr7ikN2+WehkhCwmsdIP4w0wk=
=CGQ6
-----END PGP SIGNATURE-----

--Z/Wi+ZShRVJ4wuxF--
