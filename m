Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6171575809
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Mar 2026 13:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774187885; cv=none; b=WS9Yli6Yb5h/dea1lGCrcQ7mrvko1cdhf3It/z/N5MQbTYmVd2KQMC/Hg9LgFjo8C0NbB6ldgmaKpy8rlaYuiYPfK8W1ephgi8TJ28tevXlhpS6CFFL2Eiw6mPQ+sXkhnSaWnUbDh/rqnZrUpTdJcK/V5bsy+pMqBf0+iLgcPbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774187885; c=relaxed/simple;
	bh=mgyMy2hQLKznZrbyYfmh+EZtwjOUXGpz7osuSEWQEio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Boy/xWN1d9Liv2cxnbkJjQMzutiYs21hPN5AICXt2lUnc9DYVh5TqDToeFHBesGJ1x2CN+uqqGZeshaxzKyV7Of9PL7X7P69srpMb5n5CQ/ZVV9GupTUgsdCtxhykzPF32QipR6DMo/OfGhCXkjFa73FQOfLJ1SbqiuMWEh8aaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgbKv9hn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgbKv9hn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E279EC2BCB3
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Mar 2026 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774187884;
	bh=mgyMy2hQLKznZrbyYfmh+EZtwjOUXGpz7osuSEWQEio=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MgbKv9hnma+0JZzsiTL4AO286J2d5nqkpL+tHeJSjyMSMw8UAytk2eRmKcjG7ObyF
	 m7d/ZJPR1MxCzf7AHXDCGfkS3xQS8m7HzGJWG0VU3Xd85Mwta2RsYwq+nGRBE6LDBR
	 qLdjcQf0Qbn5AVkKllm0dSJNIR5Jac84ZZ440arl4kTfxk/pYNBcoxr+zUEsu/7wsm
	 0a/IoUKgDL5MRz5ZJE1HOlF7GCAjNrJKfEROVfNZGd+BuFnraFpm7Qxk6a1CsNRRGy
	 0uo/sEaj7Z9HvvC6He72vCAusvTfTH4g2OJrcIQS/vZALZ7q+X8g1VjdTGQ4Ld0lSq
	 s2FsluD9ZJcsQ==
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6b0500e06so3806424eec.1
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Mar 2026 06:58:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVP3WV8ODIY3J5TIGVab7nCObCBt2R/VEtExFCQZuv6Jax1YYcBdKiLLFds3g4xKWM4kbIutO4UAscMHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcX0A235ffPEG2Ll+5heh5lJIwi+++XqCbcZ+pI3T9OhJciS0d
	cktF7JUZHhanjp/dNT66u5wAYUeBBEBbMytl5rtwrTxnm5tLT3F1tRhe/k15sEMDGxRio974jH+
	TJICQ8QtToJmg8pmpxVSh5f5uZcFzaw==
X-Received: by 2002:a05:7022:31a:b0:128:d24a:a5ba with SMTP id
 a92af1059eb24-12a726cafe2mr3483365c88.20.1774187884248; Sun, 22 Mar 2026
 06:58:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311094929.3393338-1-wenst@chromium.org> <20260311094929.3393338-4-wenst@chromium.org>
In-Reply-To: <20260311094929.3393338-4-wenst@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 13:57:52 +0000
X-Gmail-Original-Message-ID: <CAAOTY_86VxSUmNisk5aiapTNUGFGUu0gHr76E0RKKT0pd1mr-Q@mail.gmail.com>
X-Gm-Features: AaiRm51YKpNxHHSZ_HLZmjHIKksalh8pxeIcHKSYGkrLrVcQdpuypJr4oUdO1Tc
Message-ID: <CAAOTY_86VxSUmNisk5aiapTNUGFGUu0gHr76E0RKKT0pd1mr-Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/mediatek: Set dedicated DMA device and drop
 custom GEM callbacks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-sunxi@lists.linux.dev, 
	Paul Kocialkowski <paulk@sys-base.io>, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chen-Yu Tsai <wenst@chromium.org> =E6=96=BC 2026=E5=B9=B43=E6=9C=8811=E6=97=
=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> In commit 9b54a32c7c6a ("drm/mediatek: mtk_gem: Partial refactor and
> use drm_gem_dma_object") the MediaTek DRM driver was refactored to use
> drm_gem_dma_object, but custom callbacks were still needed to deal with
> using the first device of the pipeline as the DMA device, instead of
> the MMSYS device that the DRM driver binds to.
>
> Turns out there is already partial support for dedicated DMA devices in
> the DRM subsystem for PRIME imports. The preceding patches add support
> for dedicated DMA devices to the GEM DMA helpers.
>
> This allows us to just set the dedicated DMA device for the DRM device,
> and drop all the custom GEM callbacks. Also drop the .dma_dev field
> from the driver private data as it is no longer needed.
>
> There are slight differences in the mmap helper: the VM_DONTDUMP and
> VM_IO flags are no longer set. Both were lifted from drm_gem_mmap_obj().
> VM_IO probably doesn't make sense since the buffer is allocated using
> dma_alloc_attrs().

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Also remove reference to mtk_gem.c from the Makefile
> ---
>
