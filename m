Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B263FC2
	for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 19:01:06 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id u16so696731wrn.5
        for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 12:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GaO4Y8XjQpzWxvDdexo754mM2cY3NapS9Dixf6RCivI=;
        b=YUG3gg4HztKsujLCsWJkVM63g5Ld67nElGVgmaaKpnO00peskYekUXADHXQacrLLGZ
         o4kXYmPzBOKFaZilUon4gZHiF50Ky/lT2mqJjuPaMZ+J8UbDEvFQz6btJTc7yvwOjRm2
         MsPulb8kG37VQyBoPlAQ93dGI1slLOtc4kRiF7UBlHF8R4bsNs2nMQ/vG2vU4YOWWNPf
         aHuHQqGdNBST9fzF0d4kW3VGCet8xSyjzRnp5/WwZlcEmkIMlcudjGv2ljcmAfGiLiFz
         DsbIDLvg6yBpIL6zjIqn+Yxlo2uiGL8StBibDApyH4aHAgaaYWn6iEKqIBmQxbjM94Mi
         uXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GaO4Y8XjQpzWxvDdexo754mM2cY3NapS9Dixf6RCivI=;
        b=L0lmLLrp2fWsUNAs8sIRobLEmp5XY20zv+arARkeSqgydYFEMExb4WF21v1ANn4zIA
         wCoBAPeUHZ32M/78JndIlRRVFjRzAet0TxGtOOAijb1hJukCqXqSKp9Fbd/nMFtebmyv
         l5brqlgWtiz+fcKpmFUQ5ctXjTkGq7gFHrAs+VkusarBR3M0+vG0/KA1JAimIqSleIaF
         w7u4q21XR5D4apwed/SV/xkoy3Myd5s9kOCfCMd2sEjD4PoDshO9BigIb+Y1LgVL+qw4
         eTjwxMdtRShytDO7jcRVIbFmyMCgUCAgdHB5FvnAHXHoA9CyrihB8dzL4CMJGX5nNlTv
         IPJQ==
X-Gm-Message-State: AOAM531IIM9LxLorI3//OfoEknvNAvJWmETRYU4oMp02onjFYtIc5br4
	A0szeeQS9AnbanOHxxMz3vE=
X-Google-Smtp-Source: ABdhPJxOmIjlk4xNGEooBmwcvg3/uM6eZEOaaAuISu6L6yMnHMyNxJUsSeX6S3KIALWZ26cW9yF9cQ==
X-Received: by 2002:a5d:6e91:: with SMTP id k17mr33391524wrz.77.1630436464829;
        Tue, 31 Aug 2021 12:01:04 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id j17sm18906057wrh.67.2021.08.31.12.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 12:01:04 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: caihuoqing@baidu.com, Cai Huoqing <caihuoqing@baidu.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Make use of the helper function devm_platform_ioremap_resource()
Date: Tue, 31 Aug 2021 21:01:03 +0200
Message-ID: <3342147.tElmWuj8HH@kista>
In-Reply-To: <20210831135740.4826-1-caihuoqing@baidu.com>
References: <20210831135740.4826-1-caihuoqing@baidu.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi!

Dne torek, 31. avgust 2021 ob 15:57:39 CEST je Cai Huoqing napisal(a):
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


