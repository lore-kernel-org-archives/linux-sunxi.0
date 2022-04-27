Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7F33D89
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:43:18 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id z19so3120124edx.9
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fRTSf3OFUO3Ov2OG6//9Y/Zs5QkYiUMty4PfzS6Pw88=;
        b=MbJJ2/fQkmJqHxuDnh1idvE1Rq6/Wyuwo26T19/A1gPUL95TQBO8nvJbRgNJCbx8ye
         nwoLM/9YwrkHRQ+CeJsokv5qyB2AWbBogJbe5rO6XMIFkNkcPDnzoctxoaHxh0tOPHWt
         4Pg7zYg3BFHEDTflbH0rC34Y4hNFNcwr+hIfxFJ/U/BZBxKX7F0B1jQzus4/ri2wSM2x
         8pjfI4LbRdPJvuD54/yGXY9N+DPyOswi31zzrezV8N8l7ofcgHBYFJgV1LaBrHaMup35
         uxsoTnH4/gZv2In0XiibN5EIACWiS8MExzNRuiFWcBIXAZL5P8FyJogdS1DhJOvlYFPH
         5wnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fRTSf3OFUO3Ov2OG6//9Y/Zs5QkYiUMty4PfzS6Pw88=;
        b=JI6ljPGsYzQ9ku9ATpjWzKhUv5rEds60u+pfwJlwu2SfYE1VUEXBXZImovBtQM5OGY
         b8EzjDBsVqI7Aw8efpCMxwCFDQyKppekVs8Gj8JCnnzVJ3pROtJ1ecN3sGFQiEANjMRl
         wRpVZMh84JSvYTlgxW1a23P9X2Tm0PcxsPbQwk5tE7pZUMZJTusF3W8YAA/8oNP5Djes
         9no78mY3lZ+bVK7PCfiPOUIgQbrcZoi8usbnWZXsCZf7W5bfPc8FcU9e8piJsdpFi8Ev
         qbjL8Fsvm7NwIqy6Qaw6c0Wv9qQXmnx8lSa/QdL1n5l+Z8gCaqB7Qoatj8s3bjw6V8pv
         mnFg==
X-Gm-Message-State: AOAM5337rUKseqj3zGQhW/omSsMfgXlS53SKvVKF1D3leOPipcFws/dA
	fzZsyhTKlHFhZTMRQovzshU=
X-Google-Smtp-Source: ABdhPJzqbBDGj6C5ws1Cy8I7RurUGngUK7z1A4LZt31ljvQP/9oRlPak4EVQ7x7QZ5L5AVPo2HLFrw==
X-Received: by 2002:a50:f69b:0:b0:425:e693:5d1f with SMTP id d27-20020a50f69b000000b00425e6935d1fmr18850662edn.272.1651088597073;
        Wed, 27 Apr 2022 12:43:17 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id la10-20020a170907780a00b006e889ee7741sm7229248ejc.75.2022.04.27.12.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:43:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 33/45] media: sun6i-csi: Introduce format match structure, list and helper
Date: Wed, 27 Apr 2022 21:43:15 +0200
Message-ID: <825545110.0ifERbkFSE@jernej-laptop>
In-Reply-To: <20220415152811.636419-34-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-34-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:27:59 CEST je Paul Kocialkowski napisal(a):
> Introduce a list of mbus/pixel format combinations that need an exact
> match between the two sides. This is the case when using raw input
> configuration. The list will be used to replace the
> sun6i_csi_is_format_supported combinatory helper.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


