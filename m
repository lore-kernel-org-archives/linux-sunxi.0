Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FE9D536
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Jan 2023 16:29:37 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id w1so24547677wrt.8
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Jan 2023 08:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0EVCr8niOrDqjzMLygmK437Bl2kIDtpevcurJg/sh4=;
        b=jDIVtUpClcQ+UxG9qVupCt0iQQGwHM+d6T7wEusmr+qK30mUCcYc9GUyuqoMxRGc6F
         yLsE6pp9oKTyZKpGEPno5HWa/Jp/mb4Kc0geXzmf2qw2NY8NBd1Jgf0FriM5Za1PQKZV
         1Hyyngu7+VstGQViUN36nBx25MrximOkklcdi8G+oTCIwZ5tMwFmvn7FmIPpIrrqe5ND
         a0Hw5QjJ2BBPZUTn0xztv694WU6bZ6DQTF6gBJKr+sAaDlG3r3jof4uouVUvKsnD8OcK
         nDlc91mOj0bGL3XTt6c2pFBHr8WyBJRHyB4jI5T2BeUBBlZDszPy4LltDjv3zPP19r3G
         Qxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0EVCr8niOrDqjzMLygmK437Bl2kIDtpevcurJg/sh4=;
        b=sAYxxzMN3em6gL4y+Dmi9k3E5Cf+jw/a08Xa/ATI25m+UdoHvt+/+wGPoDeYdk3HIC
         A/nohdxOnq10HUmsAVw3Ia2oKQhIwcdbgYS8dJdnOKp9sOzE2iID54c5di4FSQQjCKky
         9sYJiiQq7wBszo1PDOi/xPQzAABJB29HhB6YtX9yvYhOafPqfZU94yZ9swhsYSVMUyiC
         fZhacD74roVCgK6GB0sTobkDBH7aYU75GYsVMZzCCbaSqqpArOt1NvLOGrjWdqDqO8HW
         HwrlJwy4RRMLknSY7s2DxhlyfWOMnr1u3Ob/W/8EsTMUnhNZEI1XKgfT05UtmNOSr1QY
         1cDg==
X-Gm-Message-State: AFqh2kpwugt8PihIF/8SE8VxHmNNdDoSpXBc4oNqM0T62kxC4f/HbnI0
	GvVMJIy2bYlwPWAHGhnf1T4=
X-Google-Smtp-Source: AMrXdXtdx1ljPkWlugJYyqxedcQLP7LIr489mbO58wIq4UPlhosgyNRl41DeetoAC5tBRLPKPwtTzw==
X-Received: by 2002:a5d:6844:0:b0:2a2:5a2:cc10 with SMTP id o4-20020a5d6844000000b002a205a2cc10mr5139614wrw.36.1672936176128;
        Thu, 05 Jan 2023 08:29:36 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id z1-20020adfdf81000000b00268aae5fb5bsm36862776wrl.3.2023.01.05.08.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:29:35 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 2/3] crypto: sun8i-ce - Add TRNG clock to the D1 variant
Date: Thu, 05 Jan 2023 17:29:34 +0100
Message-ID: <3212177.44csPzL39Z@jernej-laptop>
In-Reply-To: <20221231220146.646-3-samuel@sholland.org>
References:
 <20221231220146.646-1-samuel@sholland.org>
 <20221231220146.646-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 31. december 2022 ob 23:01:44 CET je Samuel Holland napisal(a):
> At least the D1 variant requires a separate clock for the TRNG.
> Without this clock enabled, reading from /dev/hwrng reports:
> 
>    sun8i-ce 3040000.crypto: DMA timeout for TRNG (tm=96) on flow 3
> 
> Experimentation shows that the necessary clock is the SoC's internal
> RC oscillator. This makes sense, as noise from the oscillator can be
> used as a source of entropy.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


