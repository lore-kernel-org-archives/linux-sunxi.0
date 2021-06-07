Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF1070
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 08:36:49 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id h3so9469212wmq.3
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Jun 2021 01:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OqAD7JyQJLtIUaTq7HisxnM/3X8ut9jR2CAddAB1Cqg=;
        b=doyN4rgRGFyq1Kz5xW+zSGP5eyprWLTmJNWt5GNCkcTtUajEwG24mgCalhI3uWmOKW
         E7LCI4cmGi21nURQKDnzjr6hmcWUA+rBgfNF0vs0mpK1jp45ve6KaLrJPGXSoe771ahY
         YKf6eaFqhhkVJBN+po2m0v/39VhNx4Arqs+4GJXeCrwOnb/BEDmWL6RlCMNOZVyPCcx2
         bFmYtkdXB5wB3CTjH+SBYgDr/uhhou6x/6QjqNkwbIk+KvX/AwWrxXr1Hfu+EZD8AZ59
         C+/A0ECO+spDAadILs7h5QCLyZDNdFTp7/Urc2/s3rg+8a9uhPG29gc1YAzWaRhruw29
         ym6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OqAD7JyQJLtIUaTq7HisxnM/3X8ut9jR2CAddAB1Cqg=;
        b=InDxMDTJFCb7+7amnYq4guG7M9xHkNLBvS3VZZ84kvtXj6qkNSeHSpuCPyi2RI0eaE
         t56gzOyephJ5hRG8oDxjLxQNJJLp2gMcm2Ab+sjeurw8TOATUwiOgL8JTviRJmdTw6xh
         CYQ3pbpvlK38p0fYF8NqQaFkpHRSH0mipXCWgofC4h24idGOvc8p70BtOJmt34rXZ8w3
         kQhE0+P6bvDyW2Dts6398eHFOkUUIn1iAiO30kDEin7RmwQ4kv98xy9krNOOy3Mj5LZy
         brcVVq7Pd5xZtyHUW/8oiDLJ+KPZi9ZhsCqIILHC3MmV7rfxemUEPo9ZKOaMNzwF3gNJ
         GVNg==
X-Gm-Message-State: AOAM530tjVt73ChTURBXSN5I8Tyz2OmtIeXhB1s6f1Oype3JTVZPwMRY
	lg0Iwee2sSmEazz+t3cf9u7sAs0/wJfMju0Ftwft8A==
X-Google-Smtp-Source: ABdhPJz8hM3hqr1V4jECe7fc+5nfq3AknPzC5rkIflKDlHDhykr0xPABNXJ3M2qlpZSxchzC5A0kjKaWCdCtcDbvsBk=
X-Received: by 2002:a1c:b782:: with SMTP id h124mr15900314wmf.168.1623055007668;
 Mon, 07 Jun 2021 01:36:47 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210605073534.3786194-1-jernej.skrabec@gmail.com>
In-Reply-To: <20210605073534.3786194-1-jernej.skrabec@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 7 Jun 2021 09:36:36 +0100
Message-ID: <CAPj87rNFXkoRJw2_Y7aW0+7mzOYGpirs6YgUfuFrDFfXcyOMeA@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: de3: Be explicit about supported modifiers
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, Daniel Stone <daniel.stone@collabora.com>, 
	David Airlie <airlied@linux.ie>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Jun 2021 at 08:36, Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
> Currently only linear formats are supported in sun4i-drm driver, but
> SoCs like H6 supports AFBC variant of some of them in multiple cores
> (GPU, VPU, DE3). Panfrost already implements AFBC compression and is
> sometimes confused what should be default choice (linear, AFBC) if DRM
> driver is not explicit about modifier support (MiniMyth2 distro with
> MythTV app).
>
> After some discussion with Daniel Stone on #panfrost IRC, it was decided
> to make modifiers in sun4i-drm explicit, to avoid any kind of guessing,
> not just in panfrost, but everywhere. In fact, long term idea is to make
> modifier parameter in drm_universal_plane_init() mandatory (non NULL).

Thanks Piotr & Jernej!

Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
