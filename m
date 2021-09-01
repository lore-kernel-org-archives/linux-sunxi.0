Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBA23FC3
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Sep 2021 03:13:15 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id s12so2470828ljg.0
        for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 20:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=d55o8VRMccw0pmcvesAE8Rz9x+AqcwcttzF+pmxCfek=;
        b=U1Ea5WYjoZAIn9QFGPCHn+PBJwUexBiPBwHi/vglzhsV1E5f9ZfeK3tPzePbgCjgTP
         0UVCaSuBjyp4/ojxtXAtIQtvppC8KsoI4Qwzel29hCe3Mo9PG2gF/LsImS1fQ6CYNi3z
         xcVKsGCs+AIqQVBnQNz7Pr05bP+o+urblnzPXhJpsCvC4gGnDCTHEOeFtBKjwQvTllkK
         4/W/dTYMc5YIwtrTxUQe6X96YYpH72T+cT90Qkl7VfiCGgFCoFxMM6AGEgCFII7Hhqsr
         1tFgYwznFMht/qKZLlEXjN6wefHkSQyOOlfM8Al28MyLv0srIvn3PtKjbgNJNZ9A5Z1k
         CyyQ==
X-Gm-Message-State: AOAM532EIKwJaR29wLzQ4FYoKy3ndAUkTB5sa9RvIupalcCx1eweewJo
	0wh+fo7zyi62Oz7EGuDVqgQhSEk3bCCzJQ==
X-Google-Smtp-Source: ABdhPJymEsu7/F1R0XlR02TQb203wJuYbDqYEXFE2sv0Y8tD22gP4oAOkbrWFbzTtVvmaizVaDcFoA==
X-Received: by 2002:a2e:750e:: with SMTP id q14mr5078212ljc.338.1630465993231;
        Tue, 31 Aug 2021 20:13:13 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id v12sm370775lfi.49.2021.08.31.20.13.12
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Aug 2021 20:13:12 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id s10so3312399lfr.11
        for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 20:13:12 -0700 (PDT)
X-Received: by 2002:a05:6512:3b27:: with SMTP id f39mr23258174lfv.303.1630465992483;
 Tue, 31 Aug 2021 20:13:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210831184819.93670-1-jernej.skrabec@gmail.com>
In-Reply-To: <20210831184819.93670-1-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 1 Sep 2021 11:13:01 +0800
X-Gmail-Original-Message-ID: <CAGb2v67TNrkeP438t3nLcquFvGTfS+F0MvBmGAS=qmZ5JZFmag@mail.gmail.com>
Message-ID: <CAGb2v67TNrkeP438t3nLcquFvGTfS+F0MvBmGAS=qmZ5JZFmag@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix macros in sun8i_csc.h
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, 
	Roman Stratiienko <r.stratiienko@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 2:48 AM Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
>
> Macros SUN8I_CSC_CTRL() and SUN8I_CSC_COEFF() don't follow usual
> recommendation of having arguments enclosed in parenthesis. While that
> didn't change anything for quiet sometime, it actually become important

                             ^ Typo

> after CSC code rework with commit ea067aee45a8 ("drm/sun4i: de2/de3:
> Remove redundant CSC matrices").
>
> Without this fix, colours are completely off for supported YVU formats
> on SoCs with DE2 (A64, H3, R40, etc.).
>
> Fix the issue by enclosing macro arguments in parenthesis.
>
> Cc: stable@vger.kernel.org # 5.12+
> Fixes: 883029390550 ("drm/sun4i: Add DE2 CSC library")
> Reported-by: Roman Stratiienko <r.stratiienko@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
