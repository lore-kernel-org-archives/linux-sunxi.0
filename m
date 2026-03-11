Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04E02DF3F2
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Mar 2026 04:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773204927; cv=pass; b=DT2+TqNroVppWiAbHDZD5XmJnnqCz6lEp6fwDMXsJ4hrZ0cZDv/k//kB9pHnNJyFQ7tN0j7ttGySfQCdQVwDNoP8yqT9DMcloP2XYGZenmwUMZY//iqXUvT1UoPsNjthwu1Enksz8y9prREhTGF4AMZzg8QV7RviERfEslt1UNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773204927; c=relaxed/simple;
	bh=Sf1XV5zeurpjGvW9VVrULkcE8E8UTumtNWTKEiSJ0yY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LKfWjW8gjx9uE/JZCEvF2VGXbymNUZGQF4FAfZnPsbh0kKp/kF+VyUKMrf7C/XQ+UGEAkDEudCo/tuxqoBwhm4325tyjoCycPpn3WaTyQmS0+KsDG1KsCJBzDDw7tTSFOgXbK1affIpibrGY20VIZukmNWsev9bDS55q3yla71o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UxdBrOg7; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UxdBrOg7"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a142464316so4844380e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Mar 2026 21:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773204923; cv=none;
        d=google.com; s=arc-20240605;
        b=d0Htm/91wsutxLu1CncMXVwhUWHd4fcPbU+QfL6wHOF/mfqsUHHsa4/73/oiUE19Cf
         y2KiJSRmsvvshPv+wYah+BJQRPAIxrbfw7/2B+EZ7PHaD1kR9NLqYwAc91yAOTB7jljp
         l+WZfnsvG6ZqjPWms29Hg5645eUGZE0diS0Z3ZRGmf6T02Kup/+cUpFdOVqqP8yo3TqF
         JllopceY75S92N5v0NXHSpa5QYgVW7iZ8/JPvRoi8lFapZR6MfgK+Fy8cdApekn+sHcp
         jX+Gjrxl88HVWKv7dnoqcDZpF2U0aycpJVJsmUjt+11aVbhArC+OtYzT8357FjpRMFvT
         3wrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=csAuxU4WY1Se481wrqRHAT1G6rL7KDqCbNJuB1aP/kY=;
        fh=QQ3tBcx8X1XwSFYAJILkWlJL/WzDi+aWuziSkqmtlnQ=;
        b=j0yh/m5mLmQAvmB9zcxWtb3L2kHLigV1etusUx14Zz13mxsnuAN5AMEbqhAEN1jhyb
         i81JT4+GQyKjfuprUoJb4OvdoJRhXmKXcrXGMkwmoAPmEr2atkujw9impmHhnGWsMl24
         3BptZTsEm0IgZNf00AOBo0ZJepjXlyOHyqEktb/+EpI7unlaeoQozxj/EnuVKZqgAzyC
         KfAt3ajUZZliuQRk5n4kxDQB0nMhx2oLpbOOajpnLvgCI9BbAETqKnNIdyacKqvo0652
         4ZNyzbA6neCLG6Hpe9xR9fGHapjh0WKIY6A1KbgZTbIYuopUFLK8zdHP3NCYHjkIcPNq
         jlWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773204923; x=1773809723; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csAuxU4WY1Se481wrqRHAT1G6rL7KDqCbNJuB1aP/kY=;
        b=UxdBrOg7syJUyDQjVsy+51W7ryuLD3ZiOApKl0GEw/oqqBbGaGfyq35xlQ8dk4/MbF
         dggx5WxSMrcP1h60WTYdrqa1XhyloFyERmBieyJDVaLeUx8fuNXjGp3hsuB3AlS9Wi10
         w+SVwy1U/4j0NVqpuEjjWl9lSFWB8knhy0gug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773204923; x=1773809723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=csAuxU4WY1Se481wrqRHAT1G6rL7KDqCbNJuB1aP/kY=;
        b=u6whRpptjZYuLE2AMQVgQCBQjSK1Au1AQH6zYcMxOekUPIYf8+69ZLQmLNDtnvCf1g
         4lhEMuLA/BzidZoS38pO7gjmdOk0AeTiQ7L++brdNjQsn8T2GobItvmEgpfOc/FE8s1i
         UFF1bIDCn03CWq+3wTLj3fYvTp8x1e7r3kmfO1tSEYTSXAn0joQuHjxtqp8VbUObLHRN
         S2A2udCPtWymzhrKDdxeC+i0LN0YcokPaOqAnLjs4UMGmFNztVGM9cXQdAen6rmYHkbf
         uXWtshnPLu8GSWnQlV99J6ChCySKNczAEq8nB6RhCo77CRlwO39PCQFPXEJPRzYHvQXE
         8bBw==
