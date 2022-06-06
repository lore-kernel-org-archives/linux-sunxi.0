Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42707E
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jun 2022 18:53:20 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id l2-20020a05600c1d0200b0039c35ef94c4so6256732wms.4
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jun 2022 11:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=l14UJVr8JeVd46Rnv0c3uT4zyDvuy4FY/KAjhGmnJ50=;
        b=Yzg9qn8BVYX07x33D0xN2x3wMGeNiLAKY0KZ81O9Vp9EQ+lLdNC5tENc1i6Mkt2TwD
         EDyQZotpqPwB2o6EQB3wiJSiSOsKxQ5nPTx6IXQcw6LyqbyriJdGvNC9CtEvnGss99Np
         ZyHfarMUzLQRQbzQSPIbylJL3QAvnw7ENg1Vahe87NBVMzgi1is8u8ioHwMg1KVmR9B/
         M6apwX5DSZs7LVzZ60odfiKmgBXC74H7++1/zLeD+/z6YIwxH/cU2wSLgbxvZt/uxpcl
         WZIHQ7pNDSUJkei7Jl5vMXzxOhLu5mZc6ue/N3tJFH+qY+27pGzeqc3oe9f43PcnP1GD
         j26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=l14UJVr8JeVd46Rnv0c3uT4zyDvuy4FY/KAjhGmnJ50=;
        b=M4XoOtxR2SIM/RdCBOFgu7t5L84KujQQhrhjPBXhG+x+YwpDffugjLaRy1cpB70LlX
         M3wSmryQUw3xlZlMPedTSE5uzyVDfNxIvvJhLzEOFRw5nUppMMN6eHxEBVw5uyP+mMl/
         qhz8GgMVmUeD7DBn1BFm/cDlXsa/Wd8FRu9QSO6pxbnZiDKi4tH+EiX9lhbSoC0XTroC
         TAcF17zG8gypOtSTjSMjNq/1IxT9PUy4+kCry29IB9IfNh/fmv+WyVrDAvX5gKVbmzei
         IkETqoZr6UWPh2X20oB7tuqHxlU7UYKgZBEJPuZTo1ccf29YKD00i1P7SoIcgSz3LE6C
         JN+A==
X-Gm-Message-State: AOAM53004U58abVilK8n3M4+gBjpVg40KpS/sIcuzC9mYCfc4qDAZsg1
	e4h9lIBGr+80G/+ifFhzRMQ=
X-Google-Smtp-Source: ABdhPJywM3ZNrCCkFpfyK/jOUf7GfgVU2XbbjA36GrCrLfe1KwYeezpbsCRyMkYwa1ALsVcO7yjrmw==
X-Received: by 2002:a7b:c841:0:b0:394:890e:9195 with SMTP id c1-20020a7bc841000000b00394890e9195mr53972744wml.59.1654541598908;
        Mon, 06 Jun 2022 11:53:18 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id m4-20020a1c2604000000b0039c506de087sm3426516wmm.6.2022.06.06.11.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 11:53:18 -0700 (PDT)
Date: Mon, 6 Jun 2022 20:53:13 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au
Subject: Re: [PATCH -next] crypto: sun8i-ss - fix error return code in
 allocate_flows()
Message-ID: <Yp5NGVspV9dz1cxQ@Red>
References: <20220606134815.4103024-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220606134815.4103024-1-yangyingliang@huawei.com>

Le Mon, Jun 06, 2022 at 09:48:15PM +0800, Yang Yingliang a écrit :
> If devm_kmalloc() fails, it should return error code in allocate_flows()
> 
> Fixes: 8eec4563f152 ("crypto: sun8i-ss - do not allocate memory when handling hash requests")
> Fixes: 359e893e8af4 ("crypto: sun8i-ss - rework handling of IV")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Hello

I am sorry, but Dan already send the same fix days ago.
https://lore.kernel.org/all/YpIc+FtQIOdm9Ub+@Red/T/

Regards
