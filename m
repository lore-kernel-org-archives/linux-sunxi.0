Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795731997;
	b=GTn3gA6H/YvxK0dgB4PxAyT15U4QdG5uOseYSELSzbgLN2CftthdbKjBNUn5Eoz+28iF
	 DBFRSOs/i3ARf7cdto22vP35Kbw7xao+554eGFLh4Zo116aIPftvsmQCOykD+AH3CbkZD
	 /zjzUX0WTdSZtI5fXdCdLEvuYEL3STDenmH+LzHzg0g3G0GTSYM1bXY3Jqx1wyooWSsln
	 vMz1Jy4TKu1XQpMNFvbIui7ZxH9OyINntNgUenbXQQlsOLdbgagb3txk7jJyY1eR3zeBE
	 Tv0TpedfVigkDpIVpfwLbb89lWltorI5t08HQQJwshdt9EpmB5YJdR20yRtp/ziF2sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795731997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=DXV3jwg1vEpIFRKy3B1iiTGO2c9okEZN1fkPq1gh+eA=;
	b=JB0KYB5nNmEXeNYFpDlA+IsilZ4e/+Z5jt2fj+NPNa6MC8yGd4H/iWZRIZhvtoyO/hFd
	 1ErPauqsUtM9Oye1yt/fxDYe7N9fdW+iKAz9WnAv7y4JC/Sval+Ihk2+hOBnUzaIqHu6Z
	 sz9UT0NklGVdJ7dSejU8dc/F99+VwMi9pgpTR24/vh5UxE+lXoOOZ+z1Cyyrfeo4bUZN+
	 HXhIa8X2n0XC5ECz4Ua3LwdupWwtoQjyZTZuPf0U9yaLjGpofukoG0ssbg7+8NOt753Bv
	 NoohmfSH+nUQizFyEtbm3jdUt3LzJr2zb2QLohdpfi7ZANsTV4nxZrgSvnwDeD0cT3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JuQI3au4;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C229606A31C
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 22:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C229606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JuQI3au4
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9496577d4c4so821631485a.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 14:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795731996; x=1796336796; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DXV3jwg1vEpIFRKy3B1iiTGO2c9okEZN1fkPq1gh+eA=;
        b=JuQI3au4tGtAiYu15ctx75XrPIezHxnpyVz1a2KyYLqDehAWDBOHEKBRBJxABbLMDJ
         Mnl6ZufPPSLYNtxOrG07VDS5w4bxRS6/pizRnHKr0VsLw2uAe2To/gL0fiJOtvEPFF9F
         OOfeqerjxseLGqni6byiqY9R7tYlI7fj9QzJfVbbbpZXNB3Ln1yFL9y9C9nxA5xN8mXS
         2uCQNwBBBDTXgvsktY5ZC7UOHXXFv6ueh12bpvUBisoVUN+JmwYqwa6otLhfJp2mp6Ki
         KNMkmfq/HE2o8uH5RKepH0RTrkLJ4OJNLpAo1PEGitUNUG0wKWRAzINTZrDmnSAA8wl7
         0aJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795731996; x=1796336796;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXV3jwg1vEpIFRKy3B1iiTGO2c9okEZN1fkPq1gh+eA=;
        b=XQ+VINR2xkGzYSGyTZErhAHDMJCbpIvUGqZJfK6chT4gY/rQG7c+iIa5Og86cbbBZZ
         Ynfs1PZOy0FpWplDdG2/RYkK16Yhd1oRdVcryXEsks+4RGP3u5OLCbz1PLVPx91jiK0+
         cFtTZj2cuWSHTEmwONZ6GbsCmwCGq8Jk78keNlcwscIxtb/WB9hmIxoOuJ8TEhFpJjN+
         Vzzyg8ZFlxD230KcTRQBxu994cACM8J8H+sp19hxQS8+3PAwcEdNXfhCQQ31k4y+zjvO
         GKV6FvvDFNWSDIusMOSCotlvCMb3A8EDGp5pPm+di2bX7sfXMhUOVsI/qvwkGcmdMwKa
         djPQ==
X-Forwarded-Encrypted: i=1; AL+hErGG0piKWbFxZywkK7eHeDRYuACrdzReNZhQ21hTLkK3da+F1W9G01Sg3rvjzsGjcY1L+EtqZC0VgLEiLg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/pwpnBr8MJMN9czHeAL0+JSvhW17f+UV0vpe2S0gwPJ27/uS2S
	vmMAxw1NMxikZgAVhDjk5iHTij2JDOZeo+ZhZMZfXiSt7bLHvP17vyURs0RB3vwWQz8=
