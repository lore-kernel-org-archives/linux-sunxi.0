Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114927;
	b=uEJ5FL22TD5ALozpe4ZhxqtsBs7mxLD+xvaz9vRh0tD+3NyTB61y98g98QlvHj+RNA7/
	 hID1ZL0abryTI/SN8yGh/hbZ+py2vZFsvTEKAI7Y7/XTuNKERTV8lnXranCCARAnLyiB7
	 3PJ2Wz1LrQNm7jjEnLgcnU4CqpM+UmmETt2jeJyh3v7LIml/wqx+C0nB+Uw63fMgNDauv
	 Aou9SepCyI+RWO3Uuvg4VxHiNbSmD2R9TjP10T0opUuv3WWD7ptduh+jdfYO39h1qJ2Pe
	 nB58gGHlnq4GbHNdDFf3b2SroT8eLSQQa8gWVaxexeGLkBzCAuBc/UF9c/XetQYBbDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=;
	b=zjiktmpCHFQnU3Bi4/sj5fYzJRd2afhbuuntGEAmMAFuIdCXoEHFoExSI8x4pMe1h5UN
	 GKdEEf6fy2Qqkf4KjM1E1HPJzQ8IVuNOSS90gLMPuRF1Q/ISvofQ3ZCeIXI3tnsxVgRFC
	 3a+ifvnIm+cLOnnCEvlAWGZYmk2xHxVzG80eY/eNjpXXSxOiEU0kUVrKiUg6c2vW0pAA4
	 Jf8E4KMXrRdZahYqGQdogMXPv8muhy+VcSjNnqR8A3kHf+/kVOPvF21Aq74yKl+PUCxVL
	 q6WKYVkhCrQVkBoqi9j1fxMMXoJm+aS4/nCarTKqUzyxGO37hjQTX6blFsdTaZt2+3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=J1K3uzlH;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F19606A324
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 19:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F19606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=J1K3uzlH
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ec6f271883so10781e0c.3
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 11:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795114926; x=1795719726; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=;
        b=J1K3uzlH6p2N756sLc5rSBtHDJUBFbERDnP9PRQ7oIdok2AIReIaZd1lVrZMKg1qcd
         6pTtuXiqYIf0XZXZPfqecCFozJsS6t806RGPQtUHJPKBzNQ0QvIeHK7RoPEqOvTUk1eF
         fz1Tlu8ai5NHbcj6TToHX2E8wZbUjihBpmB5oF1KMOxLu8de3voI9EAjJ9KgI72il4+L
         TCXKYGxqXSgtFQYGoixPCwdOOGOJkqEiOyaXsWIVYQe01wfiEHUH0EtoMAmV2scnzGdY
         x8ifkdHuRESnDUykzkqs548ZWhI4A4+eH9BirVC+WCoVKB3/btdd3J3p7rR72t44lRKz
         sT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114926; x=1795719726;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=;
        b=qypa8aEhzXLaJILS2ypI4NtaWUJMOV6dWk2CnsjqS1fQhLvC2pkzwDX27Su+UjpY0W
         4JTTwyLKw2C+1aWEg6aEPrFhUG/n5XFJ/BfRDkINRHYGECF1HV3c4nEMXlfSKRrK454E
         I56HANxipAiV/h2XOU//d8sY/aw6hKoOtBetOCyRyNigJGfU4+KgdgS+ZxTg6efNNNRr
         N+vsxhW6W9HeFlZkd7ELpqQI1ttQ8Mpojcsiu4hj7MHEdkNIyVl8D3wtxC3JS29wq9Ds
         wieXJ0YhZDbpD4xhiAYg4CV1XP6xszTVKq2a2Jt4crUqMf4DsSJq9vc6Chsp8Cb1QGHQ
         ydrg==
