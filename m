Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C06C1640F
	for <linux-sunxi@lists.linux.dev>; Wed, 31 May 2023 21:22:58 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5147e8972a1so337516a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 31 May 2023 14:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568177; x=1688160177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQC0Taw9DGW/ijDYPQDBEhLOfb54DcOaqiw5dKW4RRw=;
        b=fQbgXhP7vZD5Cb5UboaK4p5MsA/A1lgkFfndrv+/e6Xdt9DuyuFoNjaL9zWH1qYT8K
         9H4c8AZT060gPZ4qDCi2b+rM/kjePV2T6Imlsc17d+sLCRR+86fQR75zjnq2I9yil0Tv
         GV02WUh3oqGASMqxsvRnMBECZ20TovHpByejrsq8QjgwfCTtd9/p3y2Saso2RPn45O7D
         mor9RvUFMe89ioFgsQ9qVPOKBP5ORxy8pnIocKTgdXne7HdJaxb5yVWqxYV8DglitDJG
         ML38K61GcbMU1RVEiCAq4wcoCUt0nRaS+djaA5bo2qRQL1Jsszs8QOE7SEeSqBY2azdd
         UYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568177; x=1688160177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQC0Taw9DGW/ijDYPQDBEhLOfb54DcOaqiw5dKW4RRw=;
        b=EBz6RKGWn45CL/RVNVqAnt8Il5IHz3Igl+zbaOZ7Ynf3le02uXNuLQ1o94DetWGByU
         wgj52E8yK61afSy7THU4c0ftpCQ2oSsKMQAth5xRNtNAEyPG+nFK82OFMr2VGzyHBbGP
         J2dmgLbfh9bkoNy7nHQPPNaj79K0IJzscXfVfaW44NIov3UAyJZf33JZIWWHxX5J0vDW
         1wJM0clMu0zm7gqD+6NHzzooikl2Vylyz3I2p01rpTQB7bBjxNm8/bjiqt2Vx521LLA4
         /Nk1Tj7R0RJ34mDM/mqjX3qLeD0Q5f5SCpcvo6MYpp3SM8WEd7MrXYDpD6lgG5sceUue
         kq9A==
X-Gm-Message-State: AC+VfDyiOCbT0kBkZkhLGdq5FoRWsQ94oE51QA+9V7jdN8v0OfgL8bNm
	naanUkPHQuRrD1azv+ClOwU=
X-Google-Smtp-Source: ACHHUZ58AfxanTFy84gvgH+WbnI8SDn1e0skiaPsqfAo0ulKz1ynaHRQnVTu+7rCnWtzRmHPssV4kw==
X-Received: by 2002:a17:907:6d27:b0:96f:f50b:9b15 with SMTP id sa39-20020a1709076d2700b0096ff50b9b15mr6512573ejc.35.1685568176853;
        Wed, 31 May 2023 14:22:56 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id lf4-20020a170907174400b0096f7500502csm9594497ejc.199.2023.05.31.14.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:22:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc: linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-crypto@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 5/7] crypto: update some Arm documentation references
Date: Wed, 31 May 2023 23:22:55 +0200
Message-ID: <2283368.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20230529144856.102755-6-corbet@lwn.net>
References:
 <20230529144856.102755-1-corbet@lwn.net>
 <20230529144856.102755-6-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 29. maj 2023 ob 16:48:54 CEST je Jonathan Corbet napisal(a):
> The Arm documentation has moved to Documentation/arch/arm; update a
> set of references under crypto/allwinner to match.
> 
> Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-sunxi@lists.linux.dev
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