X-Gm-Gg: AZFdTZcWMZkTwfzVlgU4J8cYF19YppPescJR5p5T17cvMHPoJr/krX0Oerz/vi3N1CF
	m/CHO/iBc3/tPhGephnHbivtp8Nygwd1YPh1SfalRY+ntBDbUKkWi1McPgX4o445LHy9+cnJ837
	747XdWVG05HRDal7/KKcisOM8j1odfiAHdgZcin5Gh/S3O5mu11j2ne8WzfvkdbwrHRgddyaQvn
	j/9YUbv8Y+zJ+hNo3KnLR+BLAq7OCeBtu2cEx8PhS78KeSDeS5ksM7x8K+ke/jRgEq1Op3hGgkE
	vXUsOZspjLHNTIDQuipsVk1wuoPgdD8LEZC4VowaMoJxVV3zGl/uUVEkVcx3Ru7pz+1PnkxY4aG
	17UMJB0jhbUsGbmy/HIXMO2FDADxYzmAW5q+McYEgbEp5ymt9cJIOX516cXMZk0gvdf+KzAJsqX
	eb9wHwCEJW7QU4khHUW1QW2MNWLvOiB6tOv70/RmRK9rZt0MLnMslaDtS5321nLl9qvdFr9IBG5
	WEdZXuDKNFRUVsmu4PzTTUSPhRaezPajbdMb5AJgnjuOXTysoSNSKzASeS4Z6lOk7s58xN8OaiG
	ntg7Kppy6r/qzZ345qx8X3gmDmL2YP20TvfqADdWEwMZWKkTUxGBBtfm
X-Received: by 2002:a05:620a:372b:b0:949:70c5:c0ce with SMTP id af79cd13be357-949b35ac8e0mr4145462985a.19.1795731996315;
        Thu, 26 Nov 2026 14:26:36 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm1681287985a.14.2026.11.26.14.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:26:35 -0800 (PST)
Message-ID: <f41c7d6471f41d7fcc2109e14289e47091610822.camel@ndufresne.ca>
Subject: Re: [PATCH] media: sun8i-di: Don't sleep while waiting for
 coefficient access
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Samuel Holland
	 <samuel@sholland.org>, Hans Verkuil <hverkuil@kernel.org>, Maxime Ripard
	 <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 17:26:34 -0500
In-Reply-To: <20261104185930.885203-1-jernej.skrabec@gmail.com>
References: <20261104185930.885203-1-jernej.skrabec@gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-i1ae5NoATxMPm6Cs3hN+"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

--=-i1ae5NoATxMPm6Cs3hN+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 04 novembre 2026 =C3=A0 19:59 +0100, Jernej Skrabec a =C3=A9cri=
t=C2=A0:
> deinterlace_irq() calls deinterlace_device_run() to start processing
> the second field, so it runs in hard interrupt context. However,
> deinterlace_device_run() waits for coefficient access with
> readl_poll_timeout(), which may sleep.
>=20
> Use readl_poll_timeout_atomic() instead.
>=20
> Fixes: a4260ea49547 ("media: sun4i: Add H3 deinterlace driver")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/m=
edia/platform/sunxi/sun8i-di/sun8i-di.c
> index 65bc426e5aac..bb90e0efa4d1 100644
> --- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> +++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> @@ -163,8 +163,8 @@ static void deinterlace_device_run(void *priv)
>  =09/* neutral filter coefficients */
>  =09deinterlace_set_bits(dev, DEINTERLACE_FRM_CTRL,
>  =09=09=09     DEINTERLACE_FRM_CTRL_COEF_ACCESS);
> -=09readl_poll_timeout(dev->base + DEINTERLACE_STATUS, val,
> -=09=09=09   val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
> +=09readl_poll_timeout_atomic(dev->base + DEINTERLACE_STATUS, val,
> +=09=09=09=09  val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
> =20
>  =09for (i =3D 0; i < 32; i++) {
>  =09=09deinterlace_write(dev, DEINTERLACE_CH0_HORZ_COEF0 + i * 4,
>=20
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

--=-i1ae5NoATxMPm6Cs3hN+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiyGgAKCRDZQZRRKWBy
9MOtAP4lcK/xSN3c+U7uRq10fy5MnpVhec9Sqx0NG67DpPGZAgEA8d3GOhpIEGXC
xicNBf+fQ7gEyX7c665ziueulfyRVAg=
=8HHY
-----END PGP SIGNATURE-----

--=-i1ae5NoATxMPm6Cs3hN+--
