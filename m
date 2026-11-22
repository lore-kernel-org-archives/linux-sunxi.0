Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386889;
	b=ezO2fVMThVM+/h68Fo03v6QmLilzqdsRImn0KrsSzrCf0ajGAuZzNnMWVdAoYdxoG1Il
	 5KbOcSLMGOuGuMSL8wQBs3r2EyEf8wS0ThsP4+gYQwrdW3BwwE6+8USoHDJ0U8/QiBdKs
	 +JgrtBr1nnvNsG9saly/jXx2wqf67idl1gt9soBC29Pmtj51CzJmDIx8e+gDViiv3k7R2
	 +Z3Xl7A7rwQhpnolCrn+iI/oB2VKlIokCLNhBodGU85AJsnVqxrKwGmsDu0645ZJhdjkz
	 HJMkgRqKae5zSwyjY8aIFRuFTOyz4XbFh2Zee46Wuo0JBEwXrO4y4Lsj9WmzyDGWV9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386889;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=L9096wAOIruC60s2u9oZuXYB2g4eS9172S25FcHhMGQ=;
	b=PThvoeVCh763qckoI6QZyLzG3GK0CLzjuCkuyEBBvY0P/ssNfI+HLbS+utFmWRLBO0rw
	 xezP11HLg2HWCVXN+K2Yiw7Mh8ZgNfYIyw2wWd34neBvVJ1pJVrxf9HdoAD24+x5zrmOF
	 4qszzJjldNnVumZch5L3rDVMGrZQUFxUIvEp/r9DyIkYssw1LJO4C1IpVFq+EOT3bHa59
	 KVY6M5vsktDC91govWpi6JaOrrzV4SxfmocfSXJDisJcaLCLS7yz0Tgimq7ftxEN/NWKt
	 iW+5CLN9690dFx2p312ZxGiBHOrXeGMu3UVJy/FNruFkBN38aSGv2nMJXTdTGJydKtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=Wcl0V8lr;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD89606A31A
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 22:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AD89606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=Wcl0V8lr
Received: from hawking.lan (ntp.lan [10.0.1.1])
	by www.nmnhosting.com (Postfix) with ESMTPSA id 7FE504028E;
	Mon, 23 Nov 2026 09:34:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795386876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=L9096wAOIruC60s2u9oZuXYB2g4eS9172S25FcHhMGQ=;
	b=Wcl0V8lruqrEiDLddJU+2kWoNRlPO1ArpisUWwHCHbXNXklnGcfqRtzvd8D8Y1ixlkpN5f
	qrv2oJOjIhnsgQZjwwkULqnhIcIhPdG05tBjqqLZ8hjAUYOqHLOwuSnrUvISCQlaFTnOLG
	dn0GhKUOVmnfk5hJQ7CQcN+mNs0MIZu36W3K7TkCX9H2JD3HtUnRKtG3f1hdvY1JoplE5M
	IFq/J4GodwiyVd42i1UnQWrc1dddBS+l0QKSHElfgGxfVdBwrLI8Al2r2qHLbfuIVC0U2J
	nnOjnj7+3EtnwO2TDlYOVboY5ihJnSEnGC/KhLP0Q46uDX21MbLUW+HzXOdLGg==
Message-ID: <59f7e4e9cfd9a0050cfc2a8352cc67c910733849.camel@d-silva.org>
Subject: Re: [TF-A / sunxi] Allwinner A733 (sun60iw2) TF-A Support &
 Validation on Orange Pi 4 Pro
From: Alastair D'Silva <alastair@d-silva.org>
To: Alvin Sun <alvin.sun@linux.dev>, linux-sunxi@lists.linux.dev
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara
	 <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Yixun Lan
	 <dlan@gentoo.org>
Date: Mon, 23 Nov 2026 09:34:36 +1100
In-Reply-To: <d29caad6a3d59785.1795182796@smtp.migadu.com>
References: <c8d7c508075e081219a0ed9ec8650aebade205db.camel@d-silva.org>
	          <whzyZ-3mTjSNFzcz-TbNtw@gmail.com>
	          <556cd32394062960a3ea4af0011155cfa83ae91f.camel@d-silva.org>
	          <20261111091047.a733-fw.alvin@linux.dev>
	          <3a4378bfcbc13ff0d5959117f23b4dc6f45258c7.camel@d-silva.org>
	 <d29caad6a3d59785.1795182796@smtp.migadu.com>
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

On Fri, 2026-11-20 at 13:53 +0000, Alvin Sun wrote:
> On Wed, 2026-11-11 at 13:14 +1100, Alastair D'Silva wrote:
> > Hi Alvin,
> >=20
> > Thanks! I'm just about to submit UBoot patches for SPL (replacing vendo=
r boot0)
> > and the PMU that trains memory.
> >=20
> > I only have LPDDR5 support in it at the moment, if you have other Cubie=
 boards on
> > hand that support LPDDR4, adding LPDDR4 support to that would be of hug=
e value
> > (I don't have the relevant hardware to test).
> >=20
> I only have the Cubie A7A (8GB LPDDR5) on hand; an Orange Pi Zero3W
> (1GB LPDDR4) is on the way and I can validate your LPDDR4 training
> path on it once it lands.
>=20
>=20

Hmm, if you have an A7A, there would be value in building the board DTS
 for it, and reviewing/testing the patches on the UBoot list:
https://lists.u-boot-project.org/pipermail/u-boot/2026-November/640180.html

The series only supports the Orange Pi 4 Pro, but adds most of the base sup=
port
you'll need for the A7A.

(I'll be breaking that series up for V2)

Cheers,

--=20
Alastair D'Silva
