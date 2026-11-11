Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363289;
	b=MRunu5QNrTG/whAXyrPWJsKILi1rHQhNdLtFX+YVa6CmxLLo6EYwu09kZTBxZ6TVfc2q
	 x9VFIrFBx/DtCRBgMre06bWKCBSDWXc8PlRPU26yqNLapH1fHJW5HDSGmNSkpj6ePgpt1
	 WZiz18lOb5KoCVBrdkh6bWZqdyf4pU31DDD0wZrh2uYJrK2WeVkbWiDuBY0DYjjY9Rn4w
	 1Jpqtj/Ug91a0MnXjfovHi4RUkflP60sEodiIPUIa3XNV6Oyf4qH+vgUDHRKn4sC7Uf5b
	 ZGYyLYPeAwfw+UOtLC+ZP0ZNmgcwERkpjqjODqULizCQEz+8MdYoaniyVk4fE8d9AZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363289;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=kngVt427yVFy+BejYeveHpLypYrihUc4In38mLIhyHs=;
	b=f3nJr0zqnZ7N/p43aggktY7gYjrl0aoUGDdbhqAQZJ8qrZR+ecnpyqR2AZOzLwra2YAs
	 6pWyJvJzEBev8iXszgqvX1UF6jwq/guuwyyx3vAKrgkUPC6u40rkl5O2wBsqkq3rXNOE2
	 4Udjp256t4E+QTGUIuze4jDtVe+ElKTZ6riYToguvgK+2HvBgNUXGGy77HkD2cm9NC6cM
	 mQgpAlRTPjhdFj/ZRNruQQyu2Xj8NOJtDzu1QzlRKMPZETKFzWsk9SjNdkRyf7QeaRsw8
	 +7n84P3ubgBb98299Mp4bYgGraGSI/x7zc6iKI3CvKx501RWY0gSwYQZob8MbUlGrWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=aCgx9VDN;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05415606A31C
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 02:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05415606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=aCgx9VDN
Received: from hawking.lan (ntp.lan [10.0.1.1])
	by www.nmnhosting.com (Postfix) with ESMTPSA id 568B3402B4
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 13:14:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1794363276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kngVt427yVFy+BejYeveHpLypYrihUc4In38mLIhyHs=;
	b=aCgx9VDNVXUXUKl2ndD3DX/f09NbvnPgQdMI0zYHikwT/mEsH+IuVF8X45u/nifnOeBNw+
	KcodtAp+Zrnkc6VJNmewpQHjCk+WXvT9qGMMsNz9IyUJ/E0/7Fyw1Mh/qQ7Od+3DHetVki
	eCUZp2mCPe+hmvOqCDt/cQKlugXXg5FVZjjfXo5JI9vEJug8/blv63xzyLde/IxClT6Wo7
	LVtyw5ozbZzCJlQFu6r7XkGxTzX9FZ2dbtkrG7q/JPDbVJxxvyoATOcEhVKU4s9nTrLIDs
	M6AF1saATaE/oC0+FENV7gS5mTONkX5BLAVKYufT7C/w2M85+yaPEhZsEdDNGg==
Message-ID: <3a4378bfcbc13ff0d5959117f23b4dc6f45258c7.camel@d-silva.org>
Subject: Re: [TF-A / sunxi] Allwinner A733 (sun60iw2) TF-A Support &
 Validation on Orange Pi 4 Pro
From: Alastair D'Silva <alastair@d-silva.org>
To: linux-sunxi@lists.linux.dev
Date: Wed, 11 Nov 2026 13:14:36 +1100
In-Reply-To: <20261111091047.a733-fw.alvin@linux.dev>
References: <c8d7c508075e081219a0ed9ec8650aebade205db.camel@d-silva.org>
	 <whzyZ-3mTjSNFzcz-TbNtw@gmail.com>
	 <556cd32394062960a3ea4af0011155cfa83ae91f.camel@d-silva.org>
	 <20261111091047.a733-fw.alvin@linux.dev>
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

On Wed, 2026-11-11 at 09:10 +0800, Alvin Sun wrote:
> Hi Alastair,
>=20
> We have an open-source firmware stack for A733 - EDK2 (UEFI) plus TF-A
> BL31 - and our Cubie A7A boards boot from it:
>=20
> =C2=A0 https://github.com/alvinsun039/arm-trusted-firmware=C2=A0=C2=A0 (b=
ranch a733-bl31)
> =C2=A0 https://github.com/alvinsun039/edk2-a733=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (branch main)
>=20
> Which part of the upstream work would be most useful for us to take on?


Hi Alvin,

Thanks! I'm just about to submit UBoot patches for SPL (replacing vendor bo=
ot0)
and the PMU that trains memory.

I only have LPDDR5 support in it at the moment, if you have other Cubie boa=
rds on
hand that support LPDDR4, adding LPDDR4 support to that would be of huge va=
lue
(I don't have the relevant hardware to test).

Cheers,

--=20
Alastair D'Silva
