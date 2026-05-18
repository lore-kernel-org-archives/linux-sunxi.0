Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1D630DEAC
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116663; cv=none; b=B7ubA3xiRntq3t3zHleSRGescG7y9C7pKE//K/qFrh+p6nzqqTLSzOUnB247jvlWc33NBh/Z49P7j6eH67C3/Q33TH5Uwhf4D7z07FrhTAXIYZpZ1OaBOBl9SdtmH7zK7mwN/n81FSRo2gq4NsUamLKUb2PdUKJkpKJ7+IJv0cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116663; c=relaxed/simple;
	bh=pB01CjfbloEWbR1UtTzExAs8F0D8sWO2BJNozLy2eys=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mFp/3G5BiT5V5mLHVJDzFGImVQe3WCapWzc9Xvhwn4U0KcdCf6+Z3LRInl30Uh6FDpv0zf/GbWHcBMluOADb7KeeUGq1PE/MfCcRIm+GxyA8t3bxec7gwtxps99Wr+k804JLbmP4v8sstJR16NLPhsqwWoYxCIESrrAjbN0xrII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYHrOfJY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYHrOfJY"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48896199cbaso18714085e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 08:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779116660; x=1779721460; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pB01CjfbloEWbR1UtTzExAs8F0D8sWO2BJNozLy2eys=;
        b=AYHrOfJYFtsLDWcj3qICWhiSui2C74cKGBFeyIg/3Da4E4cKaLM0o76ZCFlOlh1lrB
         D72OQmBz6ZA+bUlxlTl411cwgRkpTj8h/h6Y2I/qRDS0Oba42n4qpSSk44bm4LexASIu
         1eYi3IKqeKNwnqU8rJoV6yFIsS8EizjOqesM9JU6EsbHnPARoz+NKxds+mYdbQbijaGd
         J2e9p3PU4FHLXi+lrFPm7yyFoF9WSuIWuDsZWAXlN2SRwnjKOncWcJBJFIIZzWUb6TZl
         fvII8huN9Rz37zBmXOwA2XaNOJn1CJD+E0D9VSow4gPZAC+7rs9aWP2tH1D17VRQFurh
         ILmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779116660; x=1779721460;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pB01CjfbloEWbR1UtTzExAs8F0D8sWO2BJNozLy2eys=;
        b=kN79y3lIVGqgXP1AfoJMrZbU2wSIzpvPTFMFYLx/g/2iG8THAnbtTdvadX0NGR4SZM
         PUmb964xolo5LbBnLQMCvn8YCZc22j2xVooTnY9bvYnkv9ISe6IggNXwNffb4HL/qFBK
         KnvR/Jk+Qzv0qYYw/AifkGoOkg8QC4wdX2gLKfX1GdrrtFSnfA2kuIv35947PwJCglm0
         KZps0GEqxNIOK0gQli2/TV3VKwbxPVZSOjCK6fJYgV5npz0hbyGrr6j6ZTTCE4/NFvSK
         Us2uoC0ViTMYeGTQr/LLWvacjs2DeaNJZ/iuQf0ejrXV7W2UH4XFpVgM0LForz105Mts
         u4Kw==
X-Gm-Message-State: AOJu0YxW+V7Gvr77hGcRVmWgtbfbO0yFJ3UqpXN1rs8gp/2RJSYbTTn6
	WXWRViXD8cWtC4ThlvUlB+HsBlvozXELIifn0goEbeLWMjnkjnknF9EP
X-Gm-Gg: Acq92OH3lDWkSn4FJgFvfG9qRsgswETp9RSYHJV+XdgC/vnIZdec0obcJoJiarS5uIi
	QvNB+iW8Oz3ZhUDAFyemPdtRTyLvzzC8sjOFmmi+6eKfKswaCQQ2cpWPRkA4fPjwYzKMrJy7fHE
	V7NIXhDf/WT4xSTcJYwsEMMkoOreP5hLUHObILrsa8kAlrZaDcqTyEcPbJ/RjohdVeu9mmOv8Z9
	Akqig9UMTDegSN4bbnj4/22D6S3whTpNcbCE67hIkrfB1wGx/L4NZ2MAGv45N3k3Wd2YDGal+DS
	jG1udgJ9nAAyvVpIVppE6rLMM8shHNdySu5U8OjyUrX88ZVmQLqGQcGdmNs6pnt9yugTKStJWMA
	9YR1eJfusJCi+Z63+FIkbUeb0YUHwKh2H0g8xRg5UCdHjzF7NL+LccQ7G60qK1Ss99n9BJO5Zws
	BkCw7uXEyA9fXyckJm/r47jxna1cB36pqQ0iFQes/qrA0q0fS8FZxPPin2NE+e6fRFHaRwSoS9r
	YnXzIWuYpAqU2Wa1GAMkVHf
X-Received: by 2002:a05:600c:c167:b0:48f:d410:6065 with SMTP id 5b1f17b1804b1-48fe66138dfmr242995475e9.29.1779116660290;
        Mon, 18 May 2026 08:04:20 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe58638sm81701595e9.17.2026.05.18.08.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:04:19 -0700 (PDT)
Message-ID: <a921e006b872de3853069ddd08facd3dd1c719c1.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 17:04:17 +0200
In-Reply-To: <agsohFpjuGqRRDO-@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <agr9m_tidBr6Cu2h@collins>
	 <579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>
	 <agsezxcxjQlBmesm@collins>
	 <bc3b786313adee30cc00c65ea98ff5258a816abb.camel@gmail.com>
	 <agsohFpjuGqRRDO-@collins>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Paul,

On Mon, 2026-05-18 at 16:56 +0200, Paul Kocialkowski wrote:
> I also have the 7" LVDS LCD that goes with it, which was supported by
> Parthiban's initial series (but needs rework, and it seems that he's
> unlikely to do it). I also have the 5" MIPI LCD but it's less likely
> that it will be supported, although I have seen dirty patches to make
> some other MIPI panel work with A133.
>=20
> We'll need PWM for it which should be a follow-up to the current H616
> PWM series from Richard Genoud.

I didn't have video in my mind, but...

> Other than that there is a PCF8563TS RTC on the board, audio stuff:
> speaker (which I have) mic and headphones and a GPIO beeper which could
> be added.

... would be happy to work on higher quality audio I/O support after
we get the base merged...

> Do you have other A133 boards that you're interested in?
> I also have:
> - KICKPI K5C
> - DshanPi-R818
> - Logicom La Tab 129
> - Trimui Brick

thanks! I'll try to concentrate on the SzBaijie Core/Helper boards
I have for now.

--=20
Alexander Sverdlin.
