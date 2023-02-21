Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FF38492
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Feb 2023 18:25:12 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id da10so22142234edb.3
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Feb 2023 10:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3BLHBNbyB6d4PScjJ/843xzZfyZJGKfFJawvu4dX2Y=;
        b=OoQboNmUTe52RXikv+7iuojM9BYFM1K0l2C5ASBMAunqW2ynay57tF+lJN8GW4cxAo
         brqUlL3eGHUDbfj5s3ZBrG/9WomcwJy8fynKVekVh65I8Uezl8KzpgUrtkQZB7TPSCEg
         x8nS3GgGUnVWc0DckOU69z1Cte4Nk3oatH17U2JX5MaJeT6yQHw6AhjzoPHqxItaXmyn
         xeHiHiXTA1OqwqApZjpBZ1eByhH+KV9qz4hftm0lmqvJaUf8fSyccDJEmngHKVI/Pmh8
         Ok8IM2u2zda5szc4POCqpG0/XQdwnpetkfgHqDTtNLMEPwk4ETv8ZTL/3W67gqADpDO2
         ioDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3BLHBNbyB6d4PScjJ/843xzZfyZJGKfFJawvu4dX2Y=;
        b=vHms7sWer3PddtCW0M/BmIpMioSSyBI17JJVTxBgEOvbDFiVkLgzRyeAhmhdcf+EJV
         XHVOsbqvuLhdE9+zAS/B5OCWyHOxt7kOIFUeHFVCn5eVZ8XR+d9VRjwTd18dEnClzP6k
         jL9LTC7AJFJ8xHAAJPN7PDNdw3hk65CsRqWNNu56cOaVr8cuqqttmlT+zmSvOjGq+cph
         IEHhQA3ay7YorAdbONsiDADtCgVkwTVaH/jRVSuYwmZsPhduBCCT58yb5UTuvEMKwTq7
         WaIX2DqzY2HSRYbSKiRS1Wv0VrUPPSDjfNz+26fPvV3F4s8HrunNRAxg9u3+Teh70K91
         mJAQ==
X-Gm-Message-State: AO0yUKUOEsWcwXb6PWUPhbt4EVs/LmJsU1T9I/Jl5PhFy9oaqWweR9AV
	QGRxZL1xQSeY0vLfpeVohIs=
X-Google-Smtp-Source: AK7set82XfQubhD+uVW5tIofQEMfTx1cY8todx0VzsAG9Cqi770GiHgVkzcuEjv+mlLWqFa37ybx2w==
X-Received: by 2002:aa7:c796:0:b0:4aa:a9c7:4224 with SMTP id n22-20020aa7c796000000b004aaa9c74224mr5535537eds.30.1677003911082;
        Tue, 21 Feb 2023 10:25:11 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id j19-20020a508a93000000b004a21c9facd5sm3826686edj.67.2023.02.21.10.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:25:10 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: dmitry.torokhov@gmail.com, ye.xingchen@zte.com.cn
Cc: hdegoede@redhat.com, wens@csie.org, samuel@sholland.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] Input: sun4i-lradc-keys - Use devm_platform_ioremap_resource()
Date: Tue, 21 Feb 2023 19:25:09 +0100
Message-ID: <2133023.irdbgypaU6@jernej-laptop>
In-Reply-To: <202302171036375639285@zte.com.cn>
References: <202302171036375639285@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 17. februar 2023 ob 03:36:37 CET je ye.xingchen@zte.com.cn 
napisal(a):
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to Use devm_platform_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


