Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2361323DA
	for <linux-sunxi@lists.linux.dev>; Sat, 28 May 2022 13:00:46 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id f23-20020a7bcc17000000b003972dda143eso5964571wmh.3
        for <linux-sunxi@lists.linux.dev>; Sat, 28 May 2022 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VWS0F56t0fOBh5xypCh8zjIFc6hxsrgivcZl7H9F6LA=;
        b=PrzcA+325+sgBUeqcHDmn4L7QnwPAbf1zUi8X9B3wbQZJnC2E/vNpDjRj9yQ2+/M6X
         hVZA9Y+2MxJCv7KC1+xrDmknqCIqW3gJtSRZAS2Qzec2WmmQD8x50tHxowFpb3Etn4ba
         Zj+s/97+ZBQSoRMH7FZzNJG8PVPcI8aqEhiY+P3fLEeKV0cIcMmSLFNcTrzos88B0AY4
         0eZyGiZM/sva55q2UjkvlcIQIfZNO5ODCZZJrDhmOuv8TwX3rUlmzk8FE3H4Pc+RdzFb
         TuodlU/HaWAatNwwByVVIk8+jlDlvpwJ6CUK0JUIkasUQ5iMnHAdNhtriE7gJFy79oiv
         Zrvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VWS0F56t0fOBh5xypCh8zjIFc6hxsrgivcZl7H9F6LA=;
        b=jlMa6/m1KGesbicbwXT3PKBfuRAvMGgxuwm+R3cmcLKraHjqEUUmtulrNrszEuudrC
         7wuunq8s2j9ypUl8ckOnRR0UPbt5i+m0tUFu056RxglADpOTJA+HRibi4zH/vCxArCqO
         52vlqWoQVpHGHIKi9QNKDBiV59PF1TxAa90u5UhYpES+leDky/PZyNuDMikeYL1DzOJH
         IgWZuVn2PzaJwVAcezlRskzHrMKSJtwU8IgPy+ZO/n3KudEh4PvxhielpT/ocAPfsWQL
         AOVo0MPrekoNpQfkk5p2j4sSG+F7xSF0H+27j/yHzFXZbT/Y1eptOWKi9xuyZfh3rJIT
         HF8g==
X-Gm-Message-State: AOAM5335BoV1oU7KScYNfdPlktQkPD5VkaXO/h8c7G2q+C/kS4NC3SiF
	wUPswz3Rigs/2wPWxp/rpag=
X-Google-Smtp-Source: ABdhPJzO+5nhwDzTELUOeEMSSdR1F7EwBlN2PhikUDajX3eKDowkhtLyBlk+UYucTI1HfWnQh0SAZA==
X-Received: by 2002:a7b:c4d0:0:b0:397:4636:6bc1 with SMTP id g16-20020a7bc4d0000000b0039746366bc1mr11065865wmk.48.1653742844347;
        Sat, 28 May 2022 06:00:44 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id bw30-20020a0560001f9e00b0020ffa2799f4sm4045530wrb.73.2022.05.28.06.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 06:00:44 -0700 (PDT)
Date: Sat, 28 May 2022 15:00:40 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-crypto@vger.kernel.org,
	linux-sunxi@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] crypto: sun8i-ss - fix error codes in allocate_flows()
Message-ID: <YpIc+FtQIOdm9Ub+@Red>
References: <YoUt+LNsM8qFZYgL@kili>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YoUt+LNsM8qFZYgL@kili>

Le Wed, May 18, 2022 at 08:33:44PM +0300, Dan Carpenter a écrit :
> These failure paths should return -ENOMEM.  Currently they return
> success.
> 
> Fixes: 359e893e8af4 ("crypto: sun8i-ss - rework handling of IV")
> Fixes: 8eec4563f152 ("crypto: sun8i-ss - do not allocate memory when handling hash requests")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Tested-on: sun8i-a83t-bananapi-m3

Thanks
