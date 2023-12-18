Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124EB72062
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 19:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNvUyRjh"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50c0f13ea11so4371011e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 11:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702929371; x=1703534171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNO3jiSu7ic70hh4tyicrSnhqEtgPiAeeapM4Oz5gIE=;
        b=iNvUyRjhAZrP7i0qUn6wMikKQwD+DQC0aV8zUgEOj5GC6+rr/nBfxlojC+/WmxK72W
         nv0ODb4xrD/RTWqJ2Pyn4Y/qWtedkiuPGw8Z8G/S4XXMZ57SlsQ1ZOLUz+OPGLXgDWVM
         ABcNBhAwIFSL2j8LlxycX6WvdgKPKn6WuavXp5roxo0l8wn24JEbDXoHZ7+9NXEkRRMR
         WHPVIB/9EtDgMxHgyJ3in71RUS/GKVLDm5VIDSrhAuTjW+WaBNhkWzoEVn0xilqHuMix
         y/R3PMi0CjL95jmyZ8JKS3X5c7ft+ymbx8gVcwI6tG8j5gM9cB/JBHakMCzSGv5jLxnS
         iJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702929371; x=1703534171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNO3jiSu7ic70hh4tyicrSnhqEtgPiAeeapM4Oz5gIE=;
        b=Rauq60qyWKdp294+Ybht/ZXXwzou0iFQv3dG+cFMuC1HGIBqOUmYHVCyTw9ZzduUSL
         N03GCIuwDRLDK84wrs0Akc1bKqUPeYBzH6pMx1RPCRn78M7NuDhDINORMarQ1BFYnRtz
         HX6B+yrFB3ukA3sWbM5Z9WBILA7F2M2Fec7EE19Qcwh9zb/lu4vk9oqw9BdRYdUjz7D3
         IjxDIj146XZ79AfhUGf1OvvCWLX9juXfKm+9aRH+tSjelM0s70nuBB/AZV78ykwTf3S6
         p+bQtSxMpmF4PA+9qwOILHzsTMhZXnHnqRLy8IjLfSH4cNDBVVK2u3KiF5xiKJQcGwru
         yTgg==
X-Gm-Message-State: AOJu0YwYGMGhDVxD8mIudua1v4jUbYGM3r4o/GvBz93wScLy1k71Zj8N
	+7LUQ33UJuyEvuFZyP97veE=
X-Google-Smtp-Source: AGHT+IGqqjw8wDeHxgdqEtTKBo2i830o6mNdblTFcEpQVPyBO4j57qkcMzMS3IxB9FnDj6Zou+dADw==
X-Received: by 2002:a05:6512:3344:b0:50d:1e07:5aac with SMTP id y4-20020a056512334400b0050d1e075aacmr8599983lfd.43.1702929370889;
        Mon, 18 Dec 2023 11:56:10 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id h29-20020a0564020e9d00b0054c63cc0469sm10780410eda.33.2023.12.18.11.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 11:56:10 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-crypto@vger.kernel.org, ovidiu.panait@windriver.com
Cc: linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
 davem@davemloft.net, Ovidiu Panait <ovidiu.panait@windriver.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 6/7] crypto: sun8i-ce - Use helper to set reqsize
Date: Mon, 18 Dec 2023 20:56:08 +0100
Message-ID: <4532392.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20231218164649.2492465-6-ovidiu.panait@windriver.com>
References:
 <20231218164649.2492465-1-ovidiu.panait@windriver.com>
 <20231218164649.2492465-6-ovidiu.panait@windriver.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 18. december 2023 ob 17:46:48 CET je ovidiu.panait@windriver.com napisal(a):
> From: Ovidiu Panait <ovidiu.panait@windriver.com>
> 
> The value of reqsize must only be changed through the helper.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


