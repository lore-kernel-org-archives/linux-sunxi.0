Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B827B
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Jan 2023 08:18:30 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso3013383wmb.3
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Jan 2023 00:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mtUcosCaiFsfOQ0fA0ahQY5pppeLiBLD4KCC5VXYb5U=;
        b=icRvW+Tr534VNRNBW5UTaAWPROkQHPaEQX/kRQllBk4WaLtMTbOvvt2+5GkqGvKwjk
         HMWXJQY72dSisDrmj5+XPNK4An0gYEbTyo1Izuw28K9NsQ1ZzJiOBh/qYCMC82mT2dSa
         XxZJloj1ZfhjaHunElL4zXEeJoKkxP22C9aR3f0QPYlooVtja02LbDwx367DjGDivev0
         N4OX1MHSB/+cUvxZOURfVofVvz6++3NbyK3W9oy7XmrqvQRpAdiOBp7pTKW+XHTtBPOf
         DULzmHwJkBrQkDOXKCCF4w4d0EJsgRIubwO9B4upphDSzYAyl7RBPrAww4OFbHh37aJR
         lIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mtUcosCaiFsfOQ0fA0ahQY5pppeLiBLD4KCC5VXYb5U=;
        b=miZDmn50cbFE8m0UCRa5XqJMnrDwcWPZfbWVMIrhHaEHDyjYSnErBSNjdam3TzxQfd
         sKhD73v+8ddDfYfdRGfuP7/4UDubdH5qDdBcy4pqYkWl4MpVyC+IkHbkI9CaEYWSJTxv
         Mf5mEWYK0fy+TyMFqTxpGAAY59Snwyds+4joaQ803fA+YS0J5aet9JPmBTe8ZS3q7GAD
         pYOzehB1bPHJSrdJvDSX25sg1TLV09ZL5vd9zxNiCfkRHTkRlcQ8LxIpLrDS2f6Qz1ky
         3pbANKGqxFobcrfILHy7ywgnNiPkux8NP3z+zIH4BHt0/DEsWiUIUEDAxg7qBcE4L4Pw
         KgZg==
X-Gm-Message-State: AFqh2koj2K+vMXeK/feMAM/QknJOUmzve5Xg7xliZNtLCX03LhrkjNH0
	ht42bAl0UVW1CZb+4fywNp4=
X-Google-Smtp-Source: AMrXdXvsRPiGLVmsJAtakcDFnG5+z9snPhbHZVsbxbv8NbhCBxCcgQosTNbJtylk0gcVpgxRnvAITg==
X-Received: by 2002:a05:600c:a51:b0:3d3:513c:240b with SMTP id c17-20020a05600c0a5100b003d3513c240bmr38839263wmq.7.1672993109084;
        Fri, 06 Jan 2023 00:18:29 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id o21-20020a1c7515000000b003d995a704fdsm797856wmc.33.2023.01.06.00.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 00:18:28 -0800 (PST)
Date: Fri, 6 Jan 2023 09:18:24 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] crypto: sun8i-ce - Add TRNG clock to the D1
 variant
Message-ID: <Y7fZUDSWaZhpL0hc@Red>
References: <20221231220146.646-1-samuel@sholland.org>
 <20221231220146.646-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221231220146.646-3-samuel@sholland.org>

Le Sat, Dec 31, 2022 at 04:01:44PM -0600, Samuel Holland a écrit :
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
> ---
> 

Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks
