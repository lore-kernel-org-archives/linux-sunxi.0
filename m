Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282183D6D
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Aug 2022 13:00:47 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso4375509wma.2
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Aug 2022 06:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=gbEN9UxsU21xAmPqLRQ6bvCHMSIs70CWk4vdsoTV/Vs=;
        b=gh589+6W1ZyYJ1lLD3Z/wqWLWBk+C3Y7Ck1WtAelzQ4mZ5TBg6OXaVXj48DaY0y0xA
         nnKT7jc2LYXkebw597InPMdPiu6PyxAB34f5wQ7TAa8WJwxWcluBVRnAF7VLusPoRBiY
         2khmNbwrBXUcuH4p6WHWTtS1U94HS+jWPlZ/tfHrq6skV7RmMq7TYpX3Rblmf0tEVX0p
         tKS+pqokJb3mqHbk89QHFXrpNX4KYfYMaHd6s6XfrJd5F72vETmRwHNkB07k8z9ob/7w
         6XkTDYlPV4s0zH9AnHwgvZKcdY91vpuiuSeNv3zW1dcZi6atxDFhEuuYmBlvkS7ADQxO
         rAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=gbEN9UxsU21xAmPqLRQ6bvCHMSIs70CWk4vdsoTV/Vs=;
        b=y+ojfmn/O3H8MINsHMjyypJuDoc+A3tlYhSHNIVdlz9h4S4gxWYqKKPxH9dmlLy/Pk
         MRDuELxZJuyQD0fIWXt4Zz5rC353JufHHpr4UwxD41B3f45AYDsdXgVNJPoVqnKzDuvq
         3vqoRB3h8ftsjY+JZdSZ7wGTCSW/yS1UoO32XCsyONaraGGFuXVOvvztXm1lASWA5BHm
         XLl23JS/jtOWAOddnxHeOGiDJivnKeaHocLRl1gKTNUuVTvrnrBw1VWZAHjooY7Ti2C8
         jGddyu0oBzrWU+Hfi/i+lePsZA8fYDcKTWQ7CSTtXbolf/nHuZbXjyNRWE5rCr8zTYVH
         N3wQ==
X-Gm-Message-State: ACgBeo2GTR7CPwrmlRrK92KcqqslQ5gkh1k2fyfk/VhcZTLpHWfVpIBX
	h0Y3x6CmbAvXICtzcVjNMIh69g==
X-Google-Smtp-Source: AA6agR4bhrOYV2p970IFCBpbHLMVir888AHSL15uhcTxUv65WoqURpaZJd3jKHG9An4NPBZAeQZDYQ==
X-Received: by 2002:a05:600c:3482:b0:3a6:e09:1ebf with SMTP id a2-20020a05600c348200b003a60e091ebfmr5158387wmq.173.1661518846210;
        Fri, 26 Aug 2022 06:00:46 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id a4-20020adfeec4000000b002258c4e82casm1359965wrp.98.2022.08.26.06.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 06:00:45 -0700 (PDT)
Date: Fri, 26 Aug 2022 15:00:42 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-crypto@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [bug report] crypto: sun8i-ss - rework handling of IV
Message-ID: <YwjD+mlHrexwVuQc@Red>
References: <YweemJw2a5OSWx1h@kili>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YweemJw2a5OSWx1h@kili>

Le Thu, Aug 25, 2022 at 07:08:56PM +0300, Dan Carpenter a écrit :
> Hello Corentin Labbe,
> 
> The patch 359e893e8af4: "crypto: sun8i-ss - rework handling of IV"
> from May 2, 2022, leads to the following Smatch static checker
> warning:
> 
>     drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:146 sun8i_ss_setup_ivs()
>     warn: 'a' is not a DMA mapping error
> 
>     drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c:213 sun8i_ss_cipher()
>     warn: 'rctx->p_key' is not a DMA mapping error

Hello

I dont know why I used an u32 and not a dma_addr_t.
I will work on a patch fixing this soon.

Thanks for the report.

> 
> drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
>     115 static int sun8i_ss_setup_ivs(struct skcipher_request *areq)
>     116 {
>     117         struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
>     118         struct sun8i_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
>     119         struct sun8i_ss_dev *ss = op->ss;
>     120         struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
>     121         struct scatterlist *sg = areq->src;
>     122         unsigned int todo, offset;
>     123         unsigned int len = areq->cryptlen;
>     124         unsigned int ivsize = crypto_skcipher_ivsize(tfm);
>     125         struct sun8i_ss_flow *sf = &ss->flows[rctx->flow];
>     126         int i = 0;
>     127         u32 a;
> 
> This needs to be a dma_addr_t a;
> 
>     128         int err;
>     129 
>     130         rctx->ivlen = ivsize;
>     131         if (rctx->op_dir & SS_DECRYPTION) {
>     132                 offset = areq->cryptlen - ivsize;
>     133                 scatterwalk_map_and_copy(sf->biv, areq->src, offset,
>     134                                          ivsize, 0);
>     135         }
>     136 
>     137         /* we need to copy all IVs from source in case DMA is bi-directionnal */
>     138         while (sg && len) {
>     139                 if (sg_dma_len(sg) == 0) {
>     140                         sg = sg_next(sg);
>     141                         continue;
>     142                 }
>     143                 if (i == 0)
>     144                         memcpy(sf->iv[0], areq->iv, ivsize);
>     145                 a = dma_map_single(ss->dev, sf->iv[i], ivsize, DMA_TO_DEVICE);
> --> 146                 if (dma_mapping_error(ss->dev, a)) {
> 
> This can't be true because of the 32/63 bit bug.
> 
>     147                         memzero_explicit(sf->iv[i], ivsize);
>     148                         dev_err(ss->dev, "Cannot DMA MAP IV\n");
>     149                         err = -EFAULT;
>     150                         goto dma_iv_error;
>     151                 }
>     152                 rctx->p_iv[i] = a;
> 
> But then only 32 bits are used later in the driver in ->p_iv[].  So it's
> more complicated than I thought.
> 
>     153                 /* we need to setup all others IVs only in the decrypt way */
>     154                 if (rctx->op_dir & SS_ENCRYPTION)
>     155                         return 0;
>     156                 todo = min(len, sg_dma_len(sg));
>     157                 len -= todo;
>     158                 i++;
>     159                 if (i < MAX_SG) {
>     160                         offset = sg->length - ivsize;
>     161                         scatterwalk_map_and_copy(sf->iv[i], sg, offset, ivsize, 0);
>     162                 }
>     163                 rctx->niv = i;
>     164                 sg = sg_next(sg);
>     165         }
>     166 
>     167         return 0;
>     168 dma_iv_error:
>     169         i--;
>     170         while (i >= 0) {
>     171                 dma_unmap_single(ss->dev, rctx->p_iv[i], ivsize, DMA_TO_DEVICE);
>     172                 memzero_explicit(sf->iv[i], ivsize);
>     173                 i--;
>     174         }
>     175         return err;
>     176 }
> 
> regards,
> dan carpenter
