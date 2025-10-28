Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D721733F8B3
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666329; cv=none; b=b/xrglWUYd6CXmiIUZRcXOxxDTz5LwrX1+NzWGK7lsg/URA/5BtpGMv15od685zrfBHTqe0cdTC404F+bdSQ/C4LeXlYP0pY3IREIdWrP6fJoWXWfgPxuoXgVPqFH0LFH/sILE906DjXwAJassMOi7cE2L+fU6MkJhxA9W3tZfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666329; c=relaxed/simple;
	bh=mnXURezN7n9VOpNAkHt+wC6tLgWa0+LJGSJ0uA+xyu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FannUEN41bbpfsXzuTBznj1H2hmpng9Ae10A+5IQXt3eVQFKmlCwfTwPCNBzilPRahRsLbazZsPy8Fy5FqzotgBsfihuJ2J8bkBPZy2TFk/aPGZfPqZOHgKTiHoQKPGhbeSJvRqzqa/NfNjmArN4N7T2Uary+A7ucSLVpCRyUBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROydSrDU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROydSrDU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4710022571cso63858155e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666326; x=1762271126; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnXURezN7n9VOpNAkHt+wC6tLgWa0+LJGSJ0uA+xyu0=;
        b=ROydSrDUyWYuKJFpll5GY9DGLCcTqYBC0oIZiC54wJOwKmOluF+uWIlDpxzyR5cvNz
         831M2+VlcWFci475SvcShKgdfUrcpDjekj724jNyHaq3q2CnL7+wcjTkCdvSA6kZ622u
         aAcdEITY3IAFVYLiVTS5m0Hy05RQ/nONIxiMOecJUaQLh5GIGYejVxO83oZf3yef0b5B
         bSyb/kmtPLwTcoS24EQbkAJSeeinP1D3v4nsoQ9EBhnO4DXbkYsaZ4SXi9GmIK1Q4I69
         xYB92hRCU0b1iCAYRmQCSrih2rI2hZp+vW6p00HAuC8RdSFkb2VDgsvYbwiVRGARXHGt
         xMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666326; x=1762271126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnXURezN7n9VOpNAkHt+wC6tLgWa0+LJGSJ0uA+xyu0=;
        b=HrJ9SXIxkiH2MaH8D/dMBDz1jjsY6rlezph2W20CKhyQA2RZkqTu26TxcVm7GFSLc/
         OKYoI+4EAhDClEN8Ib9FAIFm0RP0UmYfOQ/HlLTkHVLbPGVN+CW2eUHwa/Pf+bs8alLa
         osbiS9Mb+amvjrPg618AuLPb6pMmjFR8awq1i0mgoCSjsfESZWtzGfaoRqWzt1qP6MqS
         kMPnD2DQdAbxu7w91OacHcJ80xM6PhljnUDeuw415NDhVJMrg6um2kQpf6zpBR7RYbtI
         QS+KpvvuR2keD74ePrYMtw1PvDcmtx2zGwmPoULe1nlzYpSaHDzG1g9mM6LG6ggnOnaK
         E8fg==
X-Forwarded-Encrypted: i=1; AJvYcCVOLivHjhpCTSBo+3r3qW0npex/WbmbKUn5rkb3vqSoVuxT0BGg9HAm+XTkUA7Y31621/936nz9Ge4tiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcOimW5uMykQKw2z4y0H57vEQMgh1J0f71DaPxyLXEO/y3/HPy
	HAYN9IHKVwNzbv8vrUAD9xbfHSb4PVWCQ8Az2NzyX/uOdUe7tRcNNnBz
X-Gm-Gg: ASbGnctKZ0PvIpoJm/xEU4OnO0julQAhLY2wGCzHAHJONeCFaOFCrM19Y3bsDBN15ad
	S5uOnbRFQwXOWbqoz51Wl1S4mBBDrOxr4gUQyA/x69mpAbXbO05ld2GfyeqaoE/w/U22uQyYgNj
	wFrinBGqY1TunyvkWljDJjwOdJLMuX4JoZkJ0ql7Ujq2Ozg1qUa4KK4BtybVNeFiam9dDMqbSo5
	sWjcNPkqT1TCN0z+QaKzb1OGMouL7TjPyHGh2qwthXqyJJHZizF3tahMOjuW+p+wHHAzvATBuRr
	Mnb8ph1MNnM7ouJeDqjxbjeamWLuikuXZRP3DIsJbhcscnrStJvojRE6StBihBHQ3T7E9avAA21
	Vek2nHbYId2J76ItgqcEHozqdQCnsMJ7DO9HlN3qT20iH7ugUC5M1pE7BFCKw2Ir9gfAjQ4bErK
	jfCqETh7gEL5Gs4i1O5orDbAvzQ2mA/1WKVgwiuJYYMFA7gfdEpyfdW90J2Q==
X-Google-Smtp-Source: AGHT+IET/efRhuIuFB2PFKn8DXpNlkISko3LPS6KKpyQ63Wdmub6V/UZ/rCEDYkQXXUtyr4tnbPxTA==
X-Received: by 2002:a05:600d:8386:b0:46d:cfc9:1d0f with SMTP id 5b1f17b1804b1-477182e1357mr23793205e9.19.1761666326096;
        Tue, 28 Oct 2025 08:45:26 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df62dsm22927131f8f.45.2025.10.28.08.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:45:25 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject:
 Re: [PATCH v4 12/16] mtd: rawnand: sunxi: introduce reg_spare_area in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:45:24 +0100
Message-ID: <24133952.6Emhk5qWAg@jernej-laptop>
In-Reply-To: <20251028073534.526992-13-richard.genoud@bootlin.com>
References:
 <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-13-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 28. oktober 2025 ob 08:35:05 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The H6/H616 spare area register is not at the same offset as the
> A10/A23 one, so move its offset into sunxi_nfc_caps.
>=20
> No functional change.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


