Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDE117FE0
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 18:23:07 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso63351875e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 11:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689099786; x=1691691786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7xPaNuGxjRVce9if/BkLrzBXCRANFyenyUfHAqEJI4=;
        b=qw9DZGtJtiv5SMYXbeSqGBDE2tktVR1mtvGA18xXWNWGPUNx/4O/F7gqNn6XGZiAm7
         M2CL+ZrNoWd1R7k64Mq8q1Xv2i2768qfiNBlh1TH9ZC0jWukI7o42iWHWtMo8rbpX5Fm
         wmIUPZnHXq8KLJfiOyMXFMvNAIK9Zz532+cu5yi0xO9pqjsFHh5IZMF2UqjN6EIyd523
         sUvML+62H3KBwK32NzOSmxkpjMLV2cy4FiEyxUUqK6uivBfTMHgU5mweSxqpXftBfdf+
         yKhaBcTt0nyWcmMZa7kY2Jt7HS0N7rGFaarSg5NAoSvPuNF5ePoR1GrMcSej4rDVqx5w
         FAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689099786; x=1691691786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7xPaNuGxjRVce9if/BkLrzBXCRANFyenyUfHAqEJI4=;
        b=RmFihjKidrFHxgvsBVa091hO+Ar5n+HMVwDdM1EqjWY7FQqnIN48ZpjZf4DFqjwFaM
         TAcquSI40ubnLKiVzCW0G5sg2EzbfVWQjBYLwtdf5wq/B4x/BPlWZ+V66oCYUPHTGwUT
         TfWmJ3deOeyLdiCK9hWDd0mIUWPkkQpznnmOZ1r50Cm2SqmamxPKNLuniG8+zMn9wDuC
         bmXNncHQc91qicIc7zu0XlHRPVh4btOk7VUoj6krKOWcoWcqd+HC1WvmluQG2qtrdYPa
         XVDx9T6HNAQlrflJZNT/+/4ivAFKwhM8NkHgseLBOdLVyxmC/aG7QFC4H9+upvdWjbx4
         myPQ==
X-Gm-Message-State: ABy/qLYNjqQP5MsHbW8XYpgHO1iyzwKDc1IX526RdKe2j3h8hXcH7K/L
	/6OBZZk6ZkL6624VGF/YDBg=
X-Google-Smtp-Source: APBJJlHWLKu+Ss4FLYKlJKMc415q932H2IE9tLV4rBu9e7rP9nTkJGw1cSnX8i+/joaCcRGaRo4fJA==
X-Received: by 2002:a5d:4582:0:b0:313:ede8:9f13 with SMTP id p2-20020a5d4582000000b00313ede89f13mr15134045wrq.32.1689099786086;
        Tue, 11 Jul 2023 11:23:06 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id d17-20020adfe891000000b003143cdc5949sm2967568wrm.9.2023.07.11.11.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 11:23:05 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 01/18] mtd: rawnand: sunxi: Use
 devm_platform_get_and_ioremap_resource()
Date: Tue, 11 Jul 2023 20:23:03 +0200
Message-ID: <2230707.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20230707040622.78174-1-frank.li@vivo.com>
References: <20230707040622.78174-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 07. julij 2023 ob 06:06:05 CEST je Yangtao Li napisal(a):
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c
> b/drivers/mtd/nand/raw/sunxi_nand.c index 9884304634f6..db36bd755b8d 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -2087,8 +2087,7 @@ static int sunxi_nfc_probe(struct platform_device
> *pdev) nand_controller_init(&nfc->controller);
>  	INIT_LIST_HEAD(&nfc->chips);
> 
> -	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	nfc->regs = devm_ioremap_resource(dev, r);
> +	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
>  	if (IS_ERR(nfc->regs))
>  		return PTR_ERR(nfc->regs);




