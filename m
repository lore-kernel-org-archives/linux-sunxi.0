Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E138EC2FD
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Mar 2025 06:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741502983; cv=none; b=IMXnGzr2RipnZ48TDksXo9PwdZ3HnQCb5O8UPfAlXdVjG2/P58y8m/H1pl7lZ6IA57te1GhA4iMNK4ChfZggmsKU4/5ysEGcl3hKj09KQdMpgTOilSJ2sskuU2RtebTqC2L5zWFNGxmaVnx6Uq176dGT9/+gw2ZjRe963Nm1imw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741502983; c=relaxed/simple;
	bh=cl65f/0t7FsLCASGiewdIE8SaLE0/OtzJdiDvPmWgAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D7iw3GGVDWLE6Lc9qTABhZrJHb12HOXge5lObA+MAFN9qPDcQlX39yBBCCn9I6uzd203A8a5lTgj9c63WswwWQ4xNjasmruXcA/epWYe0sMJrdjhTcBNCBdLQzx6BtvJ7A/2q7KrbyMhzyyFUm9lU2lE3MqeREImX1JXhC2PrVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIyig2AD; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIyig2AD"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so6019673a12.1
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Mar 2025 22:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741502980; x=1742107780; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cl65f/0t7FsLCASGiewdIE8SaLE0/OtzJdiDvPmWgAE=;
        b=XIyig2ADyj5HY7959NqhGWthidiVu9YKuPLe1ZJ7zVenw18Gt6drQ+dRFxuzk9EaD+
         ys8YoMx5HCGu+WBXTxh+nS0HIZubeuAwr9m32HNxqYTMlP1UTudC8zF/q5GCuadQgChh
         nqTXAGaDSwITlWI5BM5iuxLySav3s6E1JljDONpsSVV9vDr/yDl7Fa3r6I210YBjVWBn
         654Swd6f+B+XTP0QHrSSmSu/CJCKrgY3ekWWxt2ua0W6a2iG2eSEwaAlnNjVybFwxe0w
         4kbe/5bf71jwZMs86W824TVhQ6EqalF5ZlRJiX/5967GSfeVjtgGDImMWFsZs0FCiITo
         mdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741502980; x=1742107780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cl65f/0t7FsLCASGiewdIE8SaLE0/OtzJdiDvPmWgAE=;
        b=aJM/c20ShoZisr4Qvkrxj/QJSph7nCwBNlufVA5M5GnxwHE1Bw3BxDSH4MJ1yewav5
         SlLfJsmPXEGW/kt/R3R4DmQqoTck1GmKyoRp4tzg1iWnwvnQHcn0qYM2rjl/pR6dCfrx
         vK1dxcvSkPuQ4cUN1P+Y4M11tVM3WKOGaWBsbjZ6KdbGmkiestPVDXJxn/HKjuOebHsO
         MPapjOr64YKXxQU19QHUmahS3fpbe8UuS2D7u6eEgr2g14jqqMWDmMppVk0Aq0h7S4/G
         pzLmBsZbbgArONnQsiSZyHDX8wDKblJRV+LSOnfI6jsFRzvoKqVO/YLCuDdoyKVfzBpy
         s32A==
X-Forwarded-Encrypted: i=1; AJvYcCVYugHsxo1SKpKmfkEFuRfDarnumNr3NK2eep5P1bGvoF21xDSUjAAXH4x7PBM39k4KEodG9Du1vLL4gg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRI+iF+AVsM0tMCSsF/TwSBBiScy0R863+DRFL9E+lvA87PBkz
	Zy28ah0twwB6nVro37Wv6b3B4KQqzweQV9mEaEFcQCiTl0hy5gtf
X-Gm-Gg: ASbGncvNp76FjR47jYg82B9Ap9lKnw3+ElObV2KIetvuvQRuylXbofPK+QrtesFQsWq
	vAnLp2gZ3KRrbbOOGyY6eGi2oB07uZhqBCzKPz8IET1xSi25N9NUdABtZYQmGGWapx7/kRXa6Qs
	lPBEgYJcSzZBHUipGYvJiUsEQclUNbLHziM3k0JNds+QPoKdVduD0VeBpSEh2Ezr8s9wEeU2ll6
	aDkzbXxIlAqrUZrel/K+HftDqCJtdbLH9HxclxYMmF+RdcirARcBErNFNoOYTisaD0zpfkUGfjw
	GwuFhWVEmyiX2V4Y7RdESDUaCGA1+ItSZsNDRgVnWMB42vzo0Mir5qyBxKqyLAaJTA==
X-Google-Smtp-Source: AGHT+IFI/zjd7lG5rPco3cg8PnFl2h9bozpdBtlW5SATxdyS7wM6nxNoH3ZloBa8WWl8S2snqJH40g==
X-Received: by 2002:a05:6402:1e93:b0:5e4:c7be:f8bd with SMTP id 4fb4d7f45d1cf-5e5e24ddabcmr9224865a12.21.1741502980045;
        Sat, 08 Mar 2025 22:49:40 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c7669fd0sm4835570a12.51.2025.03.08.22.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:49:38 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/14] clk: sunxi-ng: a523: add video mod clocks
Date: Sun, 09 Mar 2025 07:49:36 +0100
Message-ID: <4963134.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20250307002628.10684-8-andre.przywara@arm.com>
References:
 <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-8-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 7. marec 2025 ob 01:26:21 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Add the clocks driving the various video subsystems of the SoC: the "DE"
> display engine, the "DI" deinterlacer, the "G2D" 2D graphics system, the
> Mali "GPU", the "VE" video engine, its associated IOMMU, as well as the
> clocks for the various video output drivers (HDMI, DP, LCDs).
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


