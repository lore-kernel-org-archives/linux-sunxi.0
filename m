Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BAAA4E
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 07:47:11 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id a89so6115640edf.5
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 00:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=hPc+aF2VAi/VbtY/nNmAuTS5AG9h1lW1aTIOSa9Z7t8=;
        b=TcrPgJ4ohViDciruhNDRuGYu8uFAQ7ywdU0cgSCp6gfiZ9WMtHxZGnHTWpXtzyJFww
         Pg90Kl2fWc/reoStkjEFcj8YZHJUHgvqsoaCwnOWScJMxfY9Lpu5lcOtwXD0/b3rsy+q
         XLbNEtxtZ9L4JYQxWpHo+hBBlOlDzOlRUGP+1iPQNp5vAHXhC/q0M2LXWfXT/SepsYCJ
         MJu0Ga3dQGkUi09svuD8eTus6cQJ282lmm82NP0KnCyfcNJso0p/fhuQShnqOlFxYyOd
         7u7Y2pTLQE+++IL5972uDenQ5Q2XG7Bp10K46srntrOJ9ChWAHpCkS3z+kvs3pC3+Avg
         QvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=hPc+aF2VAi/VbtY/nNmAuTS5AG9h1lW1aTIOSa9Z7t8=;
        b=neCWnFkkFLvid3hW8TMypM89uRmqWFVRX9pVCpuIedw9BgFcKUx8CMYzxufhp3YtRc
         OuZK10tdcSeXHmTymIsr8ZaVttfKtwUo2vsz6IXNY9WMzHKe5V96dn70aAb7LA2t8edc
         SSXFWZ+E+w3ep3awuAFkhKu5TArGehVdnBx+/WVQBhtncC998D7y6o+ykp4lkO9ZDy09
         +2ybu23YM886dzM7XQUyoyuTd0o3i2gxlnz9YQ/Z7c+kOS1lGIchYio+FU3WgL1+1MTB
         JwOsy6GiPRgPsjG46LQ2jCCUZUXFSXUE0fRVZeb2z71dsP0XyMKDsddnA3LVDliCFUer
         JWLA==
X-Gm-Message-State: ACgBeo2EjTVwQSbevySXdVGmseQWZXwpkMMSrj8WnTL3KOp94NCMmxJ4
	PFzNQOetdfcNDif0NiiLEXQ=
X-Google-Smtp-Source: AA6agR4xesSbq0h+Z50jLzI3hDE4cPZAkKUdasYL/U5BfidpRRo0/xGAgREkUb2XLYIBaHbs5IHMRA==
X-Received: by 2002:a05:6402:5190:b0:43d:da02:566a with SMTP id q16-20020a056402519000b0043dda02566amr10055382edd.187.1660463230217;
        Sun, 14 Aug 2022 00:47:10 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id 23-20020a170906309700b0072b342ad997sm2651373ejv.199.2022.08.14.00.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 00:47:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jagan Teki <jagan@amarulasolutions.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/4] drm/sun4i: dsi: Add the A100 variant
Date: Sun, 14 Aug 2022 09:47:08 +0200
Message-ID: <2110674.irdbgypaU6@jernej-laptop>
In-Reply-To: <20220812074257.58254-5-samuel@sholland.org>
References: <20220812074257.58254-1-samuel@sholland.org> <20220812074257.58254-5-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 12. avgust 2022 ob 09:42:56 CEST je Samuel Holland napisal(a):
> The A100 variant of the MIPI DSI controller now gets its module clock
> from the TCON via the TCON TOP, so the clock rate cannot be set to a
> fixed value. Otherwise, it appears to be the same as the A31 variant.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


