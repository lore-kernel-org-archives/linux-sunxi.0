Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B314F7C
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 21:13:13 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id d14so12655122edj.11
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 13:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5DqHIDmrHfhCQggW33H8nWQX3fqTCf2oAlK8O9rUWA=;
        b=pGuvXBzT5oJu3sgp2Rp2+o8C4e3hA0OKqJhW2nHdPl7nL6ad5zB/8nPi2OIghIQ0V6
         t9U74brd6/Bu2koBu6ejSAinlP/u2GpXUEzKCjp60qYE6fq/THL3p2RjCXTbAas7t0LR
         IZKDllHwD2HKvmQ7v+A/pFlZ2uJNgzJLvnlZuh5DnQfXYJQH3JzLtp29TcEmVibO7+Wk
         lY+L2gg2jNCT9EPveS3bxNluLdcwuhllpsKY9UGFcFTMTI2AwhDwFqiUCM4xdGsjRF2q
         rTVwL7g4iLnEzNMqza5d2KlqzJkulhBSZjTaimpnpqpJSFvX3/148P1A3yoGpQCHHXj7
         fy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5DqHIDmrHfhCQggW33H8nWQX3fqTCf2oAlK8O9rUWA=;
        b=zbp9fmMYxLOAbHR+eSdqjpkKOuCzoWExAiLdB6dA6T7b+6ZENJl7IbGmVKNgTExtOL
         x92pQLf+6/PnqMu9z3rtLGCelIul50tmWlDCpnAN/mDQAUDzeSYpi18Emo/6ej4woqYW
         E5gp/lgUAr8Q4HGPN6ukArm/kdxr28mrpkIE+n2k/03+GTPRB2dToHEs80xHz1iR0Exy
         IZGetti3Z+XbDKn3zVthNnWlVMVwiFpoElnCBbDodgdB9Kvtb6q2nG24cayx6bYB/AZE
         AYIGYxb1aRy0kPYFCAd+VU3HuFAKcMGXoZcwVaDsFYbUU0YCBTuoisfbUeRDWvIeyWqk
         sqKw==
X-Gm-Message-State: ANoB5pktWVgE4VItFstlET5Ew55x6DgyXmy5ah+rR9I9xSnyef4hiyKD
	72tv4GvhbUqvBzchKqg28uc=
X-Google-Smtp-Source: AA0mqf6no0prdcHyRJGFht9oQsfv+s7cNBk3Kj9JIG4r90NDPfjf+QecJv67gXMCRmhrPLeJtQyQaw==
X-Received: by 2002:aa7:c9d0:0:b0:458:ed79:ed5 with SMTP id i16-20020aa7c9d0000000b00458ed790ed5mr59952386edt.374.1670274792060;
        Mon, 05 Dec 2022 13:13:12 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id r11-20020a056402034b00b0045bd14e241csm218876edw.76.2022.12.05.13.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 13:13:11 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@csie.org, samuel@sholland.org, gregkh@linuxfoundation.org, christophe.jaillet@wanadoo.fr, tglx@linutronix.de, arnd@arndb.de, mripard@kernel.org, broonie@kernel.org, olof@lixom.net, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Yuan Can <yuancan@huawei.com>
Cc: yuancan@huawei.com
Subject: Re: [PATCH] bus: sunxi-rsb: Fix error handling in sunxi_rsb_init()
Date: Mon, 05 Dec 2022 22:13:10 +0100
Message-ID: <2730519.BEx9A2HvPv@kista>
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

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