X-Forwarded-Encrypted: i=1; AL+hErGE5KsiCOaptGps7747/6fp7/DTESW0OuWz3tEaWHyAiLZ9rYMEQS1uGdu+4Fv5jC4CCCYr42lvSheXlg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/qmUbz6t72i8UhAeINhJIJE4hGQV3aASalCd7M7ZqEjKUbfunA
	PXoIq4g2ZFyeUWieBLrmBFOjm2El5fyy0MH3CTOrdhVPHPJUgrI4OK+z/haiQOyo8Uw=
X-Gm-Gg: AZFdTZdIyktf9JRI4PxdIRtCn4WflcHZ6oM+0DwXCS5qS91NtlyOCcAWvtgq4HAc6FM
	so0eTDiZosuibplGoIi2DParFy9YRk5qssSToCKlIW7Wz39yMUzF1rrpUxdfiYH7ZJ2NdkTZjV2
	EBrM1JtcKEzM09hFfaGyIpJ/S97k1UHhVic8ZMVKJjq57WrRaclI0mElzt6/Ovin5ToTdjLQvlZ
	ThsRL7XubN7D8pzES2MXSld5MkImGqGU4cqeakgH5P2aBDU7nIjIYN8gi9Ed1JJK5LLLTv8Ou92
	Nhoy1a86dQQbL3FzX8838/xCC+QZ+ZCMMlfgbxEs/Ysgyrr+wkIoeTDW6YoL9drGG74yxOQGaFi
	lr38QqM99xiXb15wyg5EuiPq1rkXzNqyz0+etkFVCIi6LhDG4Oj1c4ZJVYwrdPsFHbW+18NYbcs
	sBey4JOvWP589ihQayeCcPiT+9R65aLvUVJ0x0BD+/fWGy/d5FEgy5ih5EuNZAJ0KxpOTMuxAKQ
	DMgyLdLBzXnNTa+sdItJA2KLbFOd4KtLMT77cJNEJWphPAZIrNa6Audcd4OCXoJcsoRsYuvXthf
	bfK/jreLOiBqgOXXR8xKeMcLQcepBPGubL6bxsFpzeSRojEqtOt/hdY=
X-Received: by 2002:a05:6122:c88:b0:5ca:f811:25ac with SMTP id 71dfb90a1353d-5ee8aefbb61mr486259e0c.14.1795114925522;
        Thu, 19 Nov 2026 11:02:05 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a28dsm809462241.4.2026.11.19.11.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:02:04 -0800 (PST)
Message-ID: <84fd9703862c225d63d973cf170b06ab7a962312.camel@ndufresne.ca>
Subject: Re: [PATCH v2 6/6] staging: media: cedrus: Use
 devm_of_reserved_mem_device_init()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Daniel Scally	
 <dan.scally@ideasonboard.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Eddie James <eajames@linux.ibm.com>, Joel Stanley	
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Minghsiu
 Tsai	 <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>,
  Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Yunfei Dong	 <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>,
 Marvin Lin <kflin@nuvoton.com>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Maxime Ripard <mripard@kernel.org>, Paul
 Kocialkowski	 <paulk@sys-base.io>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland	 <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, 	kernel@collabora.com,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
Date: Thu, 19 Nov 2026 14:02:01 -0500
In-Reply-To: <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
	 <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="=-Zy5+UcnjO9CPStg5/eKL"
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

--=-Zy5+UcnjO9CPStg5/eKL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 03 septembre 2026 =C3=A0 01:37 +0530, Mukesh Ojha a =C3=A9crit=C2=
=A0:
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
>=20
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-Zy5+UcnjO9CPStg5/eKL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9HqQAKCRDZQZRRKWBy
9KPMAP43HkphsVrqQTwGITR+0glsiS4Fp5Wyse7t/ZPwvyRH2gEA4/6BFP8fPbe6
9p9JGy6Ck2BZu8qjXZw4UU8oUtkiJgI=
=GZdK
-----END PGP SIGNATURE-----

--=-Zy5+UcnjO9CPStg5/eKL--
