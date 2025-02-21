Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA8824CEE2
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Feb 2025 18:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740161670; cv=none; b=hCmHLPDUnfjGzdYZfXwajifqgrHzXJT638JWjIl+X149y4nqVXD0nWyeOzi2jW/7srNfDIvOdRnakqL7yrmP9Ekd6wXuiNR0d9XSEmK5WTHr/rxbcwsSET49oCWXJKa2C4fP5+vRdxIs2zFgNHhikuna51E5Z+gmOitCssVkaBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740161670; c=relaxed/simple;
	bh=ECSKD5NbGIjHx0Bm2KDf0mIGC/IQOT4lmpj8nrvLpXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aHUA/mecYbz0ulJiLLkFk/QzwJGkJ2IZcfkyk9AxbW4VrtxYNVShShhiT2cYMIJppUesyOwXK/gU4DgdkUkeKsj/nQQiUQUX937ZchYAUpp90zitPvgs3M32Aipb34vnEVzE3VlMF963lhIKBgkOtDD0o18aD5+hhAMviO/VtsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esqDQ0kF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esqDQ0kF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4399d14334aso21460695e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Feb 2025 10:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740161668; x=1740766468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECSKD5NbGIjHx0Bm2KDf0mIGC/IQOT4lmpj8nrvLpXE=;
        b=esqDQ0kF9wVNuewJl9FlCXjilI2SiMNB+2V8fvAk61CIDULf6nHZKb07vDL7b2Oa/1
         74O3ogMyXtDzfvzKIfBIKgKEruTp2B5YGd/3mg0Dh8NGTtTWy4NmVAVhW1emVf0yThSJ
         qW4WxSBiAKKX6xEBd8KeIpTgT+EiXd2NCbmo3A91wY76yehpVyvHdHPzbfBnVx88iI97
         sYu6+kZOI+e37cdGD51ToGTcjBoi0gVlevg4gS5DhXUccEesohB7GAkub+3nJp/DT41x
         0wdF0x/nyQ3MkriAnWAa3csmXrk4ec7qOwZQOtzWM/FyHUtbhX90OnJKYME94tT5Vk58
         QmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740161668; x=1740766468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECSKD5NbGIjHx0Bm2KDf0mIGC/IQOT4lmpj8nrvLpXE=;
        b=R1hqeXsLrdIN31RuqlKs605CcCgE7nMgoysElDveVFw5aKSTsaQAZPYtATeYKyPTTm
         tCBGvIQvU/rRTVqohZjQfF9VfMnIDD5lNswcAqR8BhuWcfodyymOZ2DT44PekmdwRXvC
         5KC8f3regWCvPuooQMsOVYPAq48ARkt/I5Y78ZPBPIpTTNZRJRyaBgUa/qmffUZQ/rUK
         R6DyC/jL+CQT1JIuv1bk5KYXX7eBeggh/47mJYhTshKZ8Czlg4O4JVTQhitOEaqh1due
         Xs8wgNQt+OiAPS9HaZ+cXzyzv+NI80oSiiQ6fW6f6gUDfMZMTL/V7TL8OvY9ImWY7hxT
         9ZGg==
X-Forwarded-Encrypted: i=1; AJvYcCU2C3mD24CcTVDUBz8LwHd9k1VK1GTAapb8KjE2Qc/DjeCFFDuu3AIzmDCIuGb21EJbgLutdrqUaPcKUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwnwuCqUR2UpwrH9mL1DkcYGA8gLx096d9Z5/o4njYSR7p+7zS
	jeABM6fgdnd3O/Wjk1PzXyNLhJsSeMMT5OeI1Sv4/H3RhNt7pO35
X-Gm-Gg: ASbGncti8GTPR592nZSFwBXIewiFT7GmKein+8fCp/5TwK1D1cbELvsrOFQeOY9siIL
	D6wzpeSiDBdibNDDG/AwylKJgWl/8KRanIaLYotO0sw0Qeu7fc0CaGHs/dw0R9h4A3ZLV3Roz5n
	PNAEvqqp3C21ZumAanbQX79AdxPPtUkSwabDEeZeBzFBDOBxJyzLtI3lvgWkhKFnSllMgDkhDZP
	tABdol6E54q473UiMGZ8/6e8wALnzMiIfKxnSwt5T6kEjvwbTR3vpM/6up6HkpAkTKfHhs1Espl
	R2hyok/sxggw03/l+3dDNsJjpW2WH7X5olh02eNge6wM1dia3r8U2P0fQ+6KXOOSiPiygCV6MFj
	6Zg==
X-Google-Smtp-Source: AGHT+IFTozi1CVAZhzesUHKfQ2k63P/tS7KXhTKQwhP11mPloHJVn0P3vCQGwTQrLHtArYDTD3nLVQ==
X-Received: by 2002:a05:600c:1396:b0:439:6d7c:48fd with SMTP id 5b1f17b1804b1-439ae1d877dmr40268755e9.4.1740161667381;
        Fri, 21 Feb 2025 10:14:27 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b030be5esm24430595e9.30.2025.02.21.10.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 10:14:27 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: h616: Add Mali GPU node
Date: Fri, 21 Feb 2025 19:14:25 +0100
Message-ID: <1911773.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20250221005802.11001-5-andre.przywara@arm.com>
References:
 <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 21. februar 2025 ob 01:58:01 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The Allwinner H616 SoC contains a Mali-G31 MP2 GPU, which is of the Mali
> Bifrost family. There is a power domain specifically for that GPU, which
> needs to be enabled to make use of the it.
>=20
> Add the DT nodes for those two devices, and link them together through
> the "power-domains" property.
> Any board wishing to use the GPU would need to enable the GPU node and
> specify the "mali-supply" regulator.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


