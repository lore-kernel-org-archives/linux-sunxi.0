Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC973446C5
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666311; cv=none; b=KWebtb7lJ5oXkOz1i8HEw8vlP9G7a6IC/V87C0Vcf3kyS21fnTfUi1pa4JNvnUrzCjqsgKQyn+2EbRi4FXjULXSjBw31DsAAkxz6OsEuWu54LQ0dMkDMZktRCXsBi6xz0CVCVt5Dj6RFAUpP14n8OxqOmBn14jM9Iiy4Pjp7lYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666311; c=relaxed/simple;
	bh=GAqSgVsTThU3vtmlukZG8xLx1H3wk+zWeretWdrZ53k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pAcvVD+FrfRAkiYu8hsJPWfZ1G1fOI6hVuwE8nvGEsJlmhxSOTjqMDj8km8aKGkwf9W3+NAs9WaWA2U5shDW+GFiJ5H9UZYJIGXLCM+mE2SfftzrY7RTVN+d+Oc705ev+PP5nqtPItQHdbPOUwN7W+mN9Df4SIcyP5uCz/ybSsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anlod0Qb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anlod0Qb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4711810948aso45863555e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 08:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666307; x=1762271107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAqSgVsTThU3vtmlukZG8xLx1H3wk+zWeretWdrZ53k=;
        b=anlod0QbaTCeFtyksLDjOlPncqFlpYFPq12Jj1N7WCTW1+146gBy/WmT+cZ+rg8G7b
         kgUHd4ZGDeBcgDoirLVRc5GyabvvNf7uPLvVm1gaUP/iEJyO3ShAd0cqe4vHJn7CFynO
         7bKJr/vl1Vs2XoWweRzJjX2i9B1eckk0le6qCPCSjs1mykCgRKr4MmkKDqsLVMT7y2DU
         uCBIcJeRL/20Z9v4ohMtUL7cdQQn5uiiA18RdsWED5LaGdosuWeeWJRc9+3zNsOZUKor
         rS4B3QoZ7CXBioNQoFScBTqGyXMAALLY+jWXioBsJcZnwvsiCPrQmrgGVLBdeP+0jD9t
         7rCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666307; x=1762271107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAqSgVsTThU3vtmlukZG8xLx1H3wk+zWeretWdrZ53k=;
        b=o3V6onQ7G1o6sGzSuIozA1GVwuOV7khBBpfRkkyZKn9mXe9drTOLQ6FjWPCgGXQ8ZE
         urOR8Nhjqk4do88nl2LhZQAe3pvsU9IIKVSeLj14EMUL4DlL+U7mDOrKKX1uMD2uf4FE
         qotvxrtY7EYBikjZc1oL0qMAx3M842uguN27wKepXfpqRgSJJB5UJIkNP09Aj0+0uONN
         PA8E6a3g3Ts+yX/GPkQTyAMCPqA7euchNFsff+JAF6afo8Daur1U8cowjqOEkA2a9gBL
         nu4tPGU36xjfsH6WQlsQXCy1OOotn3f6hMeQnH0XYd5qeoQsmz6QmxfYEPhXzLeLOHFM
         agcw==
X-Forwarded-Encrypted: i=1; AJvYcCWX8qBlEjyLTou2ChQHBQUBN2BVAHstXOoXXj7Rz7vgS/reMA20bvqzTcFhfU5Ho+GvQdyRwcKN43YPbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuaHT5VTmgTXC4YN89SBAgFR9qo+tCUXOGwdrbNJHPcK3ZicwI
	ljjfxZVsVvg8qs9pbljYNB5lpiyYGDpIGJe3f15KMv32OQeIIMh1Mjxx
X-Gm-Gg: ASbGncswOdaHyTa/JKowt93OkOPowz/6jFU+p/U9XOIhzS/2ZiXGGhnqt47ek3J5WOz
	Zri6z9Ik4dbwFZgr+ymrZR3uCd5zkNyT9VMmf17MJC0Gy89XDjiCgnaORgoMwH3WFyEKOlWm3Z9
	JxTADEZmeFZqp7R1TZB1I5Q7k3o6l2v40XVzy0i/FttfdX/VfQKRjPK5uPKuJ32fIL8bFwWsJ/8
	oIqCHIQERe5Y66MjFfgivPqcUKaKfTv+Wq1uyZ1xWeQvvMjmzN/elyzsqyb2ibIArp96e5feg+o
	KwGHnLuYfxQFZhQwd1pkDaueQoagj8U38hSAVl3c7ni9ee/5svy+eWySvzGcHBG8RT/E5buhMlx
	jf6gESf9LiJ5p2KgDiieMUCOPmAbCnNmOBKyggM7Vy17SH9jsX3qWfve8pFzfRHCN7/yfFKeRq0
	rPCbRjinqigmMswB8W+bh1nbldFo/WTqRCn4AH52i21eoIZTl8lMMsaPjotg==
X-Google-Smtp-Source: AGHT+IHar4ykqVMzVnQnpMNRdCULBt0TW79PeUZzYouW3L2ifb97HosTgMs4SMM16AylRCMZ0rMIQA==
X-Received: by 2002:a05:6000:1862:b0:428:3ef4:9a10 with SMTP id ffacd0b85a97d-429a7e8500cmr3696482f8f.54.1761666306579;
        Tue, 28 Oct 2025 08:45:06 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952ca569sm20562147f8f.12.2025.10.28.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:45:06 -0700 (PDT)
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
 Re: [PATCH v4 11/16] mtd: rawnand: sunxi: introduce reg_pat_id in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:45:04 +0100
Message-ID: <3574896.QJadu78ljV@jernej-laptop>
In-Reply-To: <20251028073534.526992-12-richard.genoud@bootlin.com>
References:
 <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-12-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 28. oktober 2025 ob 08:35:04 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The H6/H616 pattern ID register is not at the same offset as the
> A10/A23 one, so move its offset into sunxi_nfc_caps.
>=20
> No functional change.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


