Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCAE3A9D9A
	for <linux-sunxi@lists.linux.dev>; Fri, 29 May 2026 07:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038338; cv=none; b=V4ose6Vx+aduAESYr5ktIfAXC0NHr6trCzzKDzWWJOxdN0vTru4TNDravo3xOplXEc3TEOnwsa9LeRo5kKuip5FmHXIFRohg+CPvqEX79J3XXUt42LhWEVwVXQvnwrHzN1eWMSWFVEDALtepesy1A2vFvPJOemq5pEt4+uI0eyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038338; c=relaxed/simple;
	bh=yS1XlYDjTMgxwgN2DZGzDYeL5SarwMcWqXtVsPpG4iU=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=sIjMk+kWKOV4KY7as96ga43j691w8iIqhypoKFYt8QfonpwvrvyDzeYLQJjwMpAU5Jka4IKLlHf5QlqG6IwerxHVo8NBIWhm8RCslAmV74cs6O39dzj233nKpQAqwtfiBH3/qygQhMzVbXXQQtL3ZxAyXPhJeqrMFoKdXCZo/3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XnwYGh/o; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XnwYGh/o"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780038331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1/AzmjwYbvz5ac6FUFa2AXbd/guUDNm7WSGUACd+fE=;
	b=XnwYGh/o1rfZsynwCJXEx2rjmGjHm/owl7jHyuy0Vc0OrpofbU7dzYUkbSlAaUFJjPR4/p
	xQPqAlKZN1UOhyKM3lEBNMxrtajO6d7x/ot20UyfuhDIhBX6uwlSjN5ReQvSMwk4DDxicw
	KOVYDCuWjg7i/lyFRKx5guKlq+7jKBU=
Date: Fri, 29 May 2026 07:05:24 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <554bc5c03d16e7a76db35be4a1c0d23cda2d4df6@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] crypto: sun4i-ss: restrict PRNG seed length to prevent
 heap overflow
To: "Herbert Xu" <herbert@gondor.apana.org.au>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <ahkuI-Z2w0sea_ba@gondor.apana.org.au>
References: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
 <ahkuI-Z2w0sea_ba@gondor.apana.org.au>
X-Migadu-Flow: FLOW_OUT

May 29, 2026 at 2:11 PM, "Herbert Xu" <herbert@gondor.apana.org.au mailto=
:herbert@gondor.apana.org.au?to=3D%22Herbert%20Xu%22%20%3Cherbert%40gondo=
r.apana.org.au%3E > wrote:


>=20
>=20On Thu, May 28, 2026 at 02:53:17PM +0000, Tianchu Chen wrote:
>=20
>=20>=20
>=20> diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c b/dr=
ivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> >  index 491fcb7b8..010fa891c 100644
> >  --- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> >  +++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c
> >  @@ -8,6 +8,8 @@ int sun4i_ss_prng_seed(struct crypto_rng *tfm, const=
 u8 *seed,
> >  struct rng_alg *alg =3D crypto_rng_alg(tfm);
> >=20=20
>=20>  algt =3D container_of(alg, struct sun4i_ss_alg_template, alg.rng);
> >  + if (slen > sizeof(algt->ss->seed))
> >  + return -EINVAL;
> >=20
>=20This should simply ignore the extra data instead of failing.


Thanks for pointing out, silent truncation is more appropriate here.=20

I'll=20send a v2 patch with min_t soon.

Best regards,
Tianchu Chen
