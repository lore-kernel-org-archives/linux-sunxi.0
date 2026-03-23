Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D6C30E0ED
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 23:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774309849; cv=none; b=W5vaUNLMCvg/5ojVP7vwgf/nM8kBxZQJwks2P7rlaSPKrQr4rVUqXN20MPmZbADfma6X0zALKtuPu3vxPz186SprLwB8ZsFOPpZMidAuV2eMi34Q96lZZO/TCY5lKldKoHOcRlZQ0Mrd/kqp9AjYWPDJIOwMX6sLDVksFEIBInM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774309849; c=relaxed/simple;
	bh=fJKrbaMxfDl3XY1IeHz35xE7hWQhlMR+J2+KKVf5HEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o8alC3YdG12y1fZMo0zKH67N+YL8U5+ZS9D6NSUTnENowqFam3CoCDFNY9P4A8lhCEXhPJcuJqgC8SjoerZpTaKmcoZnopICXcBoi4SZhtRZWs8kihhR5WXrJMk5T6ovcfgPLniTD2ogGKH3YlbOgVthkOdLJiPjBPMGD6hj8KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLsBPVsD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLsBPVsD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-487035181a7so17801985e9.2
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 16:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774309846; x=1774914646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJKrbaMxfDl3XY1IeHz35xE7hWQhlMR+J2+KKVf5HEE=;
        b=MLsBPVsDHCSbq0pSJRGeEiJr5q7Yu5x1Uceaz8LtaaL8UBoPVKIqDC6BzlsKfgi6ax
         n2KjCP/PaFO02l8Ymd9eODS3Z+De/wZSS+4lPaPKzkq/lbnxX6zdc7PGpKTRLrFo2l/9
         drt+Bml2IZH3JpHYw7u3/2QFt2m+eGVXnaZw++6WUqV0bSfJ44f4KnlDRBo9xfbeCIhc
         WIDMM8PCAkbLYCPgs8M56n4p6FTm7uNMwIrs/RGDRlmU7npFBL6ZLtV5yVGDfibnMlwf
         5FNuHKdnBYPUGtlgCO9Rq4Vs3CbNZJtUuU4ZOtrcAxcJHv5B/mtthn9MOc4ooQCPAl7d
         pttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774309846; x=1774914646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJKrbaMxfDl3XY1IeHz35xE7hWQhlMR+J2+KKVf5HEE=;
        b=rcVP2T0fopXNC64EVYhqs/c8IsTwHJPJjd4Y5hZxQ+IwMGS2BbX6Cu1ueGBce0aCzy
         yyxRlT1TvlEbFToLGTkV1Wlm6rpXsAN4kc6LfmnSe7SH2BH5r3G03t3INHxVIxoN5dWV
         6ccVfXXfZjjR4U0NQ1exssGuvVL+dWa4Rnb8CArU8sPg96L3ICCi6j+ckPXmeQY0Swhp
         7VR9sKLru72/9rnUCpVhfLrem62V8yzEM0Gi11C2xevVKOg7+qQ2UQRH6l4mWTbgQyK9
         GVgsDzASY8AVJDq1T8L5zGCNqKfuwSaNtDVdhDx4b84ZdeO3fqWFz/Sy0NmMYRkps2Wr
         ANDg==
X-Forwarded-Encrypted: i=1; AJvYcCXtks2nYft7+WNvz+grCvmtPtId6PmTPsxsCV2ioRuC2owuw/x3S5zyzBZj92WPvQ12T67goOliFbbRFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8GoY3lRb048rrSK34cefWQDJKsmuhlGnPn5ZCOkKaJfDJi0R7
	AYEOcXAcdYUytiUrDmaJURxmVLSIRadC5yiDvAc92EWhZoOfUpt5Ezt7
X-Gm-Gg: ATEYQzxQ/zAN4K2WlvQ2168zge9h4qL4TlV1vyky/Q3550L5R1DLfFHQFnwb2oWq6bF
	p0L1441t6TeOmL6cjjDE2NV1p1mXY0T+UKlunrxHWFyxTIyBZM1XOMzvf0a2n3KJNyE7sY2ddPZ
	gJpxAcBiM2yel+/3OPxnFI/x8T0dQ5nW0hd1NYVUXrJPEusriZ32mLL6rj2VHQa8XggRd3C/dTC
	OyYExymcMrFkN8k81qRH2HLB8SpNr9uJxXdiL74v4+G4QYw2SO2s0i/FBEW05kL4JwA8EbvkHRb
	JtSnXaCOFi+jINnXxC2w6z6T0ghhsJnI5LDsVXh0D8GM9kPeh+kDR6jxV3VGkdLes6zEzGxCmoa
	vLsFA2zxua8oby+wXw9zjAif1L8BLWEzUxcIADJ0eWYk5QUUtjedV2vZoEh2g5lzqsuMTp2rOS1
	SHWC2msJQDoHxVcJhEdCa1+olb24marTENgNgUtvZaIw==
X-Received: by 2002:a05:600c:a43:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-486fee0d52fmr183730635e9.22.1774309846416;
        Mon, 23 Mar 2026 16:50:46 -0700 (PDT)
Received: from jernej-laptop.localnet ([167.71.101.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711702191sm7483995e9.5.2026.03.23.16.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:50:46 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] ASoC: sun4i-spdif: Make reset control non-optional and check for
 all errors
Date: Tue, 24 Mar 2026 00:50:42 +0100
Message-ID: <5975699.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260323172450.1259111-1-wens@kernel.org>
References: <20260323172450.1259111-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 23. marec 2026 ob 18:24:48 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The logic around the reset control is weird. The driver already has
> quirks describing which compatible strings require a reset control, but
> the reset control is acquired using the "optional" API. Then any errors
> other than deferred probe are ignored.
>=20
> Instead, switch to the non-optional variant. Also use the deassered
> variant to simplify the code. This also fixes a missing reset assert
> upon removal.
>=20
> Last, clean up the error message printing with dev_err_probe().
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


