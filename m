Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F7D37B407
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773627; cv=none; b=pANPuAG55wHRNZ8VCm42VLte4hwy6seJ9SV2hxkBF/IpCITHgJG7Uknndek//loc9KTIsOMoIP7jwc/jrZkSiYkFs9adz0dAhGo0+VuEHnMXS//YMgWD8KH7EjfnVUzdqpK++XytzqBSuFxLprXa437djsaODYfk89cVInhbrQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773627; c=relaxed/simple;
	bh=P04brJjayLVgRWu73sAc2E+ndFKcA5q+VMy6bVRNWQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HKkP+cJ3hpTAZRk+vbfB/hbKkJPkI9lTfmDJaSOVnDdh1Lqh2YnYqQsD3KXjNC60Pr/WP7FrMlSO8OJ+IvEb4tiINYCuWQpUpQIm9+e6BlnrsKlSrC9KDYxHse8ZzNdGvCudCtyJayGuVyA2SRx3LmIYf5gxdmc7XS0J+wso9K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJgI7mtP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJgI7mtP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFAF1F00AC4
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785773622;
	bh=P04brJjayLVgRWu73sAc2E+ndFKcA5q+VMy6bVRNWQ4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=dJgI7mtPbMPLeWz5FC9RBdYVdLa9rfjw9KDXGCxB2qdjP7VSh14u19OoWN+qVawfD
	 H25A+8QXl/Y3R4pLEJmc7ZiU39ggUpZD3T4M1DBvZn1woNJ7D5z8QyDBuQCQb6DKXT
	 tW+BgqngYmG2HI/Qrg97uzWgapsbY/XT188Ccq3M99+uVkqBLUt9Zu8fXNQSV+gde7
	 HISE0dGbqJbthdZgY7J0WyJ6O7BHg0uYNcuZ/lR3NkWL2aw4Y5KN9YRdsctf5iBz+X
	 YI7QaA9JSlF4VtTle2MbAELwaOiz7bObT5SrWigdg5UI3Q4waz88YfjdyH2Y8jt9JF
	 mKPMHfPlMoKxA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so27457011fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:13:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqsHdeHJtvLD8uQpFRa1gy6kOj0U3LySCBWhkXkd5M3C89cgn1gzjFEtX9tZvopn261t+54/JS9vHZzyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXnCtnZsSpknxmtdYKtHpFDobLmZr0+pJf2JKw9wJOnWR4p4iX
	G1myBqcDx9yrjxprBkWIBC0v70YDwbSXLkdS+MaMZTX/XhjYqYpyI50UsE8xPZYeG21iChbiUrc
	RhLTf6Qf/yH744TK9/xDMiSP1ssyeCdo=
X-Received: by 2002:a05:651c:150c:b0:39f:63d3:f1e2 with SMTP id
 38308e7fff4ca-39f864562f8mr20984431fa.40.1785773620744; Mon, 03 Aug 2026
 09:13:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <75ad4947981f2dc33fd42c05ae0b0cedda7647bd.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <75ad4947981f2dc33fd42c05ae0b0cedda7647bd.1785772659.git.jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 00:13:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v66AJ1Oucec-gZue_SU_q2s4K8oB5=8rvOgcGPaXKuk0gA@mail.gmail.com>
X-Gm-Features: AUfX_mz064VR1oGAUu4p4Wa4jv5ZeE5jPGOfMsUAPA8tv8awon34YrfM6Q_FSEI
Message-ID: <CAGb2v66AJ1Oucec-gZue_SU_q2s4K8oB5=8rvOgcGPaXKuk0gA@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/sun4i: Fix V3s YUV scanline size
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> The VI scaler line buffer on V3s can hold 1024 pixels for subsampled
> formats, not 2048 as currently claimed. Since coarse horizontal scaling
> is engaged only once the source width exceeds that limit, YUV layers
> wider than 1024 pixels are passed to the scaler unchanged and the
> output is corrupted.
>
> Use the value from the vendor driver.
>
> Fixes: 2586de70c15c ("drm/sun4i: Add VI scaler line size quirk for DE2/DE=
3")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>