X-Forwarded-Encrypted: i=1; AJvYcCXkGdoCQnUlo6aVMD4xEqtJkOruvHXicSkAWuoWZXdpaa/rnOBsjdZsUm5slg4KDNCbbMkg5y+NSUIYgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwaGtVNdPmCR4He+qywYivNGEkKzQFh/Z96QG6x7zyf2CuUlj1
	NmR0551eksjZ69iSfO+0z2WqtqSZbDZ7pKRoPvA+zkzbFJLFEssUdcGzfylYuZT/DnCirmhciiH
	4kb3ClFvp1DvHAzlL3fbNPRPXSQXmQAy21B640Avc
X-Gm-Gg: ATEYQzwZ6U9d5O+14rNcOUcefw/AyN8YZoRO900/ou9XeVGHnrD93fvSeKAdhmexgC9
	p/f/+xe8pr16aPN1ntTeJPeMosol+KEAUh01rL8ALZCcjEgsZiHCCVSkJpU1/Z36Pgf4Qt+Ft2k
	XLKXA/hNxcL/WdL2NMlamw71gczsx6sSCESPTt6XzjGN2TKORN2VfrPR3iGm7feLaC4xO5OmgDC
	4JAlem/zSAzVX0puCO1KoI8h/zwZ9ggIvuaW904Y0xKKXwq75JS6ENgIQUaiooDugHblFeaHW5D
	hPzXEgz3d0vm+Sh1PDd/eYS6U0eF4/2yf9yPmg==
X-Received: by 2002:a05:6512:619:b0:5a1:3da6:3587 with SMTP id
 2adb3069b0e04-5a156bbdbc3mr242495e87.16.1773204923158; Tue, 10 Mar 2026
 21:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310032511.2545500-1-wenst@chromium.org> <20260310032511.2545500-4-wenst@chromium.org>
 <b2acf78f-4ff9-4e3f-802d-5318e6f25c20@suse.de>
In-Reply-To: <b2acf78f-4ff9-4e3f-802d-5318e6f25c20@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Mar 2026 12:55:11 +0800
X-Gm-Features: AaiRm51TX-eh65P-jmgUubiAbXiGD5qlFS3vQBfHYDDCC5yEHtzRczjcYjc_Cmg
Message-ID: <CAGXv+5HJKjM77PdZjwUossTzrPx+LvgVaS=-sGcGNec77TJLzw@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/4] drm/mediatek: Set dedicated DMA device and
 drop custom GEM callbacks
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 4:21=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 10.03.26 um 04:25 schrieb Chen-Yu Tsai:
> > In commit 9b54a32c7c6a ("drm/mediatek: mtk_gem: Partial refactor and
> > use drm_gem_dma_object") the MediaTek DRM driver was refactored to use
> > drm_gem_dma_object, but custom callbacks were still needed to deal with
> > using the first device of the pipeline as the DMA device, instead of
> > the MMSYS device that the DRM driver binds to.
> >
> > Turns out there is already partial support for dedicated DMA devices in
> > the DRM subsystem for PRIME imports. The preceding patches add support
> > for dedicated DMA devices to the GEM DMA helpers.
> >
> > This allows us to just set the dedicated DMA device for the DRM device,
> > and drop all the custom GEM callbacks. Also drop the .dma_dev field
> > from the driver private data as it is no longer needed.
>
> My impression is that this patch should be split up: first replace
> dma_dev with the dma device; then replace the now-duplicate code with
> shared helpers.

I'm not sure which of the following you are thinking about:

a) one patch with just the drm_dev_set_dma_dev() call,
   one patch dropping the custom GEM callbacks

In this case the first patch has no actual effect, since nothing is using
drm_dev->dma_dev. I think this is not a good split.

b) one patch adding drm_dev_set_dma_dev() and replacing priv->dma_dev
   with drm_dev_dma_dev(),
   one patch dropping the custom GEM callbacks

In this case the first patch would modify a bunch of places that then
get dropped in the second. The churn maybe isn't worth it.

c) one patch adding drm_dev_set_dma_dev() and replacing
   drm_gem_prime_import_dev() with drm_gem_prime_import(),
   one patch dropping the custom GEM callbacks

Functionally the second patch would depend on the first.


I still think having one single patch is better.

> > There are slight differences in the mmap helper: the VM_DONTDUMP and
> > VM_IO flags are no longer set. Both were lifted from drm_gem_mmap_obj()=
.
> > VM_IO probably doesn't make sense since the buffer is allocated using
> > dma_alloc_attrs().
>
> We can add VM_DONTDUMP to gem-dma's mmap helper. [1] It's most likely
> the right thing to not dump graphics buffers and standard practice in
> most other GEM memory managers.

Makes sense. I can add a patch to the series to do this.

> [1]
> https://elixir.bootlin.com/linux/v6.19.6/source/drivers/gpu/drm/drm_gem_d=
ma_helper.c#L537
>
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> The changes look correct, so I'm here's the
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> But this patch requires a review from the driver maintainer as well.

Sure, and I need to respin the series because I forgot to remove the
deleted file from the Makefile.


Thanks
ChenYu
