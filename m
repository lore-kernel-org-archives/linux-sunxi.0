Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2C4408D4
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 20:48:12 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f736e0c9b1so22713575e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Jun 2023 13:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686343690; x=1688935690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qkw6POg+UiSa/tDDN/c67pcevto53fUQ+msTiW09Vyc=;
        b=hbJNMmJxwNI/MtOmJJLuvJcbvUD1wSww24GFjyFd7F+tT+wq5z10JucO/gEqLhRNN5
         Be6AS1Crl9jK4eDeJAa0g9fyTAOiu8deDoVM1uPK250EhBz8nuvr5lvFcY8SnV0vnaQ+
         pEHA+1d0f8TVU9/JPpM9CwdsTEdWX/QwRvnvbSGL0tkyl8LsW6lQ3rvluFbv8XwO4ChY
         6RPDJTuVIacvjUv+1TGEbeEWKckyHQh8zpavfbuO2ndnUOknBV9IxMz65+YfkLv0eisM
         FXooCa5j8OYXhKuJJIKC4h621kELPhQ9fGjkgBNoGfRW6Hrr4bJL0B3YdeUrIbTxvWzd
         kwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686343690; x=1688935690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qkw6POg+UiSa/tDDN/c67pcevto53fUQ+msTiW09Vyc=;
        b=Pm/tTayVMe0jXTMcyR8vsPF40sVjn+s+bJfcOe4DhfVA7H7pM43KnpZDCkwpOLbYqJ
         KGiP+o21wW9lhz4/SOEMJ1O0HEDSahkHdf0A/YuAnlwXakL3GwmOpiPQ8qpalj9Dh43q
         iRLI1vAAsfZNQt2pOho23UpO3JEQHA4bcYU2jqWwlD1o5bwflthHVfvEhOcWn7wGYt+4
         ATzMGpT+9I734j40BQF3JhyNL58W6wPr5oh4Zv1ayxxNq40FqU9qZ7blKqV57lzb7b+C
         /866+Oz4GuEM+YZG/nowNkCNyI0I0NXZqZITW1s+GlnDNr/1OZSqe0pIDU9R+uWVNcsu
         T8JA==
X-Gm-Message-State: AC+VfDzrmi0et1G1OJpaxjJZ0a8jzktsA4+mo57bM8Uk3SKqvPNSu8Nl
	A/XSdY2Fux1/C5vo9011Tuc=
X-Google-Smtp-Source: ACHHUZ79pHXyNg/GeZcnO8Z13MoKQknwF39Km8lFfNBOCfmvqyiHEyYX/MvE3nyh4hxv029fo3gK6Q==
X-Received: by 2002:a1c:750a:0:b0:3f8:651:e640 with SMTP id o10-20020a1c750a000000b003f80651e640mr2008273wmc.33.1686343690282;
        Fri, 09 Jun 2023 13:48:10 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id y19-20020a05600c365300b003f7f60203ffsm3646448wmq.25.2023.06.09.13.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 13:48:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 11/12] mmc: sunxi: fix deferred probing
Date: Fri, 09 Jun 2023 22:48:08 +0200
Message-ID: <8272212.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <20230608194519.10665-12-s.shtylyov@omp.ru>
References:
 <20230608194519.10665-1-s.shtylyov@omp.ru>
 <20230608194519.10665-12-s.shtylyov@omp.ru>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 08. junij 2023 ob 21:45:18 CEST je Sergey Shtylyov napisa=
l(a):
> The driver overrides the error codes and IRQ0 returned by platform_get_ir=
q()
> to -EINVAL, so if it returns -EPROBE_DEFER, the driver will fail the probe
> permanently instead of the deferred probing. Switch to propagating the er=
ror
> codes upstream.  IRQ0 is no longer returned by platform_get_irq(), so we =
now
> can safely ignore it...
>=20
> Fixes: 2408a08583d ("mmc: sunxi-mmc: Handle return value of platform_get_=
irq")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


