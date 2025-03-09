Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3A9C2FD
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Mar 2025 06:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741503190; cv=none; b=GjxskHN+yZZL6vvj9A2g186YcSD47fkSbBPxDcpzj3arZuqBvkL803DdaiWbmPS+a+9yLVwD0hQ4c/YMnFvrQCPBU0zb2C6Sx4BqX1ux908bv47HnA0CuL2KsEB0IPuwtLNhYu2DY3a7mqSbn/qQIrctLGjUB/F6anlbRHsdS+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741503190; c=relaxed/simple;
	bh=8FLOytRST1b7cBgnwTPUTHSCubeWY65ELvAASAoo8K8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vp3N3qSdveK2X968X8iulvWmUbo42PRulWj3lKmpmso3wL+6s/CATxNuXitQus8MRWC33+rVgnRtPsvj6W4bcR5/B8ptOVE8bKIaQN1l2GRwmh+UZN7w2nbOv2jUxsCq7uqVyMgB55O86e+RRpguk9nhjWk7Ip0qBSveCu4mQHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fq9unFys; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fq9unFys"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso551838a12.2
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Mar 2025 22:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741503187; x=1742107987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FLOytRST1b7cBgnwTPUTHSCubeWY65ELvAASAoo8K8=;
        b=Fq9unFysKmHAYnKXTiuqZbH1sAvCLjy0MWyFHaqKFfaK8dyXWV2oE5xJwfqzpWVWTo
         7HF5Z5/OeF4E6SQ/0rgj7J+Tz3wkhdhhV2BkrtWzfkrELY8nm131qXTaEbxKWWae6tZd
         1SqHdSOA5yTEDAXBxSAagiNIRC/5pOrEbKXOyhVhmW0nW1B8nPvIjuWpQcc978x4wVA4
         FsN+KXWeX7G9su5sQTKruQ8ysvuTNuwufa8urm/AbXNSmF5AgTAqe/sDHChJzmJ0mZt8
         t1sPBdA9LA2PpXIWt5GrdsRdilkuJyA+1IS3KDDlHWWHEidBG06hnMBI9I3dw0BaqA64
         hVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741503187; x=1742107987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FLOytRST1b7cBgnwTPUTHSCubeWY65ELvAASAoo8K8=;
        b=fSgFe85bZcKSsuqur+Om9/pgqfwenFPeiyx4s5ZSDjtXLlNV+4DNLtflzqEjYpSSZv
         YAR2kSfjVGU/gidJfZBgFC7J9QB+lbviUB4elEBegX4IiK+9iM5H5s8swYuJAyr4Hrjc
         EIe5J9DjWzHUN5ved8S5kbNWbFDc4d9VqWIRaVjbSs6RYIGu6puYm7aQizlli0TnYkvH
         qk4r8o5s57soo6bYols1HKms3ezFcSX81h1GwLGt4BGHUtIoY/aMmU6kS6s/u58Pfe+C
         GNdta96rXEudSqPzfC+i4ipkEtJ8Pt0iLLH5czXcE29GMIdNeu7n+bV6FpuqOXnoFLhW
         lhmw==
X-Forwarded-Encrypted: i=1; AJvYcCWw11j9R0KXzOhR835sEzUeB5AF4hCO3fQiW8/wSOaFc0ca9kzBioyEJqLdP2TjwhjT2VSRuQ7D1fx/ag==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjqrjrckMsDK0I9OYRipeq2BqQt1aSPLbVq1Ihias2qpH65+8r
	ftK50Y1ZVZLB5Wk3itO/cK7IzlgxhjevLVLDXxQ4b+mPxUe4kxUI
X-Gm-Gg: ASbGncsMEUrls0oYdjHwHuWWQphWjmRk7JOcSfuknEUo6zkHvnvk7HV7jLZXaS5WLAt
	aFD96WxVnGpEk0xCimoNrqDHEiHosjPLW2DBPYoFPVXv7MnqMPgi0yqVYg1xJknxUIy3Q2drBEP
	vRA3XZgJ7xIkgSDjkkqF6A6QmyEDl0MRFgrb2J3yvNSLpPccXzKbI5E1dm2pfuGwakx9zIRh5RT
	Ld6Z9t/8PUVHuyCHaeIuEYRBNd2nCQ5cEs+1Bq02uDSaq7sGqBwwPlY95Uql55XkZ5oT8xoogko
	Epu8O7eoumtGssel3MTB5whgGX8RiKtMgB5IfxiA8fxaPGOED2hXlShkiOURi2GjuQ==
X-Google-Smtp-Source: AGHT+IEozQjXyjRcOAbnbhkCB/GeONnnBAob1GnncFL/WgIvYzJGUOAd/PvSRjZxlM/Y0ifrf89/uw==
X-Received: by 2002:a05:6402:5387:b0:5e0:9254:c10e with SMTP id 4fb4d7f45d1cf-5e5e22dbbf6mr10635788a12.11.1741503187497;
        Sat, 08 Mar 2025 22:53:07 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a7176sm4845027a12.35.2025.03.08.22.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:53:06 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/14] clk: sunxi-ng: a523: add interface mod clocks
Date: Sun, 09 Mar 2025 07:53:05 +0100
Message-ID: <2978516.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20250307002628.10684-10-andre.przywara@arm.com>
References:
 <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-10-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 7. marec 2025 ob 01:26:23 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Add the clocks driving what the user manual summarises under "interface"
> devices: raw NAND flash, MMC, SPI, EMAC, "IR" infrared, and the "GPADC"
> general purpose analogue/digital converter.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


