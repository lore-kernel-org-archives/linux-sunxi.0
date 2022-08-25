Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D734C74
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 21:45:59 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id s23so10823616wmj.4
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Aug 2022 14:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=mE/4YBZh38TyYLhC6G5fQYeRHrAbzB7JvF8agv/vdQg=;
        b=P6++xFNR1j0FfYdfcet9OwwFkgk8uW+QeGrsGedHWY32iLGlB2WTWHd0wEKUvrLfyw
         8PIs4gz3vkR9Mxv5wfuXVMTHU5ZYIkrj2GBHeqM27WwzY2tF1tPpbagfTsmfbx5BWVPp
         DOePwUjptMdp2mN1L2K2lS6WdQXAd6gNyRoxaMAiNlGePB3owtm/aCrRQguMiHKITf/4
         VuMJC7mvsdos057Hw1T5i8rDb58UF3RBi40wqWBJpnN75SZxCwMjbhaogevZ3kXA+BN8
         RsJ9P04/SH/PsScmrAk2cxLYQ7MuPMUBB5HUnXSfEKoNqoNx3PVdxp0gvFUiBwB/zH5t
         Jpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=mE/4YBZh38TyYLhC6G5fQYeRHrAbzB7JvF8agv/vdQg=;
        b=ZOAgDg/8xzKLrC+PuktxjXNTr9pVgeFhqZwaXyjll+4BIouPReyxkRiJj1wmB5xmjU
         DbmKgx2CEVdYIw3bakGeDMe49W0FoAyelCQN+PIT3PhliAP6UzLOhKg220Zr3NvcNqdE
         dYhrLQD03mSsrfxHbKaQmO0wJX6dVye1WRUuwjIu8w6J1mMWWyBTxT+d8buxihl8wAhC
         nxENGuc41BIeBKD6tiPV05YzH2sM9ARVEzIhZrEOurIdWfUMoceM2MpFVPwcEt7l6UnQ
         +cn+prMKKr4PwxeG6h43DCQ6IJpT50WvEgBK7ETssyArkYrDIg/9+gq4MlMpVjs4q09I
         +wSA==
X-Gm-Message-State: ACgBeo2lNQ17DoJycE9aTTZTa/TLAtT8Xu341fzYYeXUMoHbAJnZP63V
	v5JbkqdroJGd5s8zOiGAI+s=
X-Google-Smtp-Source: AA6agR7230MGbs821+A8YN82pus383ho1o4vUi1fAFFJ5dzUVRhvyyd967MFX7/eyIwgOmyNIlfCpQ==
X-Received: by 2002:a05:600c:4ed0:b0:3a6:de8:5e7d with SMTP id g16-20020a05600c4ed000b003a60de85e7dmr9320639wmq.181.1661463957948;
        Thu, 25 Aug 2022 14:45:57 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id az41-20020a05600c602900b003a60bc8ae8fsm466499wmb.21.2022.08.25.14.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 14:45:57 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH] clk: sunxi-ng: d1: Limit PLL rates to stable ranges
Date: Thu, 25 Aug 2022 23:45:56 +0200
Message-ID: <1870351.taCxCBeP46@kista>
In-Reply-To: <2839208.e9J7NaK4W3@jernej-laptop>
References: <20220812080050.59850-1-samuel@sholland.org> <2839208.e9J7NaK4W3@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne nedelja, 14. avgust 2022 ob 09:47:42 CEST je Jernej =C5=A0krabec napisa=
l(a):
> Dne petek, 12. avgust 2022 ob 10:00:49 CEST je Samuel Holland napisal(a):
> > Set the min/max rates for audio and video PLLs to keep them from going
> > outside their documented stable ranges. Use the most restrictive of the
> > "stable" and "actual" frequencies listed in the manual.
> >=20
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!

Best regards,
Jernej



