Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBEC343899
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 08:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781337974; cv=none; b=Bmekv5FymY887bwo6FMBTgkBNccuX62QXeQKS/FBdRHAqgY/Arxf7WbhkHOMN0wBpv/8Q8GJG5codvXWVoA+79aXu+7zMZ09UHMg5xth0jObgl1BuyOljahj0Br7LYoxnDR5DH9EyQG27B2m5Klg/OZZ7T+BZFz8iqge0NlcWLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781337974; c=relaxed/simple;
	bh=DeVg0bi2qnwtneVj2BkteKgMLEFX64W6RwZtPGHh8tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pQToslXGa3/vEilHsDBbx5F5SdJmuA1XK3p40PyoCJUZj8V9CI16+sR5SZ/zgdUyRh8rdrH6FsgCrBbKipPnwxN6bZTJ54E7s3quoA2qkw9vO/UctCVx/gxVHiGxRp2N6cNnql9FwxKJRR0iiVYYpqakpwt7+XSbUt40PbqPy58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYout3aw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYout3aw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b915ded5so16706395e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 01:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781337972; x=1781942772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeVg0bi2qnwtneVj2BkteKgMLEFX64W6RwZtPGHh8tg=;
        b=OYout3awdT7ngUT5YKStXUbV4TBUi5nVeUTCcGdClbhlh473B6xjtI2sM4l3gZ+D7H
         NMbH5BuP8PVwt9rerCL+MtzSodZSnKs5V7SFD9EVacj+0ttpuTOo3n06XJ1xMgRGh9yX
         +ThVubnFSL9Rp+WrKQMJpn9W8CIpbpQUjZ3eqcettoaahl7rPZD5T6j1G7J1sUFyMVVA
         YqLf3zYQbW0WCyV/HDLL9WmRvwTfdoiPiGXCwCBCH7Gcmxn/B5Gt07gKVh9K076Z2Lqz
         3SdonVr1/cKCbVLJSB56EyH2BY8u2zWIgm1oVDvqeENt7cpEohoMCTn55FXhpbva4TU8
         u7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781337972; x=1781942772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DeVg0bi2qnwtneVj2BkteKgMLEFX64W6RwZtPGHh8tg=;
        b=iGwW083f3InqDKx6QMlzgbifhnty0mWwLSGbcbvqN1AEi89z9+El24Kmnj/PiGH+vF
         Kj2hzEv09mZMSj/gDJfvn2rFGU4HOcHjRApDYdnd7FlinwdCSXEZBYSS+IWochhRR0Ho
         j/jTpdyB2k95+4HFnPFMfygOOhW9gKRgjDjkUCZfAEA/rJzQPRPSJ5CGNtVU3D9uLy8o
         Kj1xv8SWOL99fGvZhJVlfrYtiFNpLGQ+zBlJB1dizH2KPbLczPzMuH12NNYkjv5/Q7yl
         5SH7aRSUJ5imYvqOo+22CQ/Ri9POm5LAlz+boX6vPX9UHK2FOBY8V920KboeEdmGAAZP
         YP8A==
X-Forwarded-Encrypted: i=1; AFNElJ+qLIIREqw9WWH62o0fiCe8I1xhX7zjm6H/5Uf1a6TOr1baIsC3vDoKDThxzk4d4blMYX9M2+/M9GqCtw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu54Ek7azDx/u3mwfqQzRBR+SOlRSV6jDNqNyuwXRcLD5KlP36
	MKm6uW6WyNQCQVu3LBBgrTV3AjDTVZRoAUuXRsaTo7VCJ39H9u81bPmV
X-Gm-Gg: Acq92OHspmanpKwAha7jmQHwpchGWhbVyWEhoRIJv/zGbWL5lbW3KQoFFMcwNla50Ir
	NlC3O3lj94LTqIFNZZPDmEnYsJeHHbuHkhObzjJUvG6RxhJLVe2jEh8PCTQ4vdbFyXyC3gQorgZ
	9pu28b55ehL/UJylM5vBX5RQV74Updp6h7fA8E5/arBiE8Oo0kcwRfJ45botlo4e6AyNVdycktP
	+pIP0I1Oqq3qHysmK6Np5k9od7esyKgknI3qDupjAcCqkmYzitAlS9vIbGWafL/mpv5+UE8qo29
	4lAhLBbZgxWxFvMFMRMav2TV0sn//RfuDix0PXWWghm8bDTK9DpfJkIRuwl3D6B3kovkwQzmMWC
	A/4ohl0boL0Px9auf2xvdiognVNPpwVJrOU2Zi3elc8KU1qeL/VS2IeFWIaN2uHA1N3fiP9r5XX
	slfTuK8mP4nd9NrWHaIbWz3yAiWbUX2OxjJhOCK80pnBvs
X-Received: by 2002:a05:600c:a310:b0:490:b58b:a8cb with SMTP id 5b1f17b1804b1-490ec50b860mr58693755e9.26.1781337971635;
        Sat, 13 Jun 2026 01:06:11 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49220304180sm53456435e9.4.2026.06.13.01.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:06:11 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-iio@vger.kernel.org,
 =?UTF-8?B?Vm9qdMSbY2ggS3LDoXRrw70=?= <vo.kratky@seznam.cz>
Cc: =?UTF-8?B?Vm9qdMSbY2ggS3LDoXRrw70=?= <vo.kratky@seznam.cz>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Linus Walleij <linusw@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 02/11] iio: adc: change from %ld to %pe for PTR_ERR() printing
Date: Sat, 13 Jun 2026 10:06:09 +0200
Message-ID: <rfot56KMT1aR8vVOIe5xxg@gmail.com>
In-Reply-To: <20260604120201.116925-3-vo.kratky@seznam.cz>
References:
 <20260604120201.116925-1-vo.kratky@seznam.cz>
 <20260604120201.116925-3-vo.kratky@seznam.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 4. junij 2026 ob 13:59:22 Srednjeevropski poletni =C4=8Da=
s je Vojt=C4=9Bch Kr=C3=A1tk=C3=BD napisal(a):
> Replace numeric PTR_ERR() logging with the %pe format specifier
> so that error values are printed in a more readable form.
>=20
> This change was identified using a Coccinelle semantic patch.
>=20
> No functional change intended.
>=20
> Signed-off-by: Vojt=C4=9Bch Kr=C3=A1tk=C3=BD <vo.kratky@seznam.cz>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


