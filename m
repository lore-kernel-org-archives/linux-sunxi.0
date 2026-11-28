Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795854953;
	b=1TqxC+XCX0euHqmYaJGBulaGI6JJlsoLy+dtWWW1qpPUAuntGMlnr+HMUfHFHHVXdfgO
	 KwbeAEIPPXd5ZwG9y51/Z6zojlHR2g/ASaxyI1rdRC99JwJaoc4aR6GbeAKQ7sP22vocH
	 3W62MbbBW7ONH4EnmTRx/FkQQ7jJtvnWYAy/Vo9k8o4fBrIjfYAZEAnduo9SEJCwsiDsM
	 6hhHA6uEtCC4wSdfqBzv3Xs9lKDVANI/EJhP9tOVBrnG8nHB2aFUm3YIGLg61YtBCkbn+
	 ZDp6VXake9jSIMr3HGeG3x/jI5i6xwpAeuUaAuTOZdPy+sV+ehyE3YSJGSqIiwVsJ3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795854953;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=3G63H/f+mpmh5BbIOzGAddUEYRbcemaM7V7UijQ2koU=;
	b=QaahcenJaWtEdDwXKbYD0sRUXPSZMHWvzTac+TbacWFfVzGjpPWooOMVlZWL/5nQY+KC
	 NkrO+Cg1D0O2gMmb+DNjVUOFmLVVQ9s2X5Mw5onFfZoiL0K4f63HUj6wewstG7qhtWVew
	 ybSZ/Jb22TkphOIS2wOx2rRZWIt3+AoudgVmGpIlhRLfw0xZNIAATWOFyzGskP6WAsVw1
	 SRrhsCUZ2zrnUuaIZWVi9V1ON9+LdyVd4zAxVv/o+MpLMSOLL3+0sTIZ0VCvo/WswoxEm
	 UTuLZygCcRKd+yoQW+BNjey9znZbhui8W9wasTzeQd5K0NSBhyHnqzhC3MJmN5E9WsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=fncyBpWJ;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36B5606A31C
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Nov 2026 08:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C36B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=fncyBpWJ
Received: from hawking.lan (ntp.lan [10.0.1.1])
	by www.nmnhosting.com (Postfix) with ESMTPSA id BD7FB40A8A
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Nov 2026 19:35:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795854942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3G63H/f+mpmh5BbIOzGAddUEYRbcemaM7V7UijQ2koU=;
	b=fncyBpWJ6vwKR+t/N3I8jxWScZvwJ+fgpMnC/UrxWKXxySsZKJCdcAba7BcPsxHxI9QIww
	Z1fW7FAaoKymIAMu81fQCOov3ZqS8j0hbFhpNwt2vTGKItr9mZMpm4F5ynbNChLQ650CEm
	0cHTtCpQ6U+9qdlnMIQBzWAz7INPriMQRyOO+BjivnH1RD+4poMn4H9ut0/49sfKWMfTA6
	piScyOgiFC16OGzLMfsZ8/tpMmiARb2phBHwvR8SENiGnxUeYDkfQ6EKpt47u1cX/+NMGx
	y8qtDyBKcdcwavoPajCcs7qyGd0zO/B8cFlF5FCvR14VfGiGBTXJNGErEmjIKw==
Message-ID: <8ccaa0b6ee64c24f19c4b6a1240439e1af69eca2.camel@d-silva.org>
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: sun60i-a733: Add simplefb
 HDMI support
From: Alastair D'Silva <alastair@d-silva.org>
To: linux-sunxi@lists.linux.dev
Date: Sat, 28 Nov 2026 19:35:41 +1100
In-Reply-To: <18637573-d20f-4a58-9e63-6bf71b015cef@arm.com>
References: <20261127080649.1982883-1-alastair@d-silva.org>
	 <18637573-d20f-4a58-9e63-6bf71b015cef@arm.com>
