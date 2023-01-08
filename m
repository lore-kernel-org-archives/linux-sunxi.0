Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D441859
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 20:35:40 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id u19so15409018ejm.8
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Jan 2023 12:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQJIwqeYmyWkro6un9gi7pSZ4GoLQctoFJAH0R2W/B4=;
        b=PFTIfRbP9yzLUcrncnQ1AT7fiYxKLYkX7ARLPBFqwPEyqzskqGx6nvcwigjdKkTPl3
         9f0NjGuhgF64K7/Dqz2G7DEt1nNICZiklTljgD35mBY7Usa4WF5iE+uwaxu4+UDytzWv
         D8ueyfaElCGkroRpa9GUdwBYK14yUXtRgxzp8mgKUnubyDLArTjautkolPEahDH5uWLK
         NkdFN3pGNnqpN9Ax49/s+uDKAl8H+5Tfo7H2bntIyfS+pUxKsh2JAaJOpZQeN7QKJhmB
         3M0jWrYu+IzL/x7uFw6CJ+TT6vFsI8se4VxW9691uP8jXyopvCn/ymKBcXIN5Z9Iq+de
         WGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQJIwqeYmyWkro6un9gi7pSZ4GoLQctoFJAH0R2W/B4=;
        b=sCqmTfVgiCjeXUltW7FAEHQrMyjKoGaUkaUsA7TOY/QERTRvz4+ZcgUPB6cuktSwJe
         4ShytJX0lmUJc+56sS6mnPbQaiA5Rps+bZv5moXr+RH731CVmOxGlE+H/0wLtML5W1zS
         /uA9NOw/Xgndj6Tat+a7gHqy+P0oPBlPwu/wT8JHx5cEpXkJb43sXRuwYFJU8W1yS3Hs
         vbaKbMnbYq7mx08iJELlO/WOdgzEXrVgarE7W0alY3xorcu6Xz7WFhQfOEoRS9kodoBf
         SzHpO2S1GrMM49XsW/Z26RKLIHL0AsTwu9j/J3wudla1zLLCJGiYInoBEGCqLyGf9f/t
         SjUA==
X-Gm-Message-State: AFqh2koHtBRe8Uunq2ZKDb7m6VuhN2igsdCXAphsDgToY7fcB6WzFPlW
	4Fe3N0awa1zAxjYylp3/H50=
X-Google-Smtp-Source: AMrXdXtTNvDJqQ2MA9S+Usovb2BW1fe4bAzc0B83B3Be2a8jcVP2FLs0yFAVbUPqcIWCrObr/eLS7Q==
X-Received: by 2002:a17:907:6d22:b0:7c1:52c:a960 with SMTP id sa34-20020a1709076d2200b007c1052ca960mr70723250ejc.8.1673210138428;
        Sun, 08 Jan 2023 12:35:38 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0084d4a60b3ccsm64190ejf.115.2023.01.08.12.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 12:35:38 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@csie.org, samuel@sholland.org, gregkh@linuxfoundation.org,
 christophe.jaillet@wanadoo.fr, tglx@linutronix.de, arnd@arndb.de,
 mripard@kernel.org, broonie@kernel.org, olof@lixom.net,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Yuan Can <yuancan@huawei.com>
Cc: yuancan@huawei.com
Subject: Re: [PATCH] bus: sunxi-rsb: Fix error handling in sunxi_rsb_init()
Date: Sun, 08 Jan 2023 21:35:36 +0100
Message-ID: <2247193.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20221123094200.12036-1-yuancan@huawei.com>
References: <20221123094200.12036-1-yuancan@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 23. november 2022 ob 10:42:00 CET je Yuan Can napisal(a):
> The sunxi_rsb_init() returns the platform_driver_register() directly
> without checking its return value, if platform_driver_register() failed,
> the sunxi_rsb_bus is not unregistered.
> Fix by unregister sunxi_rsb_bus when platform_driver_register() failed.
> 
> Fixes: d787dcdb9c8f ("bus: sunxi-rsb: Add driver for Allwinner Reduced
> Serial Bus") Signed-off-by: Yuan Can <yuancan@huawei.com>

Applied, thanks!

Best regards,
Jernej


