Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AE472
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 17:29:08 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id y196so15303226wmc.3
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 09:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=snUyZmX49ru2DxVA1QAuDQ2irOH1QZcg7Kt2R5LKKWA=;
        b=Y6AcF3jqLTQfik4x4LzAlDhqYQEGVK/QibQuHs0n/w1FmHLhdAIimow51Xk6wvo9Dd
         +j1Ki3GuabZUY7f0fwMnuMM8SmAomLcMRHXZorpK451L2d1AwLPaPIfVefkyglDvNLQc
         ANiRYra38Sj9dEAcAFjQeo+yCn73kVy1iutaiq6MvzsOpDQwc4Mud47Br9qBqnr2eg85
         p8qVMr2pO8dqHem46+AQxYgSPK1ZpnNq2MJiHjDy8r9JYgjpfyQrw4NHTxyi3/sAyNVo
         Lvy6RyoEyA7su2D185Pz/xkFTv8cDIEbbNzN8wND1uCgf+8+YbZgljL989B+lRYuELHo
         57FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=snUyZmX49ru2DxVA1QAuDQ2irOH1QZcg7Kt2R5LKKWA=;
        b=PLDfnoVHRIfYlRxoN2dlhsTVSKbFjdD3cgv8BDYQYl2CarViLaLlH0fpyOfWkI1pFS
         maUbO0jLGLGeYIa95aS/qLWE2B2TTZSTOPo3cZk12E+8IP5nxxgYxq38It+bwgOnoARE
         /Oqiew9jZn0i7BdH1R1bL49XE/MJR43cNGeQKTCduOMoG6tRfArEK9WSd5AU7hDmi50y
         Ft+R8W9DncAwXUrYIQGS86eOZ8M5nSXww0Cp+KQbhD8QYl/trjX3t00o7o7HqaUvPuX9
         d95Otthq22trqF9Gpyhs0KO7p7N9Ahw8xS4N4yPvU5zjqRl0uFsve3qbiuNui8NtYV8Y
         yb7Q==
X-Gm-Message-State: AOAM533kLfo3w1T6/sjE/qUJ2mq324xSpuDR7TnFDrYbHLrVoXGVXv+m
	+CUOFjJ4sdu0jAnKgrjybyc=
X-Google-Smtp-Source: ABdhPJyYfAAl2JWSuMRXT7tjdS//D0XTqPX2pxL3Jw8TBUDKfnIv56MLGMyEa4sMII81Uq6dT3Oubg==
X-Received: by 2002:a05:600c:19d0:: with SMTP id u16mr37736357wmq.111.1638206947141;
        Mon, 29 Nov 2021 09:29:07 -0800 (PST)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id f15sm19025488wmg.30.2021.11.29.09.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 09:29:06 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>, Michael Klein <michael@fossekall.de>
Subject: Re: Re: [PATCH v2] ARM: dts: sun8i: Adjust power key nodes
Date: Mon, 29 Nov 2021 18:29:01 +0100
Message-ID: <5516984.DvuYhMxLoT@kista>
In-Reply-To: <CAGb2v67M2Qi5tUq0BNbgahTsY4bbYGQeqzjoH8RZ6fYWzrWsYA@mail.gmail.com>
References: <20211129165510.370717-1-jernej.skrabec@gmail.com> <CAGb2v67M2Qi5tUq0BNbgahTsY4bbYGQeqzjoH8RZ6fYWzrWsYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 29. november 2021 ob 18:16:31 CET je Chen-Yu Tsai napisal(a):
> On Tue, Nov 30, 2021 at 12:55 AM Jernej Skrabec
> <jernej.skrabec@gmail.com> wrote:
> >
> > Several H3 and one H2+ board have power key nodes, which are slightly
> > off. Some are missing wakeup-source property and some have BTN_0 code
> > assigned instead of KEY_POWER.
> 
> It might have been that after shutdown there was really no way to
> "power on" the board with these GPIO power keys, so we didn't use
> KEY_POWER for them?

KEY_POWER is actually processed by userspace, so it would still make sense to 
power down board if power key is pressed. Correct me if I'm wrong, but in 
combination with wfi it could work before SCP FW was available?

> 
> > Adjust them, so they can function as intended by designer.
> >
> > Co-developed-by: Michael Klein <michael@fossekall.de>
> > Signed-off-by: Michael Klein <michael@fossekall.de>
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> 

Thanks!

Best regards,
Jernej