Autocrypt: addr=alastair@d-silva.org; prefer-encrypt=mutual;
 keydata=mQINBGactvoBEADBFM2HqfQUUM4j40ZQPyYzmnM8S6zrycO0ipDDPMs7nZMzyzGzOdqfS
 VB/tuYvZOOKVWzJuWJ5aT/YyHx54r3L+D5hTkEG0sXPVJky3yTS9sbHEMSLBHb8TVVuhPVPuieV4g
 Nkqg5POMTidk8xAw50WpV++tUlewXVSciehnuCQPXhXMP7FcCh4uO8LdN7E8m7ir1LafKTFfoWPah
 KVT8NGG9r+ucrFcN5F+VnHxTDaI68yRPkNdtUWmp22wIX1KwDCtKFrndYO4p5Hv2hlDKomsuIIHHn
 muQGRwuh0xpf0nVJNF8ETZHMzxQLfo3e/HvxBFOTkwY9w7CuuQFZchbhS0I3PfmGT0+jiNcdfqjDC
 fPPB5uhy+DkR6wO72vuwFYUrpU2mdliDSdKEtWBHulnXMJjpBOXetfIwhI8G2dTVg59lN5i9DvJZc
 7y1Sp+qfZQ4P9qpYZyQEKR4GNDOdnm6F2LW2cZkcyAU/Ii765zdDMTQMIzZNSxT/FcDd0K1voTNRl
 QHbQw+kmIMhzSv2JefcC9oNbE0XYzcBDNP5T3O/4itOQ90GCKQEPAbIPeBjlQif7kkyvo/H6yv4s9
 duuK7zbJD9AID/+KGLkpU3p68VDB/C2ZSb9rQz3p1CJNSfsX/CPk7sPqA7RKZ4a2B0hSJ2pJCncNZ
 KXtMlkkm/FmewARAQABtCdBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz6JAl
 EEEwEKADsWIQTQGemDFwqYyU/dBWv75AdnjVo60gUCZpy2+gIbAwULCQgHAgIiAgYVCgkICwIEFgI
 DAQIeBwIXgAAKCRD75AdnjVo60qHZEACJnLfpS71Hk8bX0CLCNJ5wgqdZD3pBHEdbv9Ux9kRlZp4a
 ZFwlg9ltwBjl2dZP3PLtD9xQdsdYKVippKd5a7ZZC2y81oDaHjeC9LnPYn8+ce3mGE/+gRyoNfToY
 N06DeUNJKSlZ9t11UIqZCgfp12u16/Yrigy8C4ihEeHXlLhNX6JkeJR5gsHXJnC7vSuMZY+Qz2R72
 ZidWg+cd2WDMGop5sbTvc+55q94A7vTMlWzaix5HdbEUA3sd2U0dMBju5QodRGGhDQMcCu64TydRD
 MtMzzOk9ThJ036ze3HASWGOppyQmaw58k+XNzbHlr9Sc1LsFUNF7zpWXac2rzlywbyRAdFIT/TC76
 hy9zOkwIo2nwA/tdIwLx1j0UZPpAMQmcDUvJqZh6sE+fv6HN0yMPr+sSYJmriMt8Z6leCEHQXOHVI
 SI5z5FvV3coMmHYRq6aXpfs/8SLiYgkV3B0HE/E18Y3j1OkeLYoqIH1VfzQZeCSL/S77NYvk60/MV
 1HFSyqLdUR3uWZI4uZzoEcMoB0GX33uCTp2Ntc00+wSntwekCUQLCMLUb7dZrbpVuobHoWWtkiD2I
 uE5kAiaVwwwzM0BUwiM6VzVoKbeECz93rdsNtwoDqM0NtzoISC46H/BKVQ9mRNXDO4ThEBpJ4H2Tn
 mPNRYYcR0u2mNy1EJII04w==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-27 at 10:03 +0000, Andre Przywara wrote:
> Hi,
>=20
> On 11/27/26 09:06, Alastair D'Silva wrote:
> > This series adds boot-time simplefb HDMI support for Allwinner A733
> > (sun60i-a733). U-Boot enables DE3.5, TCON_TV0, and DW-HDMI2.0 and
>=20
> Where does it do that and which U-Boot version does?
> I don't think we really want simplefb in the mainline DTs any more,=20
> unless there is a big blocker or delay for proper Linux DE support (like=
=20
> there was back in the A64 days).
> In Jernej's HDMI series he hints about A733 support being pretty=20
> straight-forward with the reworked H616 DE code, so chances are we see=
=20
> proper DE3.5 support in DRM rather sooner than later.
>=20
>=20

Based on this tip, I have a working DE3.5 and DW-HDMI 2.0 DRM series locall=
y
now, thanks, so I will drop the simplefb patches (1 and 3).

I will hold off on sending the DRM series until the current A733 review
queue clears.

Do you prefer patch 2 (the PCK-600 DT node) standalone, or folded into a
later series that consumes it?

Cheers,

--=20
Alastair D'Silva
