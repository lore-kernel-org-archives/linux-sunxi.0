Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E57917993
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763218068; cv=none; b=O5a1JEV91wWk4I50kRKd2f/3lPUeYN0Y6XgJ7k+GSCnAQUq6u/oQz55M1llPupXvmreAaKZNaIW+KrkKf208D3okJxXEQOemdHHmm9/DmcDv4R/4tk8fp1HObsw8C9gC5n943T/KwY/HCQ5vr0eRooGKNNGpLy+x02W1qtg3Pts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763218068; c=relaxed/simple;
	bh=6zCF2VwvteQ2rlCgNAvg5npcthhroXaHgp98itk06Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=py27tWI3GAPAoRkddsgLuK5byY5Ub7OP58/0LdYcpifwjD58cEnZ36dHG1Qz0hg2SCcyW0/ipccbrsfI2QZfGydxRi7zArg+l8T98c3wx9IqF6DCAG2KXQXCPw5lwuKBdTqvcWsEJj2NrbdeNcbTirUGnNN3KAjIFS/7IxWvncU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2S/WVhS; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2S/WVhS"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64175dfc338so5616233a12.0
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 06:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763218063; x=1763822863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zCF2VwvteQ2rlCgNAvg5npcthhroXaHgp98itk06Lc=;
        b=i2S/WVhSwTdnNqPBOmMc+OkrWt7nnyrd3uRimH3vWKNjGRmYYeIYwj7L3xpu76VKKW
         E//gyHdyXQUtv/2cOtHFrLiEzkkfovvDpzxs4gJb++vsxpSZup4FJUQl3jD4W+8e6lLZ
         yLYUZftG6mgdmtN3dHPj9g8bL+ZJUYXbW0DD2L3zjfdZ14vQVvjbALyN7IwsBc+hbSku
         N5UWglTp8WU/BNkhyE1K9B5NT2LeyekKVSG/+ECrYZZFMlFiv0w4KxV/DvDbD28Ca2t2
         QyAQqcTwvSE7jRCHF5cd2zrlULBP2Z6qF1WCzr7qJdTdpoa01U/KRDQeEiUEG+oI1aSv
         i2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763218063; x=1763822863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6zCF2VwvteQ2rlCgNAvg5npcthhroXaHgp98itk06Lc=;
        b=fVm0nPMog7xcBT/S14JEP173spwfvYR3COS4WU4q6bUIIacdAO73bVHn2m+tn4wg3n
         qM9aVBoC9BR6uBgqzSqeAU8kB7Fp8znwFOCWnpOm4yU//jB+M8p/xhHX9jkSfELts345
         i2y47uFadQZ38zeDWsR6tL+uQ7XEeuMbdsLU/6ZEzYIhpzURpdTaqkGvsy2FYzRf9AlV
         fD7F+XW6RLGTwMnWNv1fSxuC8jGau/7tCDkwwPFFJLYNpR5PxCow4UEqCGGeCXT7IPQ8
         +CI3FiHSCYEQwk9MFPNNtMbSD1E+Y29ijfzA/Xv+Pt0vQG+RPkFjMg46lJKU5m4e8VCo
         GVgg==
X-Forwarded-Encrypted: i=1; AJvYcCX3RbfJALVfzZKXAlcNoJJUkbCtwl6vO31zdBZk7CFanBjGsYVuEB7pl7KF+HYMpd6kZSZ//1uSw5JCKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzhFK7Oq1xdTRvCdEcKr/Paf5RT21kuaxFkOsoaQrt30ugOLXV
	UlYC+Fj/IaBbI+f8XkFWfAoV8/vdphYBuNFRg9TlAgSoiJATvq2Ey3GO
X-Gm-Gg: ASbGncv/JLexbty1ky+VsO3TvXixy6PSxe4H2Dnr2TT0H6ymz5x8VGf26nPmakBCQaV
	mJ7yL3mrR1Do3OF+Q74NHPd8mfjCPPnYzWTKLxibjwalgdDJWDZIyBAB/BJ1nnldcIdAwI1HGBG
	Pvp6kTpQind61P/C3M6xq0Usq6pkgFXjRLHz3ZkyE4frW+xqv7Cbpgi6wtZZJH3Cjle2RVGh9mX
	uMTr/I8wHiZbqlZANEXZKZUI8jC1dq6ERcB2bSkjPVt3vmHi/rdZfcyeWf2qtNNWrLnsvCMRbS3
	6USURQja+ulcc/HyrlRbw6Ec7fWYrZeesqnIsGsNK/Z1Zq+42acIA7gJii+6rd/O7gwPa/KrKvs
	u23xEOXLyMiGGLo3x4PWYcgsndaP0G1PGoRU1SoKwvwgLl4OFeoXYF+BbnSZBlsHWv3hCv72Xoy
	YNKribpa8QJ1MET+fv/7YHZIHWn14RRijS/lu/oLvGQXzRnU7KzhoSewnUa8GfDkr7f6jtRZZRl
	JUBag==
X-Google-Smtp-Source: AGHT+IGrjk6XSc2vCyw9UdPnvD0sBuH/IPACkYBi6rv/j+NdjGAC/UWtwwJ0hdXjpnf0qvoLJ3aa0A==
X-Received: by 2002:a05:6402:42c8:b0:63b:ee26:546d with SMTP id 4fb4d7f45d1cf-64350e20abamr5640955a12.12.1763218063485;
        Sat, 15 Nov 2025 06:47:43 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d7335sm5917548a12.4.2025.11.15.06.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:47:43 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/7] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sat, 15 Nov 2025 15:47:41 +0100
Message-ID: <2804739.mvXUDI8C0e@jernej-laptop>
In-Reply-To:
 <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
References:
 <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-3-jernej.skrabec@gmail.com>
 <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 15. november 2025 ob 15:40:27 Srednjeevropski standardni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
> <jernej.skrabec@gmail.com> wrote:
> >
> > YUV formats need scaler support due to chroma upscaling, but that's not
> > yet supported in the driver. Remove them from supported list until
> > DE33 scaler is properly supported.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>=20
> I assume a fixes tag isn't needed because technically DE33 support isn't
> there yet?
>=20

There is no user of DE33 bindings yet, so yes.

Best regards
Jernej



