Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBF72C9D
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Jan 2022 07:09:04 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id d19so8476890wrb.0
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Jan 2022 23:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YsdeaXjgHbZ2/UfrJWYVySumeY+Y3zjY30iyayv+RHE=;
        b=YHDgzL7WyBtEUR5hXa+9UD9QL2wlkZk0puGcMYbYGKfw+oWJegrU708+J4NceKDDsK
         pYHz/tmIrus1E00ZQfDa4HFHXgjrINdYbO5jCcx9+ZDp2/5Kvn8T5A7xInAw8CvWJfov
         hXOY+fNqvnBqvNCnGEng5/yKvCgSHgy7LTrvSuMWqgKNfMeRcc1Z21/pUPWv2S5drNRT
         gS++S66nwOdNa+vEotHLdWBPuis3bTrKI0Z10bhoGYldMYYmpTnfWYfFWYjfpnw2l9co
         lMykJ+lXR3gHmqg/WqQpYb+z/9ao5RpmNpYWvgZxlAVfvA71scx5xw9IBIQ00QZ8eFVz
         Tfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YsdeaXjgHbZ2/UfrJWYVySumeY+Y3zjY30iyayv+RHE=;
        b=p/K3MWIqAnlFH/tYOzxesoV5Z1PoP+3KY4V1eMwJjI61RFDgGVtvacAj0LbomLY29Q
         GJW4Jv13c8yKCnI5Q4LdohD+mSTKmVxcug/ZJzx80x8oL+L19ERQ3xK/5RoDxVKeGbrZ
         yKwO2CvwMhm8f2gAqK+gwA6QxEkU6Tt/CtgDha+bBkkKw5onO58mz5nOK36cWJBLijUV
         3Fv6zDtqmrqmz4LAVmU1pszgR/tbhJ9ufK+8HT2HRSmdlzIs2GbmZ8scqPwVwijwQH8n
         dkQ76x8HxuwnXCbRlWmmvyYYSP1Wtvyinwrbu1wqNzb5N8Lyyoub7Ak8fdp4OYhdMJuc
         OvUA==
X-Gm-Message-State: AOAM533NKKLPffolQDaD5NdCgqrkWuc3Nie6rWXnsuvMNSkgSq8DiMYX
	GCfIUMn0zanETjY2CiA6HpI=
X-Google-Smtp-Source: ABdhPJzqetJSsCYuYg8dgmaoQV8E1NWvkLypktD5mjVTcd3MXAQUPCkeonxKhwbIZlKpWKgWPs1IyA==
X-Received: by 2002:a05:6000:18a6:: with SMTP id b6mr2583003wri.675.1642057742486;
        Wed, 12 Jan 2022 23:09:02 -0800 (PST)
Received: from jernej-laptop.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id n12sm5846038wms.32.2022.01.12.23.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 23:09:02 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Andre Przywara <andre.przywara@arm.com>
Cc: SASANO Takayoshi <uaa@mx5.nisiq.net>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] pinctrl: sunxi: Fix H616 I2S3 pin data
Date: Thu, 13 Jan 2022 08:09:01 +0100
Message-ID: <4368018.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20220105172952.23347-1-andre.przywara@arm.com>
References: <20220105172952.23347-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre!

Dne sreda, 05. januar 2022 ob 18:29:52 CET je Andre Przywara napisal(a):
> Two bugs have sneaked in the H616 pinctrl data:
> - PH9 uses the mux value of 0x3 twice (one should be 0x5 instead)
> - PH8 and PH9 use the "i2s3" function name twice in each pin
> 
> For the double pin name we use the same trick we pulled for i2s0: append
> the pin function to the group name to designate the special function.
> 
> Fixes: 25adc29407fb ("pinctrl: sunxi: Add support for the Allwinner H616 pin
> controller") Reported-by: SASANO Takayoshi <uaa@mx5.nisiq.net>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


